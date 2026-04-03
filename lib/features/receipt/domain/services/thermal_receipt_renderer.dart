import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:intl/intl.dart';
import '../entities/receipt_document.dart';
import './receipt_renderer.dart';

/// Renders a ReceiptDocument into ESC/POS bytes for 58mm thermal printers.
class ThermalReceiptRenderer implements ReceiptRenderer<List<int>> {
  final PaperSize paperSize;

  ThermalReceiptRenderer({this.paperSize = PaperSize.mm58});

  @override
  Future<List<int>> render(ReceiptDocument doc) async {
    final profile = await CapabilityProfile.load();
    final generator = Generator(paperSize, profile);
    final bytes = <int>[];

    // Header
    bytes.addAll(generator.text(
      doc.storeName,
      styles: const PosStyles(
        bold: true,
        align: PosAlign.center,
        height: PosTextSize.size2,
      ),
    ));

    if (doc.storeAddress != null && doc.storeAddress!.isNotEmpty) {
      bytes.addAll(generator.text(
        doc.storeAddress!,
        styles: const PosStyles(align: PosAlign.center),
      ));
    }

    if (doc.storePhone != null && doc.storePhone!.isNotEmpty) {
      bytes.addAll(generator.text(
        'Tel: ${doc.storePhone!}',
        styles: const PosStyles(align: PosAlign.center),
      ));
    }

    if (doc.storeTaxId != null && doc.storeTaxId!.isNotEmpty) {
      bytes.addAll(generator.text(
        'TAX ID: ${doc.storeTaxId!}',
        styles: const PosStyles(align: PosAlign.center),
      ));
    }

    bytes.addAll(generator.hr());

    // Order Info
    final dateText = DateFormat('dd/MM/yyyy HH:mm').format(doc.timestamp);
    bytes.addAll(generator.text('Order: #${doc.transactionId}'));
    bytes.addAll(generator.text('Date: $dateText'));
    bytes.addAll(generator.text('Payment: ${doc.paymentMethod}'));
    bytes.addAll(generator.hr());

    // Items
    for (final line in doc.lines) {
      bytes.addAll(generator.text(line.name));
      bytes.addAll(generator.row([
        PosColumn(
          text: '  ${line.quantity} x ${_currency(line.unitPrice)}',
          width: 8,
        ),
        PosColumn(
          text: _currency(line.totalPrice),
          width: 4,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]));
      if (line.note != null && line.note!.isNotEmpty) {
        bytes.addAll(generator.text('  (${line.note})',
            styles: const PosStyles()));
      }
    }

    bytes.addAll(generator.hr());

    // Totals
    bytes.addAll(generator.row([
      PosColumn(text: 'Subtotal', width: 8),
      PosColumn(
        text: _currency(doc.subtotal),
        width: 4,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]));

    bytes.addAll(generator.row([
      PosColumn(text: 'VAT 7%', width: 8),
      PosColumn(
        text: _currency(doc.taxAmount),
        width: 4,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]));

    bytes.addAll(generator.hr());

    bytes.addAll(generator.row([
      PosColumn(
        text: 'TOTAL',
        width: 8,
        styles: const PosStyles(bold: true),
      ),
      PosColumn(
        text: _currency(doc.total),
        width: 4,
        styles: const PosStyles(bold: true, align: PosAlign.right),
      ),
    ]));

    if (doc.paymentMethod.toLowerCase() == 'cash') {
      bytes.addAll(generator.row([
        PosColumn(text: 'Received', width: 8),
        PosColumn(
          text: _currency(doc.receivedAmount),
          width: 4,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]));
      bytes.addAll(generator.row([
        PosColumn(text: 'Change', width: 8),
        PosColumn(
          text: _currency(doc.changeAmount),
          width: 4,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]));
    }

    bytes.addAll(generator.hr());

    // Footer
    if (doc.footerNote != null && doc.footerNote!.isNotEmpty) {
      bytes.addAll(generator.text(
        doc.footerNote!,
        styles: const PosStyles(align: PosAlign.center),
      ));
    }

    bytes.addAll(generator.text(
      'Thank you!',
      styles: const PosStyles(align: PosAlign.center),
    ));

    bytes.addAll(generator.feed(3));
    bytes.addAll(generator.cut());

    return bytes;
  }

  String _currency(double v) => '\u0e3f${v.toStringAsFixed(2)}';
}
