import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thai_pos_demo/features/checkout/presentation/providers/checkout_providers.dart';
import 'package:thai_pos_demo/features/orders/presentation/providers/order_history_provider.dart';
import 'package:thai_pos_demo/features/pos/domain/entities/product.dart';
import 'package:thai_pos_demo/features/pos/presentation/providers/cart_provider.dart';

void main() {
  group('OrderHistory provider without Isar', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('returns empty orders list when database is unavailable', () async {
      final orders = await container.read(ordersProvider.future);
      expect(orders, isEmpty);
    });

    test('returns null receipt when database is unavailable', () async {
      final order = await container.read(orderReceiptProvider(1).future);
      expect(order, isNull);
    });

    test('returns zero order count when database is unavailable', () async {
      final count = await container.read(orderCountProvider.future);
      expect(count, 0);
    });

    test('does not save order when cart is empty', () async {
      final id = await container.read(orderHistoryProvider.notifier).saveOrder(
            cartState: const CartState(),
            method: PaymentMethod.cash,
            receivedAmount: 0,
            changeAmount: 0,
          );

      expect(id, isNull);
    });

    test('does not save order when database is unavailable even with items',
        () async {
      final product = Product(
        id: 'p1',
        name: 'Pad Thai',
        price: 85,
        sku: 'MAIN-001',
        stockQuantity: 10,
      );
      final cartState = CartState(
        items: [CartItem(product: product, quantity: 2)],
      );

      final id = await container.read(orderHistoryProvider.notifier).saveOrder(
            cartState: cartState,
            method: PaymentMethod.qr,
            receivedAmount: cartState.total,
            changeAmount: 0,
          );

      expect(id, isNull);
    });

    test('clearOrders completes safely when database is unavailable', () async {
      await container.read(orderHistoryProvider.notifier).clearOrders();
      expect(container.read(orderHistoryProvider), isA<AsyncData<void>>());
    });
  });
}
