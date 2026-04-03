import 'package:easy_localization/easy_localization.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../../app/layout/responsive_layout.dart';
import '../../../../app/widgets/async_state_view.dart';
import '../../../../app/mode/current_mode_provider.dart';
import '../../../orders/data/models/order_model.dart';
import '../../../orders/presentation/providers/order_history_provider.dart';
import '../../../settings/domain/entities/store_profile.dart';
import '../../../settings/presentation/providers/settings_providers.dart';
import '../../domain/entities/receipt_document.dart';
import '../providers/receipt_actions_providers.dart';
import '../services/desktop_file_actions.dart';

class ReceiptPreviewPage extends ConsumerWidget {
  const ReceiptPreviewPage({required this.orderId, super.key});

  final int orderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderAsync = ref.watch(orderReceiptProvider(orderId));
    final storeProfileAsync = ref.watch(storeProfileProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.go('/history'),
        ),
        title: Text('receipt.title'.tr()),
        actions: [
          TextButton(
            onPressed: () => context.go('/'),
            child: Text('receipt.back_to_pos'.tr()),
          ),
        ],
      ),
      body: storeProfileAsync.when(
        data: (storeProfile) => orderAsync.when(
          data: (order) {
            if (order == null) {
              return _MissingReceiptState(orderId: orderId);
            }

            return _ReceiptContent(order: order, storeProfile: storeProfile);
          },
          loading: () => const AppLoadingState(),
          error: (error, _) => AppErrorState(
            message: error.toString(),
            onRetry: () => ref.invalidate(orderReceiptProvider(orderId)),
          ),
        ),
        loading: () => const AppLoadingState(),
        error: (error, _) => AppErrorState(
          message: error.toString(),
          onRetry: () => ref.invalidate(storeProfileProvider),
        ),
      ),
    );
  }
}

class _ReceiptContent extends ConsumerWidget {
  const _ReceiptContent({required this.order, required this.storeProfile});

  final OrderModel order;
  final StoreProfile storeProfile;

  String _currency(double value) => '\u0E3F${value.toStringAsFixed(2)}';

  bool get _supportsDownload {
    if (kIsWeb) return true;

    switch (defaultTargetPlatform) {
      case TargetPlatform.windows:
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
        return true;
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return false;
    }
  }

  bool get _supportsDesktopOpenActions => !kIsWeb && _supportsDownload;

  ReceiptDocument _composeDocument(WidgetRef ref) {
    final modeDef = ref.read(currentModeDefinitionProvider);
    return modeDef.receiptComposer.compose(
      order: order,
      storeProfile: storeProfile,
    );
  }

  Future<Uint8List> _buildPdf(PdfPageFormat format, ReceiptDocument doc) async {
    final baseFont = await PdfGoogleFonts.notoSansThaiRegular();
    final boldFont = await PdfGoogleFonts.notoSansThaiBold();
    final document = pw.Document();
    final dateText = DateFormat('dd/MM/yyyy HH:mm').format(doc.timestamp);

    document.addPage(
      pw.MultiPage(
        pageFormat: format,
        margin: const pw.EdgeInsets.all(24),
        theme: pw.ThemeData.withFont(base: baseFont, bold: boldFont),
        build: (context) => [
          pw.Center(
            child: pw.Text(
              doc.storeName,
              style: pw.TextStyle(font: boldFont, fontSize: 18),
            ),
          ),
          if (doc.storeAddress != null) ...[
            pw.SizedBox(height: 6),
            pw.Center(child: pw.Text(doc.storeAddress!)),
          ],
          if (doc.storeTaxId != null)
            pw.Center(
              child: pw.Text(
                '${'receipt.tax_id'.tr()}: ${doc.storeTaxId}',
              ),
            ),
          if (doc.storePhone != null)
            pw.Center(
              child: pw.Text(
                '${'receipt.phone'.tr()}: ${doc.storePhone}',
              ),
            ),
          pw.SizedBox(height: 8),
          pw.Center(child: pw.Text('receipt.thank_you'.tr())),
          pw.SizedBox(height: 20),
          pw.Text('${'receipt.order_no'.tr()}: #${doc.transactionId}'),
          pw.Text('${'receipt.date'.tr()}: $dateText'),
          pw.Text('${'checkout.payment_method'.tr()}: ${doc.paymentMethod}'),
          pw.SizedBox(height: 16),
          pw.Table(
            border: pw.TableBorder.all(color: PdfColors.grey400),
            columnWidths: const {
              0: pw.FlexColumnWidth(4),
              1: pw.FlexColumnWidth(1.2),
              2: pw.FlexColumnWidth(2),
            },
            children: [
              pw.TableRow(
                decoration: const pw.BoxDecoration(color: PdfColors.grey200),
                children: [
                  _pdfCell('checkout.items'.tr(), boldFont),
                  _pdfCell('receipt.qty'.tr(), boldFont),
                  _pdfCell('common.total'.tr(), boldFont),
                ],
              ),
              ...doc.lines.map(
                (line) => pw.TableRow(
                  children: [
                    _pdfCell(line.name, baseFont),
                    _pdfCell(line.quantity.toString(), baseFont),
                    _pdfCell(_currency(line.totalPrice), baseFont),
                  ],
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 16),
          _pdfSummaryRow(
            'pos.subtotal'.tr(),
            _currency(doc.subtotal),
            baseFont,
          ),
          _pdfSummaryRow(
            '${'pos.vat'.tr()} (7%)',
            _currency(doc.taxAmount),
            baseFont,
          ),
          _pdfSummaryRow('pos.total'.tr(), _currency(doc.total), boldFont),
          _pdfSummaryRow(
            'payment.received_amount'.tr(),
            _currency(doc.receivedAmount),
            baseFont,
          ),
          _pdfSummaryRow(
            'payment.change'.tr(),
            _currency(doc.changeAmount),
            baseFont,
          ),
          if (doc.footerNote != null) ...[
            pw.SizedBox(height: 20),
            pw.Divider(),
            pw.Center(child: pw.Text(doc.footerNote!)),
          ],
        ],
      ),
    );

    return document.save();
  }

  pw.Widget _pdfCell(String value, pw.Font font) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Text(value, style: pw.TextStyle(font: font, fontSize: 11)),
    );
  }

  pw.Widget _pdfSummaryRow(String label, String value, pw.Font font) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 2),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(label, style: pw.TextStyle(font: font)),
          pw.Text(value, style: pw.TextStyle(font: font)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doc = _composeDocument(ref);
    final lastDownloadedPath = ref.watch(
      downloadedReceiptPathProvider(order.id),
    );
    final dateText = DateFormat('dd/MM/yyyy HH:mm').format(doc.timestamp);

    return LayoutBuilder(
      builder: (context, constraints) {
        final responsive = ResponsiveLayout.fromConstraints(constraints);
        final summary = SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doc.storeName,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  if (doc.storeAddress != null) ...[
                    const SizedBox(height: 8),
                    Text(doc.storeAddress!),
                  ],
                  if (doc.storeTaxId != null) ...[
                    const SizedBox(height: 4),
                    Text('${'receipt.tax_id'.tr()}: ${doc.storeTaxId}'),
                  ],
                  if (doc.storePhone != null)
                    Text('${'receipt.phone'.tr()}: ${doc.storePhone}'),
                  const SizedBox(height: 8),
                  Text('receipt.thank_you'.tr()),
                  const SizedBox(height: 20),
                  _DetailRow(
                    label: 'receipt.order_no'.tr(),
                    value: '#${doc.transactionId}',
                  ),
                  _DetailRow(label: 'receipt.date'.tr(), value: dateText),
                  _DetailRow(
                    label: 'checkout.payment_method'.tr(),
                    value: doc.paymentMethod,
                  ),
                  const Divider(height: 32),
                  Text(
                    'checkout.items'.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  ...doc.lines.map(
                    (line) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  line.name,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '${line.quantity} x ${_currency(line.unitPrice)}',
                                ),
                              ],
                            ),
                          ),
                          Text(_currency(line.totalPrice)),
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 32),
                  _DetailRow(
                    label: 'pos.subtotal'.tr(),
                    value: _currency(doc.subtotal),
                  ),
                  _DetailRow(
                    label: '${'pos.vat'.tr()} (7%)',
                    value: _currency(doc.taxAmount),
                  ),
                  _DetailRow(
                    label: 'pos.total'.tr(),
                    value: _currency(doc.total),
                    emphasized: true,
                  ),
                  const SizedBox(height: 8),
                  _DetailRow(
                    label: 'payment.received_amount'.tr(),
                    value: _currency(doc.receivedAmount),
                  ),
                  _DetailRow(
                    label: 'payment.change'.tr(),
                    value: _currency(doc.changeAmount),
                  ),
                  if (doc.footerNote != null) ...[
                    const SizedBox(height: 24),
                    Text(
                      doc.footerNote!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      FilledButton.icon(
                        onPressed: () => context.go('/'),
                        icon: const Icon(Icons.point_of_sale),
                        label: Text('receipt.back_to_pos'.tr()),
                      ),
                      OutlinedButton.icon(
                        onPressed: () => context.go('/history'),
                        icon: const Icon(Icons.history),
                        label: Text('receipt.view_history'.tr()),
                      ),
                      if (_supportsDownload)
                        OutlinedButton.icon(
                          onPressed: () async {
                            final fileName = 'receipt-${doc.transactionId}.pdf';
                            final location = await getSaveLocation(
                              suggestedName: fileName,
                              acceptedTypeGroups: const [
                                XTypeGroup(label: 'PDF', extensions: ['pdf']),
                              ],
                            );
                            if (location == null) return;
                            final bytes = await _buildPdf(PdfPageFormat.a4, doc);
                            final pdfFile = XFile.fromData(
                              bytes,
                              mimeType: 'application/pdf',
                              name: fileName,
                            );
                            await pdfFile.saveTo(location.path);
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('receipt.download_success'.tr()),
                            ));
                            ref.read(downloadedReceiptPathProvider(order.id).notifier).setPath(location.path);
                          },
                          icon: const Icon(Icons.download_outlined),
                          label: Text('receipt.download_pdf'.tr()),
                        ),
                      if (_supportsDesktopOpenActions &&
                          lastDownloadedPath != null)
                        OutlinedButton.icon(
                          onPressed: () async {
                            await openSavedFile(lastDownloadedPath);
                          },
                          icon: const Icon(Icons.insert_drive_file_outlined),
                          label: Text('receipt.open_saved_file'.tr()),
                        ),
                      if (_supportsDesktopOpenActions &&
                          lastDownloadedPath != null)
                        OutlinedButton.icon(
                          onPressed: () async {
                            await openContainingFolder(lastDownloadedPath);
                          },
                          icon: const Icon(Icons.folder_open_outlined),
                          label: Text('receipt.open_folder'.tr()),
                        ),
                      OutlinedButton.icon(
                        onPressed: () async {
                          await Printing.layoutPdf(
                            name: 'receipt-${doc.transactionId}.pdf',
                            onLayout: (format) => _buildPdf(format, doc),
                          );
                        },
                        icon: const Icon(Icons.print),
                        label: Text('receipt.print'.tr()),
                      ),
                      OutlinedButton.icon(
                        onPressed: () async {
                          final bytes = await _buildPdf(PdfPageFormat.a4, doc);
                          await Printing.sharePdf(
                            bytes: bytes,
                            filename: 'receipt-${doc.transactionId}.pdf',
                          );
                        },
                        icon: const Icon(Icons.share_outlined),
                        label: Text('receipt.share_pdf'.tr()),
                      ),
                      OutlinedButton.icon(
                        onPressed: () async {
                          await showDialog<void>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('receipt.print_simulation'.tr()),
                              content: Text('receipt.simulation_message'.tr(args: ['#${doc.transactionId}'])),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('common.back'.tr()),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: const Icon(Icons.print_outlined),
                        label: Text('receipt.print_simulation'.tr()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );

        final pdfCard = Card(
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'receipt.pdf_preview'.tr(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: PdfPreview(
                      build: (format) => _buildPdf(format, doc),
                      canChangeOrientation: false,
                      canChangePageFormat: false,
                      canDebug: false,
                      allowSharing: true,
                      allowPrinting: true,
                      pdfFileName: 'receipt-${doc.transactionId}.pdf',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

        if (responsive.isSplitView) {
          return Row(
            children: [
              Expanded(flex: 2, child: summary),
              Expanded(flex: 3, child: pdfCard),
            ],
          );
        }

        return Column(
          children: [
            Expanded(child: summary),
            SizedBox(
              height:
                  constraints.maxHeight * responsive.receiptPreviewHeightFactor,
              child: pdfCard,
            ),
          ],
        );
      },
    );
  }
}

class _MissingReceiptState extends StatelessWidget {
  const _MissingReceiptState({required this.orderId});

  final int orderId;

  @override
  Widget build(BuildContext context) {
    return AppEmptyState(
      icon: Icons.receipt_long_outlined,
      title: 'receipt.not_found'.tr(),
      message: 'receipt.not_found_hint'.tr(args: ['#$orderId']),
      actionLabel: 'receipt.view_history'.tr(),
      onAction: () => context.go('/history'),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.label,
    required this.value,
    this.emphasized = false,
  });

  final String label;
  final String value;
  final bool emphasized;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyLarge?.copyWith(
      fontWeight: emphasized ? FontWeight.bold : FontWeight.normal,
      fontSize: emphasized ? 18 : null,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(label, style: style)),
          Text(value, style: style),
        ],
      ),
    );
  }
}
