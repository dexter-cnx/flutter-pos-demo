import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thai_pos_demo/app/bootstrap.dart';
import 'package:thai_pos_demo/features/pos/domain/entities/product.dart';
import 'package:thai_pos_demo/features/pos/presentation/providers/cart_provider.dart';

void main() {
  group('CartProvider', () {
    late ProviderContainer container;

    setUp(() {
      sharedPreferences = null;
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
      sharedPreferences = null;
    });

    Product buildProduct({
      required String id,
      double price = 50,
      int stock = 10,
      bool available = true,
    }) {
      return Product(
        id: id,
        name: 'Product $id',
        price: price,
        sku: 'SKU-$id',
        stockQuantity: stock,
        isAvailable: available,
      );
    }

    test('adds new item to cart', () {
      final notifier = container.read(cartProvider.notifier);
      notifier.addItem(buildProduct(id: '1'));

      final state = container.read(cartProvider);
      expect(state.items, hasLength(1));
      expect(state.items.first.quantity, 1);
    });

    test('increments quantity for same product until stock limit', () {
      final notifier = container.read(cartProvider.notifier);
      final product = buildProduct(id: '1', stock: 2);

      notifier.addItem(product);
      notifier.addItem(product);
      notifier.addItem(product);

      final state = container.read(cartProvider);
      expect(state.items, hasLength(1));
      expect(state.items.first.quantity, 2);
    });

    test('does not add unavailable or zero stock products', () {
      final notifier = container.read(cartProvider.notifier);

      notifier.addItem(buildProduct(id: '1', available: false));
      notifier.addItem(buildProduct(id: '2', stock: 0));

      expect(container.read(cartProvider).items, isEmpty);
    });

    test('updates quantity and removes item when quantity reaches zero', () {
      final notifier = container.read(cartProvider.notifier);
      final product = buildProduct(id: '1');

      notifier.addItem(product);
      notifier.updateQuantity('1', 2);
      notifier.updateQuantity('1', -3);

      expect(container.read(cartProvider).items, isEmpty);
    });

    test('ignores quantity updates above stock quantity', () {
      final notifier = container.read(cartProvider.notifier);
      final product = buildProduct(id: '1', stock: 2);

      notifier.addItem(product);
      notifier.updateQuantity('1', 5);

      expect(container.read(cartProvider).items.first.quantity, 1);
    });

    test('calculates subtotal tax total and total items correctly', () {
      final notifier = container.read(cartProvider.notifier);
      notifier.addItem(buildProduct(id: '1', price: 100));
      notifier.addItem(buildProduct(id: '2', price: 50));
      notifier.updateQuantity('2', 1);

      final state = container.read(cartProvider);
      expect(state.subtotal, 200);
      expect(state.taxAmount, closeTo(14, 0.000001));
      expect(state.total, closeTo(214, 0.000001));
      expect(state.totalItems, 3);
    });

    test('clearCart resets state', () {
      final notifier = container.read(cartProvider.notifier);
      notifier.addItem(buildProduct(id: '1'));

      notifier.clearCart();

      expect(container.read(cartProvider), const CartState());
    });

    test('restores cart draft from shared preferences when isar is unavailable',
        () async {
      SharedPreferences.setMockInitialValues({
        'web_cart_draft_v1':
            '{"taxRate":0.07,"items":[{"quantity":2,"product":{"id":"1","name":"Product 1","price":50.0,"sku":"SKU-1","stockQuantity":10,"isAvailable":true,"imageUrl":null}}]}',
      });
      sharedPreferences = await SharedPreferences.getInstance();

      final webContainer = ProviderContainer();
      addTearDown(webContainer.dispose);

      final state = webContainer.read(cartProvider);
      expect(state.items, hasLength(1));
      expect(state.items.first.quantity, 2);
      expect(state.items.first.product.name, 'Product 1');
    });

    test('persists cart draft to shared preferences on web path', () async {
      SharedPreferences.setMockInitialValues({});
      sharedPreferences = await SharedPreferences.getInstance();

      final webContainer = ProviderContainer();
      addTearDown(webContainer.dispose);

      final notifier = webContainer.read(cartProvider.notifier);
      notifier.addItem(buildProduct(id: '1', price: 80));

      final raw = sharedPreferences!.getString('web_cart_draft_v1');
      expect(raw, isNotNull);
      expect(raw, contains('"quantity":1'));
      expect(raw, contains('"price":80.0'));

      notifier.clearCart();
      expect(sharedPreferences!.containsKey('web_cart_draft_v1'), isFalse);
    });
  });
}
