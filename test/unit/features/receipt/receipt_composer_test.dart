import 'package:flutter_test/flutter_test.dart';
import 'package:thai_pos_demo/features/receipt/domain/services/retail_receipt_composer.dart';
import 'package:thai_pos_demo/features/receipt/domain/services/restaurant_receipt_composer.dart';
import 'package:thai_pos_demo/features/orders/data/models/order_model.dart';
import 'package:thai_pos_demo/features/settings/domain/entities/store_profile.dart';

void main() {
  group('Receipt Composers', () {
    final storeProfile = const StoreProfile(
      storeName: 'Test Store',
      storeAddress: '123 POS Road',
      storePhone: '081-222-3333',
      storeTaxId: 'TAX-123456',
      receiptFooter: 'See you again!',
    );

    final order = OrderModel()
      ..id = 999
      ..subtotal = 100.0
      ..taxAmount = 7.0
      ..total = 107.0
      ..paymentMethod = 'qr'
      ..receivedAmount = 107.0
      ..changeAmount = 0.0
      ..createdAt = DateTime(2026, 4, 3, 15, 30)
      ..items = [
        OrderItemModel()..productName = 'Item A'..quantity = 1..unitPrice = 100.0..lineTotal = 100.0
      ];

    test('RetailReceiptComposer maps fields correctly', () {
      final composer = const RetailReceiptComposer();
      final doc = composer.compose(order: order, storeProfile: storeProfile);

      expect(doc.storeName, 'Test Store');
      expect(doc.transactionId, '999');
      expect(doc.paymentMethod, 'PromptPay QR');
      expect(doc.total, 107.0);
      expect(doc.lines.length, 1);
      expect(doc.lines.first.name, 'Item A');
    });

    test('RestaurantReceiptComposer adds mode-specific details', () {
      final composer = const RestaurantReceiptComposer();
      final doc = composer.compose(order: order, storeProfile: storeProfile);

      // Restaurant composer prefixes the transaction ID
      expect(doc.transactionId, 'R-999');
      
      // Restaurant composer adds table placeholder to footer
      expect(doc.footerNote, contains('Table Number:'));
      expect(doc.footerNote, contains('See you again!'));
      
      expect(doc.paymentMethod, 'PromptPay QR');
      expect(doc.total, 107.0);
    });
  });
}
