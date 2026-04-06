import '../../../orders/data/models/order_model.dart';
import '../../../settings/domain/entities/store_profile.dart';
import '../entities/receipt_document.dart';
import '../services/receipt_composer.dart';
import 'package:thai_pos_demo/core/money/tax_calculator.dart';

/// Composes a retail receipt document from order data and store profile.
class RetailReceiptComposer implements ReceiptComposer {
  const RetailReceiptComposer();
  @override
  ReceiptDocument compose({
    required OrderModel order,
    required StoreProfile storeProfile,
  }) {
    return ReceiptDocument(
      storeName: storeProfile.storeName,
      storeAddress: storeProfile.storeAddress,
      storePhone: storeProfile.storePhone,
      storeTaxId: storeProfile.storeTaxId,
      transactionId: order.id.toString(),
      timestamp: order.createdAt,
      lines: order.items
          .map((item) => ReceiptLine(
                name: item.productName,
                quantity: item.quantity,
                unitPrice: item.unitPrice,
                totalPrice: item.lineTotal,
              ))
          .toList(),
      subtotal: order.subtotal,
      taxAmount: order.taxAmount,
      total: order.total,
      taxBreakdown: TaxCalculator.calculateFromInclusive(order.total),
      paymentMethod: _paymentLabel(order.paymentMethod),
      receivedAmount: order.receivedAmount,
      changeAmount: order.changeAmount,
      footerNote: storeProfile.receiptFooter,
    );
  }

  String _paymentLabel(String method) {
    switch (method) {
      case 'cash':
        return 'Cash';
      case 'qr':
        return 'PromptPay QR';
      case 'card':
        return 'Card';
      default:
        return method.toUpperCase();
    }
  }
}
