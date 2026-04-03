import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:intl/intl.dart';

import '../../../orders/data/models/order_model.dart';
import '../../../settings/domain/entities/store_profile.dart';
import '../../domain/services/receipt_composer.dart';

/// Composes a 58mm ESC/POS retail receipt from an order and store profile.
/// Returns raw bytes only — caller is responsible for sending to printer.
class RetailReceiptComposer implements ReceiptComposer {
  @override
  Future<List<int>> compose({
    required OrderModel order,
    required StoreProfile storeProfile,
  }) async {
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);
    final bytes = <int>[];

    // Header
    bytes.addAll(generator.text(
      storeProfile.storeName,
      styles: const PosStyles(bold: true, align: PosAlign.center, height: PosTextSize.size2),
    ));
    if (storeProfile.storeAddress.isNotEmpty) {
      bytes.addAll(generator.text(
        storeProfile.storeAddress,
        styles: const PosStyles(align: PosAlign.center),
      ));
    }
    if (storeProfile.storePhone.isNotEmpty) {
      bytes.addAll(generator.text(
        'Tel: ${storeProfile.storePhone}',
        styles: const PosStyles(align: PosAlign.center),
      ));
    }
    if (storeProfile.storeTaxId.isNotEmpty) {
      bytes.addAll(generator.text(
        'TAX ID: ${storeProfile.storeTaxId}',
        styles: const PosStyles(align: PosAlign.center),
      ));
    }

    bytes.addAll(generator.hr());

    // Order info
    final dateText = DateFormat('dd/MM/yyyy HH:mm').format(order.createdAt);
    bytes.addAll(generator.text('Order: #${order.id}'));
    bytes.addAll(generator.text('Date: $dateText'));
    bytes.addAll(generator.text('Payment: ${_paymentLabel(order.paymentMethod)}'));
    bytes.addAll(generator.hr());

    // Items
    for (final item in order.items) {
      bytes.addAll(generator.text(item.productName));
      bytes.addAll(generator.row([
        PosColumn(
          text: '  ${item.quantity} x ${_currency(item.unitPrice)}',
          width: 8,
        ),
        PosColumn(
          text: _currency(item.lineTotal),
          width: 4,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]));
    }

    bytes.addAll(generator.hr());

    // Totals
    bytes.addAll(generator.row([
      PosColumn(text: 'Subtotal', width: 8),
      PosColumn(
        text: _currency(order.subtotal),
        width: 4,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]));
    bytes.addAll(generator.row([
      PosColumn(text: 'VAT 7%', width: 8),
      PosColumn(
        text: _currency(order.taxAmount),
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
        text: _currency(order.total),
        width: 4,
        styles: const PosStyles(bold: true, align: PosAlign.right),
      ),
    ]));

    if (order.paymentMethod == 'cash') {
      bytes.addAll(generator.row([
        PosColumn(text: 'Received', width: 8),
        PosColumn(
          text: _currency(order.receivedAmount),
          width: 4,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]));
      bytes.addAll(generator.row([
        PosColumn(text: 'Change', width: 8),
        PosColumn(
          text: _currency(order.changeAmount),
          width: 4,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]));
    }

    bytes.addAll(generator.hr());

    // Footer
    if (storeProfile.receiptFooter.isNotEmpty) {
      bytes.addAll(generator.text(
        storeProfile.receiptFooter,
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

  String _paymentLabel(String method) {
    switch (method) {
      case 'cash':
        return 'Cash';
      case 'qr':
        return 'PromptPay QR';
      case 'card':
        return 'Card';
      default:
        return method;
    }
  }
}
