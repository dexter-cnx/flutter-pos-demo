import '../../../orders/data/models/order_model.dart';
import '../../../settings/domain/entities/store_profile.dart';
import '../entities/receipt_document.dart';
import '../services/receipt_composer.dart';

/// Composes a restaurant receipt document.
/// Adds table number and service charge if needed.
class RestaurantReceiptComposer implements ReceiptComposer {
  @override
  ReceiptDocument compose({
    required OrderModel order,
    required StoreProfile storeProfile,
  }) {
    // For restaurant mode, we might want to prefix the Transaction ID or add Table details
    // In this basic version, we just add a "Table" field to the footer or similar
    
    return ReceiptDocument(
      storeName: storeProfile.storeName,
      storeAddress: storeProfile.storeAddress,
      storePhone: storeProfile.storePhone,
      storeTaxId: storeProfile.storeTaxId,
      transactionId: 'R-${order.id}',
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
      paymentMethod: _paymentLabel(order.paymentMethod),
      receivedAmount: order.receivedAmount,
      changeAmount: order.changeAmount,
      footerNote: '${storeProfile.receiptFooter}\n--- Table Number: Pending ---',
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
