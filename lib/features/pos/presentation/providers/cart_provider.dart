import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/product.dart';

part 'cart_provider.freezed.dart';
part 'cart_provider.g.dart';

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required Product product,
    @Default(1) int quantity,
  }) = _CartItem;
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
  @override
  CartState build() => const CartState();

  void addItem(Product product) {
    if (!product.isAvailable || product.stockQuantity <= 0) return;

    final existingIndex =
        state.items.indexWhere((item) => item.product.id == product.id);
    if (existingIndex != -1) {
      final nextQuantity = state.items[existingIndex].quantity + 1;
      if (nextQuantity > product.stockQuantity) return;

      final updatedItems = List<CartItem>.from(state.items);
      updatedItems[existingIndex] = updatedItems[existingIndex].copyWith(
        quantity: nextQuantity,
      );
      state = state.copyWith(items: updatedItems);
    } else {
      state =
          state.copyWith(items: [...state.items, CartItem(product: product)]);
    }
  }

  void removeItem(String productId) {
    state = state.copyWith(
      items: state.items.where((item) => item.product.id != productId).toList(),
    );
  }

  void updateQuantity(String productId, int delta) {
    final itemIndex =
        state.items.indexWhere((item) => item.product.id == productId);
    if (itemIndex == -1) return;

    final currentQuantity = state.items[itemIndex].quantity;
    final newQuantity = currentQuantity + delta;

    if (newQuantity <= 0) {
      removeItem(productId);
    } else if (newQuantity > state.items[itemIndex].product.stockQuantity) {
      return;
    } else {
      final updatedItems = List<CartItem>.from(state.items);
      updatedItems[itemIndex] =
          updatedItems[itemIndex].copyWith(quantity: newQuantity);
      state = state.copyWith(items: updatedItems);
    }
  }

  void clearCart() {
    state = const CartState();
  }
}
