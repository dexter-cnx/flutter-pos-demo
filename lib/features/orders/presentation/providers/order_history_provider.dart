import 'dart:async';

import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app/bootstrap.dart';
import '../../../payment/domain/entities/payment_method.dart';
import '../../../pos/presentation/providers/cart_provider.dart';
import '../../data/models/order_model.dart';
import '../../data/services/web_order_storage.dart';

import 'package:thai_pos_demo/shared/domain/entities/app_permission.dart';
import 'package:thai_pos_demo/shared/presentation/providers/access_providers.dart';
import 'package:thai_pos_demo/shared/presentation/providers/audit_providers.dart' hide isar;
import 'package:thai_pos_demo/shared/domain/enums/audit_event_type.dart';
import 'package:thai_pos_demo/shared/domain/enums/audit_event_source.dart';

part 'order_history_provider.g.dart';

@riverpod
Future<List<OrderModel>> orders(OrdersRef ref) async {
  final database = isar;
  if (database == null) {
    return WebOrderStorage.loadOrders();
  }

  // ignore: experimental_member_use
  final query = database.orderModels.buildQuery<OrderModel>(
    sortBy: const [SortProperty(property: 'createdAt', sort: Sort.desc)],
  );
  return query.findAll();
}

@riverpod
Future<OrderModel?> orderReceipt(OrderReceiptRef ref, int orderId) async {
  final database = isar;
  if (database == null) {
    return WebOrderStorage.loadOrder(orderId);
  }

  return database.orderModels.get(orderId);
}

@riverpod
Future<int> orderCount(OrderCountRef ref) async {
  final database = isar;
  if (database == null) {
    return WebOrderStorage.count();
  }

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
    if (database == null) {
      final orderId = await WebOrderStorage.saveOrder(
        cartState: cartState,
        method: method,
        receivedAmount: receivedAmount,
        changeAmount: changeAmount,
      );
      if (orderId != null) {
        ref.invalidate(ordersProvider);
        ref.invalidate(orderCountProvider);
        ref.invalidate(orderReceiptProvider(orderId));
        state = const AsyncData(null);
      }
      return orderId;
    }
    if (cartState.items.isEmpty) return null;

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

    final userProfile = ref.read(userAccessProfileProvider);
    final auditService = ref.read(auditServiceProvider);
    
    await auditService.logEvent(
      eventType: AuditEventType.transactionCompleted,
      entityType: 'transaction',
      entityId: orderId.toString(),
      action: 'created_and_paid',
      actorId: userProfile.userId,
      actorLabel: userProfile.displayName,
      source: AuditEventSource.staff,
      summary: 'Order #$orderId completed via ${method.name}',
      payload: {
        'total': cartState.total,
        'payment_method': method.name,
        'received': receivedAmount,
        'change': changeAmount,
      },
    );

    ref.invalidate(ordersProvider);
    ref.invalidate(orderCountProvider);
    ref.invalidate(orderReceiptProvider(orderId));
    state = const AsyncData(null);
    return orderId;
  }

  Future<void> clearOrders() async {
    final permissionService = ref.read(permissionServiceProvider);
    final userProfile = ref.read(userAccessProfileProvider);

    if (!permissionService.can(userProfile, AppPermission.transactionVoid)) {
      state = AsyncError('Permission Denied: transaction.void', StackTrace.current);
      return;
    }

    final database = isar;
    if (database == null) {
      await WebOrderStorage.clear();
      ref.invalidate(ordersProvider);
      ref.invalidate(orderCountProvider);
      state = const AsyncData(null);
      return;
    }

    await database.writeTxn(() async {
      await database.orderModels.clear();
    });

    final auditService = ref.read(auditServiceProvider);
    await auditService.logEvent(
      eventType: AuditEventType.transactionVoided,
      entityType: 'transaction',
      entityId: 'all',
      action: 'clear_all',
      actorId: userProfile.userId,
      actorLabel: userProfile.displayName,
      source: AuditEventSource.staff,
      summary: 'All transaction history cleared by user',
    );

    ref.invalidate(ordersProvider);
    ref.invalidate(orderCountProvider);
    state = const AsyncData(null);
  }
}
