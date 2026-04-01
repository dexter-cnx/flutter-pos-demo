import 'package:easy_localization/easy_localization.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../orders/data/models/order_model.dart';
import '../../../orders/presentation/providers/order_history_provider.dart';

class ReceiptPreviewPage extends ConsumerWidget {
  const ReceiptPreviewPage({
    required this.orderId,
    super.key,
  });

  final int orderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderAsync = ref.watch(orderReceiptProvider(orderId));

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
      body: orderAsync.when(
        data: (order) {
          if (order == null) {
            return _MissingReceiptState(orderId: orderId);
          }

          return _ReceiptContent(order: order);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(error.toString())),
      ),
    );
  }
}

class _ReceiptContent extends StatelessWidget {
  const _ReceiptContent({required this.order});

  final OrderModel order;

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

  String _paymentLabel() {
    switch (order.paymentMethod) {
      case 'cash':
        return 'payment.cash'.tr();
      case 'qr':
        return 'payment.qr'.tr();
      case 'card':
        return 'payment.card'.tr();
      default:
        return order.paymentMethod;
    }
  }

  Future<Uint8List> _buildPdf(PdfPageFormat format) async {
    final baseFont = await PdfGoogleFonts.notoSansThaiRegular();
    final boldFont = await PdfGoogleFonts.notoSansThaiBold();
    final document = pw.Document();
    final dateText = DateFormat('dd/MM/yyyy HH:mm').format(order.createdAt);

    document.addPage(
      pw.MultiPage(
        pageFormat: format,
        margin: const pw.EdgeInsets.all(24),
        theme: pw.ThemeData.withFont(
          base: baseFont,
          bold: boldFont,
        ),
        build: (context) => [
          pw.Center(
            child: pw.Text(
              'receipt.title'.tr(),
              style: pw.TextStyle(font: boldFont, fontSize: 18),
            ),
          ),
          pw.SizedBox(height: 6),
          pw.Center(child: pw.Text('receipt.thank_you'.tr())),
          pw.SizedBox(height: 20),
          pw.Text('${'receipt.order_no'.tr()}: #${order.id}'),
          pw.Text('${'receipt.date'.tr()}: $dateText'),
          pw.Text('${'checkout.payment_method'.tr()}: ${_paymentLabel()}'),
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
              ...order.items.map(
                (item) => pw.TableRow(
                  children: [
                    _pdfCell(item.productName, baseFont),
                    _pdfCell(item.quantity.toString(), baseFont),
                    _pdfCell(_currency(item.lineTotal), baseFont),
                  ],
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 16),
          _pdfSummaryRow(
              'pos.subtotal'.tr(), _currency(order.subtotal), baseFont),
          _pdfSummaryRow(
            '${'pos.vat'.tr()} (7%)',
            _currency(order.taxAmount),
            baseFont,
          ),
          _pdfSummaryRow('pos.total'.tr(), _currency(order.total), boldFont),
          _pdfSummaryRow(
            'payment.received_amount'.tr(),
            _currency(order.receivedAmount),
            baseFont,
          ),
          _pdfSummaryRow(
              'payment.change'.tr(), _currency(order.changeAmount), baseFont),
          pw.SizedBox(height: 20),
          pw.Divider(),
          pw.Center(child: pw.Text('receipt.footer'.tr())),
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

  Future<void> _showPrintSimulation(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('receipt.print_simulation'.tr()),
          content:
              Text('receipt.simulation_message'.tr(args: ['#${order.id}'])),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('common.back'.tr()),
            ),
          ],
        );
      },
    );
  }

  Future<void> _printReceipt(BuildContext context) async {
    try {
      await Printing.layoutPdf(
        name: 'receipt-${order.id}.pdf',
        onLayout: _buildPdf,
      );
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('receipt.print_failed'.tr()),
        ),
      );
    }
  }

  Future<void> _shareReceipt(BuildContext context) async {
    try {
      final bytes = await _buildPdf(PdfPageFormat.a4);
      await Printing.sharePdf(
        bytes: bytes,
        filename: 'receipt-${order.id}.pdf',
      );
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('receipt.share_failed'.tr()),
        ),
      );
    }
  }

  Future<void> _downloadReceipt(BuildContext context) async {
    try {
      final fileName = 'receipt-${order.id}.pdf';
      final location = await getSaveLocation(
        suggestedName: fileName,
        acceptedTypeGroups: const [
          XTypeGroup(
            label: 'PDF',
            extensions: ['pdf'],
          ),
        ],
      );

      if (location == null) {
        return;
      }

      final bytes = await _buildPdf(PdfPageFormat.a4);
      final pdfFile = XFile.fromData(
        bytes,
        mimeType: 'application/pdf',
        name: fileName,
      );
      await pdfFile.saveTo(location.path);

      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('receipt.download_success'.tr()),
        ),
      );
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('receipt.download_failed'.tr()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateText = DateFormat('dd/MM/yyyy HH:mm').format(order.createdAt);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 1100;
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
                    'receipt.title'.tr(),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text('receipt.thank_you'.tr()),
                  const SizedBox(height: 20),
                  _DetailRow(
                    label: 'receipt.order_no'.tr(),
                    value: '#${order.id}',
                  ),
                  _DetailRow(
                    label: 'receipt.date'.tr(),
                    value: dateText,
                  ),
                  _DetailRow(
                    label: 'checkout.payment_method'.tr(),
                    value: _paymentLabel(),
                  ),
                  const Divider(height: 32),
                  Text(
                    'checkout.items'.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  ...order.items.map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.productName,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '${item.quantity} x ${_currency(item.unitPrice)}',
                                ),
                              ],
                            ),
                          ),
                          Text(_currency(item.lineTotal)),
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 32),
                  _DetailRow(
                    label: 'pos.subtotal'.tr(),
                    value: _currency(order.subtotal),
                  ),
                  _DetailRow(
                    label: '${'pos.vat'.tr()} (7%)',
                    value: _currency(order.taxAmount),
                  ),
                  _DetailRow(
                    label: 'pos.total'.tr(),
                    value: _currency(order.total),
                    emphasized: true,
                  ),
                  const SizedBox(height: 8),
                  _DetailRow(
                    label: 'payment.received_amount'.tr(),
                    value: _currency(order.receivedAmount),
                  ),
                  _DetailRow(
                    label: 'payment.change'.tr(),
                    value: _currency(order.changeAmount),
                  ),
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
                          onPressed: () => _downloadReceipt(context),
                          icon: const Icon(Icons.download_outlined),
                          label: Text('receipt.download_pdf'.tr()),
                        ),
                      OutlinedButton.icon(
                        onPressed: () => _printReceipt(context),
                        icon: const Icon(Icons.print),
                        label: Text('receipt.print'.tr()),
                      ),
                      OutlinedButton.icon(
                        onPressed: () => _shareReceipt(context),
                        icon: const Icon(Icons.share_outlined),
                        label: Text('receipt.share_pdf'.tr()),
                      ),
                      OutlinedButton.icon(
                        onPressed: () => _showPrintSimulation(context),
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
                      build: _buildPdf,
                      canChangeOrientation: false,
                      canChangePageFormat: false,
                      canDebug: false,
                      allowSharing: true,
                      allowPrinting: true,
                      pdfFileName: 'receipt-${order.id}.pdf',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

        if (isWide) {
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
            SizedBox(height: constraints.maxHeight * 0.55, child: pdfCard),
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
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.receipt_long_outlined, size: 72),
            const SizedBox(height: 16),
            Text(
              'receipt.not_found'.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'receipt.not_found_hint'.tr(args: ['#$orderId']),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () => context.go('/history'),
              child: Text('receipt.view_history'.tr()),
            ),
          ],
        ),
      ),
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
