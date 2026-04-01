import 'dart:async';

import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app/bootstrap.dart';
import '../../../checkout/presentation/providers/checkout_providers.dart';
import '../../../pos/presentation/providers/cart_provider.dart';
import '../../data/models/order_model.dart';

part 'order_history_provider.g.dart';

@riverpod
Future<List<OrderModel>> orders(OrdersRef ref) async {
  final database = isar;
  if (database == null) return [];

  // ignore: experimental_member_use
  final query = database.orderModels.buildQuery<OrderModel>(
    sortBy: const [
      SortProperty(property: 'createdAt', sort: Sort.desc),
    ],
  );
  return query.findAll();
}

@riverpod
Future<OrderModel?> orderReceipt(OrderReceiptRef ref, int orderId) async {
  final database = isar;
  if (database == null) return null;

  return database.orderModels.get(orderId);
}

@riverpod
Future<int> orderCount(OrderCountRef ref) async {
  final database = isar;
  if (database == null) return 0;

  return database.orderModels.count();
}

@riverpod
class OrderHistory extends _$OrderHistory {
  @override
  FutureOr<void> build() {}

  Future<int?> saveOrder({
    required CartState cartState,
    required PaymentMethod method,
    required double receivedAmount,
    required double changeAmount,
  }) async {
    final database = isar;
    if (database == null || cartState.items.isEmpty) return null;

    final order = OrderModel()
      ..createdAt = DateTime.now()
      ..paymentMethod = method.name
      ..subtotal = cartState.subtotal
      ..taxAmount = cartState.taxAmount
      ..total = cartState.total
      ..receivedAmount = receivedAmount
      ..changeAmount = changeAmount
      ..items = cartState.items
          .map(
            (item) => OrderItemModel()
              ..productName = item.product.name
              ..sku = item.product.sku
              ..quantity = item.quantity
              ..unitPrice = item.product.price
              ..lineTotal = item.product.price * item.quantity,
          )
          .toList();

    late final int orderId;
    await database.writeTxn(() async {
      orderId = await database.orderModels.put(order);
    });

    ref.invalidate(ordersProvider);
    ref.invalidate(orderCountProvider);
    ref.invalidate(orderReceiptProvider(orderId));
    state = const AsyncData(null);
    return orderId;
  }

  Future<void> clearOrders() async {
    final database = isar;
    if (database == null) return;

    await database.writeTxn(() async {
      await database.orderModels.clear();
    });

    ref.invalidate(ordersProvider);
    ref.invalidate(orderCountProvider);
    state = const AsyncData(null);
  }
}
