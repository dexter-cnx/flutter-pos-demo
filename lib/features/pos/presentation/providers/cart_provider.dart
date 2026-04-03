import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app/mode/current_mode_provider.dart';
import '../../../../app/bootstrap.dart';
import '../../domain/entities/product.dart';
import '../../../dining/presentation/providers/dining_providers.dart';
import '../../../orders/data/models/order_model.dart';

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
    int? sessionId,
  }) = _CartState;

  const CartState._();

  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);
}

@riverpod
class Cart extends _$Cart {
  static const _webCartDraftKey = 'web_cart_draft_v1';

  @override
  CartState build() {
    final sessionId = ref.watch(activeDiningSessionIdProvider);
    
    if (sessionId != null) {
      // In Restaurant Mode - Sync with session
      final sessionAsync = ref.watch(activeDiningSessionProvider(sessionId));
      
      return sessionAsync.maybeWhen(
        data: (session) {
          if (session == null) return const CartState();
          
          final items = session.items.map((m) => CartItem(
            product: Product(
              id: m.sku,
              name: m.productName,
              price: m.unitPrice,
              sku: m.sku,
              stockQuantity: 999,
              isAvailable: true,
            ),
            quantity: m.quantity,
          )).toList();

          return CartState(
            items: items,
            taxRate: 0.07,
            subtotal: session.subtotal,
            taxAmount: session.taxAmount,
            total: session.total,
            sessionId: sessionId,
          );
        },
        orElse: () => state.sessionId == sessionId ? state : const CartState(),
      );
    }

    return _restoreDraft();
  }

  void addItem(Product product) {
    if (!product.isAvailable) return;

    final existingIndex = state.items.indexWhere(
      (item) => item.product.id == product.id,
    );
    
    List<CartItem> updatedItems;
    if (existingIndex != -1) {
      final currentQuantity = state.items[existingIndex].quantity;
      if (currentQuantity >= product.stockQuantity) return;
      
      updatedItems = List<CartItem>.from(state.items);
      updatedItems[existingIndex] = updatedItems[existingIndex].copyWith(
        quantity: currentQuantity + 1,
      );
    } else {
      if (product.stockQuantity <= 0) return;
      updatedItems = [...state.items, CartItem(product: product)];
    }

    _updateStateAndPersist(state.copyWith(items: updatedItems));
  }

  void removeItem(String productId) {
    _updateStateAndPersist(state.copyWith(
      items: state.items.where((item) => item.product.id != productId).toList(),
    ));
  }

  void updateQuantity(String productId, int delta) {
    final itemIndex = state.items.indexWhere((item) => item.product.id == productId);
    if (itemIndex == -1) return;

    final item = state.items[itemIndex];
    final newQuantity = item.quantity + delta;
    
    if (newQuantity <= 0) {
      removeItem(productId);
    } else if (newQuantity > item.product.stockQuantity) {
      return;
    } else {
      final updatedItems = List<CartItem>.from(state.items);
      updatedItems[itemIndex] = updatedItems[itemIndex].copyWith(quantity: newQuantity);
      _updateStateAndPersist(state.copyWith(items: updatedItems));
    }
  }

  void clearCart() {
    _updateStateAndPersist(const CartState());
  }

  void _updateStateAndPersist(CartState newState) {
    final calculatedState = _applyCalculations(newState);
    state = calculatedState;

    if (state.sessionId != null) {
      _syncWithSession();
    } else {
      _persistDraft();
    }
  }

  CartState _applyCalculations(CartState currentState) {
    final modeDef = ref.read(currentModeDefinitionProvider);
    final engine = modeDef.pricingEngine;

    Map<String, dynamic>? metadata;
    if (currentState.sessionId != null) {
      final session = ref.read(activeDiningSessionProvider(currentState.sessionId!)).value;
      if (session != null) {
        metadata = {
          'headcount': session.headcount,
          'buffetPrice': 0.0,
        };
      }
    }

    final subtotal = engine.calculateSubtotal(currentState.items, metadata: metadata);
    final taxAmount = engine.calculateTax(subtotal, currentState.taxRate);
    final total = engine.calculateTotal(subtotal, taxAmount);

    return currentState.copyWith(
      subtotal: subtotal,
      taxAmount: taxAmount,
      total: total,
    );
  }

  Future<void> _syncWithSession() async {
    if (state.sessionId == null) return;

    final items = state.items.map((item) => OrderItemModel()
      ..sku = item.product.id
      ..productName = item.product.name
      ..unitPrice = item.product.price
      ..quantity = item.quantity
      ..lineTotal = item.product.price * item.quantity
    ).toList();

    await ref.read(diningSessionRepositoryProvider).updateItems(
      state.sessionId!,
      items,
      state.subtotal,
      state.taxAmount,
      state.total,
    );
  }

  // --- Draft Persistence ---

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
      return _applyCalculations(CartState(items: items));
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
      },
    };
  }

  CartItem _decodeCartItem(Map<String, dynamic> json) {
    final p = json['product'] as Map<String, dynamic>? ?? const {};
    return CartItem(
      quantity: json['quantity'] as int? ?? 1,
      product: Product(
        id: p['id'] as String? ?? '',
        name: p['name'] as String? ?? '',
        price: (p['price'] as num?)?.toDouble() ?? 0,
        sku: '',
        stockQuantity: 999,
      ),
    );
  }
}
