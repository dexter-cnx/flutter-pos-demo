import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app/mode/current_mode_provider.dart';
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
    @Default(0.0) double subtotal,
    @Default(0.0) double taxAmount,
    @Default(0.0) double total,
  }) = _CartState;

  const CartState._();

  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);
}

@riverpod
class Cart extends _$Cart {
  static const _webCartDraftKey = 'web_cart_draft_v1';

  @override
  CartState build() {
    return _restoreDraft();
  }

  void addItem(Product product) {
    if (!product.isAvailable || product.stockQuantity <= 0) return;

    final existingIndex = state.items.indexWhere(
      (item) => item.product.id == product.id,
    );
    
    List<CartItem> updatedItems;
    if (existingIndex != -1) {
      final nextQuantity = state.items[existingIndex].quantity + 1;
      if (nextQuantity > product.stockQuantity) return;

      updatedItems = List<CartItem>.from(state.items);
      updatedItems[existingIndex] = updatedItems[existingIndex].copyWith(
        quantity: nextQuantity,
      );
    } else {
      updatedItems = [
        ...state.items,
        CartItem(product: product),
      ];
    }

    state = _applyCalculations(state.copyWith(items: updatedItems));
    _persistDraft();
  }

  void removeItem(String productId) {
    state = _applyCalculations(state.copyWith(
      items: state.items.where((item) => item.product.id != productId).toList(),
    ));
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
      state = _applyCalculations(state.copyWith(items: updatedItems));
      _persistDraft();
    }
  }

  void clearCart() {
    state = _applyCalculations(const CartState());
    _persistDraft();
  }

  CartState _applyCalculations(CartState currentState) {
    final modeDef = ref.read(currentModeDefinitionProvider);
    final engine = modeDef.pricingEngine;

    final subtotal = engine.calculateSubtotal(currentState.items);
    final taxAmount = engine.calculateTax(subtotal, currentState.taxRate);
    final total = engine.calculateTotal(subtotal, taxAmount);

    return currentState.copyWith(
      subtotal: subtotal,
      taxAmount: taxAmount,
      total: total,
    );
  }

  CartState _restoreDraft() {
    final prefs = sharedPreferences;
    if (prefs == null || isar != null) return _applyCalculations(const CartState());

    final raw = prefs.getString(_webCartDraftKey);
    if (raw == null || raw.isEmpty) return _applyCalculations(const CartState());

    try {
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      final items = (decoded['items'] as List<dynamic>? ?? const [])
          .whereType<Map<String, dynamic>>()
          .map(_decodeCartItem)
          .toList();
      final taxRate = (decoded['taxRate'] as num?)?.toDouble() ?? 0.07;
      return _applyCalculations(CartState(items: items, taxRate: taxRate));
    } catch (_) {
      return _applyCalculations(const CartState());
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
