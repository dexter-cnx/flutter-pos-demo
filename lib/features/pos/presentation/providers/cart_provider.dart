import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app/bootstrap.dart';
import '../../domain/entities/product.dart';

part 'cart_provider.freezed.dart';
part 'cart_provider.g.dart';

@freezed
class CartItem with _$CartItem {
  const factory CartItem({required Product product, @Default(1) int quantity}) =
      _CartItem;
}

@freezed
class CartState with _$CartState {
  const factory CartState({
    @Default([]) List<CartItem> items,
    @Default(0.07) double taxRate,
  }) = _CartState;

  const CartState._();

  double get subtotal =>
      items.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
  double get taxAmount => subtotal * taxRate;
  double get total => subtotal + taxAmount;
  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);
}

@riverpod
class Cart extends _$Cart {
  static const _webCartDraftKey = 'web_cart_draft_v1';

  @override
  CartState build() => _restoreDraft();

  void addItem(Product product) {
    if (!product.isAvailable || product.stockQuantity <= 0) return;

    final existingIndex = state.items.indexWhere(
      (item) => item.product.id == product.id,
    );
    if (existingIndex != -1) {
      final nextQuantity = state.items[existingIndex].quantity + 1;
      if (nextQuantity > product.stockQuantity) return;

      final updatedItems = List<CartItem>.from(state.items);
      updatedItems[existingIndex] = updatedItems[existingIndex].copyWith(
        quantity: nextQuantity,
      );
      state = state.copyWith(items: updatedItems);
      _persistDraft();
    } else {
      state = state.copyWith(
        items: [
          ...state.items,
          CartItem(product: product),
        ],
      );
      _persistDraft();
    }
  }

  void removeItem(String productId) {
    state = state.copyWith(
      items: state.items.where((item) => item.product.id != productId).toList(),
    );
    _persistDraft();
  }

  void updateQuantity(String productId, int delta) {
    final itemIndex = state.items.indexWhere(
      (item) => item.product.id == productId,
    );
    if (itemIndex == -1) return;

    final currentQuantity = state.items[itemIndex].quantity;
    final newQuantity = currentQuantity + delta;

    if (newQuantity <= 0) {
      removeItem(productId);
    } else if (newQuantity > state.items[itemIndex].product.stockQuantity) {
      return;
    } else {
      final updatedItems = List<CartItem>.from(state.items);
      updatedItems[itemIndex] = updatedItems[itemIndex].copyWith(
        quantity: newQuantity,
      );
      state = state.copyWith(items: updatedItems);
      _persistDraft();
    }
  }

  void clearCart() {
    state = const CartState();
    _persistDraft();
  }

  CartState _restoreDraft() {
    final prefs = sharedPreferences;
    if (prefs == null || isar != null) return const CartState();

    final raw = prefs.getString(_webCartDraftKey);
    if (raw == null || raw.isEmpty) return const CartState();

    try {
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      final items = (decoded['items'] as List<dynamic>? ?? const [])
          .whereType<Map<String, dynamic>>()
          .map(_decodeCartItem)
          .toList();
      final taxRate = (decoded['taxRate'] as num?)?.toDouble() ?? 0.07;
      return CartState(items: items, taxRate: taxRate);
    } catch (_) {
      return const CartState();
    }
  }

  void _persistDraft() {
    final prefs = sharedPreferences;
    if (prefs == null || isar != null) return;

    if (state.items.isEmpty) {
      prefs.remove(_webCartDraftKey);
      return;
    }

    final payload = {
      'taxRate': state.taxRate,
      'items': state.items.map(_encodeCartItem).toList(),
    };
    prefs.setString(_webCartDraftKey, jsonEncode(payload));
  }

  Map<String, dynamic> _encodeCartItem(CartItem item) {
    return {
      'quantity': item.quantity,
      'product': {
        'id': item.product.id,
        'name': item.product.name,
        'price': item.product.price,
        'sku': item.product.sku,
        'stockQuantity': item.product.stockQuantity,
        'isAvailable': item.product.isAvailable,
        'imageUrl': item.product.imageUrl,
      },
    };
  }

  CartItem _decodeCartItem(Map<String, dynamic> json) {
    final productJson = json['product'] as Map<String, dynamic>? ?? const {};
    return CartItem(
      quantity: json['quantity'] as int? ?? 1,
      product: Product(
        id: productJson['id'] as String? ?? '',
        name: productJson['name'] as String? ?? '',
        price: (productJson['price'] as num?)?.toDouble() ?? 0,
        sku: productJson['sku'] as String? ?? '',
        stockQuantity: productJson['stockQuantity'] as int? ?? 0,
        isAvailable: productJson['isAvailable'] as bool? ?? true,
        imageUrl: productJson['imageUrl'] as String?,
      ),
    );
  }
}
