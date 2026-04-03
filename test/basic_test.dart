import 'package:flutter_test/flutter_test.dart';
import 'package:thai_pos_demo/features/pos/domain/entities/product.dart';
import 'package:thai_pos_demo/features/pos/presentation/providers/cart_provider.dart';

void main() {
  group('Domain Model Tests', () {
    const product1 = Product(
      id: 'p1',
      name: 'Thai Tea',
      price: 45.0,
      sku: 'TTEA-01',
      stockQuantity: 100,
    );

    const product2 = Product(
      id: 'p1',
      name: 'Thai Tea',
      price: 45.0,
      sku: 'TTEA-01',
      stockQuantity: 100,
    );

    test('Product equality works correctly', () {
      expect(product1, product2);
      expect(product1 == product2, isTrue);
      expect(product1.hashCode == product2.hashCode, isTrue);
    });

    test('CartItem correctly calculates its state', () {
      const item = CartItem(product: product1, quantity: 3);
      
      expect(item.product.id, 'p1');
      expect(item.quantity, 3);
      
      final updatedItem = item.copyWith(quantity: 5);
      expect(updatedItem.quantity, 5);
      expect(updatedItem.product.id, 'p1'); // Ensure product is preserved
    });

    test('CartItem copyWith preserves existing values', () {
      const item = CartItem(product: product1, quantity: 2);
      final sameItem = item.copyWith();
      
      expect(item, sameItem);
    });
  });
}
