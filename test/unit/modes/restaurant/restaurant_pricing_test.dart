import 'package:flutter_test/flutter_test.dart';
import 'package:thai_pos_demo/modes/restaurant/restaurant_mode_definition.dart';
import 'package:thai_pos_demo/features/pos/domain/entities/product.dart';
import 'package:thai_pos_demo/features/pos/presentation/providers/cart_provider.dart';

void main() {
  group('RestaurantPricingEngine', () {
    const engine = RestaurantPricingEngine();

    final item1 = CartItem(
      product: const Product(id: '1', name: 'Water', price: 10.0, sku: '1', stockQuantity: 999),
      quantity: 2,
    );
    final item2 = CartItem(
      product: const Product(id: '2', name: 'Fried Rice', price: 50.0, sku: '2', stockQuantity: 999),
      quantity: 1,
    );

    test('calculates basic subtotal without metadata', () {
      final subtotal = engine.calculateSubtotal([item1, item2]);
      // (10 * 2) + (50 * 1) = 70
      expect(subtotal, 70.0);
    });

    test('calculates subtotal with headcount pricing', () {
      final metadata = {'headcount': 4, 'buffetPrice': 299.0};
      final subtotal = engine.calculateSubtotal([item1, item2], metadata: metadata);
      // ((10 * 2) + (50 * 1)) + (4 * 299) = 70 + 1196 = 1266
      expect(subtotal, 1266.0);
    });

    test('calculates tax (7%) correctly', () {
      final subtotal = 1000.0;
      final tax = engine.calculateTax(subtotal, 0.07);
      expect(tax, 70.0);
    });

    test('calculates total correctly', () {
      final subtotal = 1000.0;
      final tax = 70.0;
      expect(engine.calculateTotal(subtotal, tax), 1070.0);
    });
  });
}
