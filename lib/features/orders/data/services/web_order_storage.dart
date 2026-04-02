import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app/bootstrap.dart';
import '../../../checkout/presentation/providers/checkout_providers.dart';
import '../../../pos/presentation/providers/cart_provider.dart';
import '../models/order_model.dart';

class WebOrderStorage {
  static const _ordersKey = 'web_orders_v1';

  const WebOrderStorage._();

  static SharedPreferences? get _prefs => sharedPreferences;

  static Future<List<OrderModel>> loadOrders() async {
    final prefs = _prefs;
    if (prefs == null) return [];

    final raw = prefs.getString(_ordersKey);
    if (raw == null || raw.isEmpty) return [];

    final decoded = (jsonDecode(raw) as List<dynamic>)
        .cast<Map<String, dynamic>>();
    final orders = decoded.map(_decodeOrder).toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return orders;
  }

  static Future<OrderModel?> loadOrder(int orderId) async {
    final orders = await loadOrders();
    for (final order in orders) {
      if (order.id == orderId) return order;
    }
    return null;
  }

  static Future<int> count() async => (await loadOrders()).length;

  static Future<int?> saveOrder({
    required CartState cartState,
    required PaymentMethod method,
    required double receivedAmount,
    required double changeAmount,
  }) async {
    final prefs = _prefs;
    if (prefs == null || cartState.items.isEmpty) return null;

    final orders = await loadOrders();
    final nextId = orders.isEmpty
        ? 1
        : orders.map((order) => order.id).reduce((a, b) => a > b ? a : b) + 1;

    final order = OrderModel()
      ..id = nextId
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

    orders.add(order);
    await _saveOrders(prefs, orders);
    return nextId;
  }

  static Future<void> clear() async {
    final prefs = _prefs;
    if (prefs == null) return;
    await prefs.remove(_ordersKey);
  }

  static Future<void> _saveOrders(
    SharedPreferences prefs,
    List<OrderModel> orders,
  ) async {
    final encoded = orders.map(_encodeOrder).toList();
    await prefs.setString(_ordersKey, jsonEncode(encoded));
  }

  static Map<String, dynamic> _encodeOrder(OrderModel order) {
    return {
      'id': order.id,
      'createdAt': order.createdAt.toIso8601String(),
      'paymentMethod': order.paymentMethod,
      'subtotal': order.subtotal,
      'taxAmount': order.taxAmount,
      'total': order.total,
      'receivedAmount': order.receivedAmount,
      'changeAmount': order.changeAmount,
      'items': order.items
          .map(
            (item) => {
              'productName': item.productName,
              'sku': item.sku,
              'quantity': item.quantity,
              'unitPrice': item.unitPrice,
              'lineTotal': item.lineTotal,
            },
          )
          .toList(),
    };
  }

  static OrderModel _decodeOrder(Map<String, dynamic> json) {
    final order = OrderModel()
      ..id = json['id'] as int? ?? 0
      ..createdAt = DateTime.parse(json['createdAt'] as String)
      ..paymentMethod = json['paymentMethod'] as String? ?? 'cash'
      ..subtotal = (json['subtotal'] as num).toDouble()
      ..taxAmount = (json['taxAmount'] as num).toDouble()
      ..total = (json['total'] as num).toDouble()
      ..receivedAmount = (json['receivedAmount'] as num).toDouble()
      ..changeAmount = (json['changeAmount'] as num).toDouble();

    final rawItems = (json['items'] as List<dynamic>? ?? const [])
        .cast<Map<String, dynamic>>();
    order.items = rawItems.map((itemJson) {
      return OrderItemModel()
        ..productName = itemJson['productName'] as String? ?? ''
        ..sku = itemJson['sku'] as String? ?? ''
        ..quantity = itemJson['quantity'] as int? ?? 0
        ..unitPrice = (itemJson['unitPrice'] as num).toDouble()
        ..lineTotal = (itemJson['lineTotal'] as num).toDouble();
    }).toList();

    return order;
  }
}
