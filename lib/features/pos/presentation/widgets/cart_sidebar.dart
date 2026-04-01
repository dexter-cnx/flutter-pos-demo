import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/cart_provider.dart';

class CartSidebar extends ConsumerWidget {
  const CartSidebar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cartState = ref.watch(cartProvider);
    final cartNotifier = ref.read(cartProvider.notifier);

    return Column(
      children: [
        // Cart Header
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'pos.cart'.tr(),
                style: theme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: cartNotifier.clearCart,
                icon: const Icon(Icons.delete_outline, color: Colors.red),
              ),
            ],
          ),
        ),

        // Cart Items List
        Expanded(
          child: cartState.items.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart_outlined,
                          size: 64, color: theme.disabledColor),
                      const SizedBox(height: 16),
                      Text('pos.empty_cart'.tr(),
                          style: TextStyle(color: theme.disabledColor)),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: cartState.items.length,
                  itemBuilder: (context, index) {
                    final item = cartState.items[index];
                    return ListTile(
                      title: Text(
                        item.product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle:
                          Text('฿${item.product.price.toStringAsFixed(2)}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => cartNotifier.updateQuantity(
                                item.product.id, -1),
                            icon: const Icon(Icons.remove_circle_outline),
                            color: theme.colorScheme.primary,
                          ),
                          Text('${item.quantity}',
                              style: theme.textTheme.titleMedium),
                          IconButton(
                            onPressed: () =>
                                cartNotifier.updateQuantity(item.product.id, 1),
                            icon: const Icon(Icons.add_circle_outline),
                            color: theme.colorScheme.primary,
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),

        // Order Summary
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: Column(
            children: [
              _buildSummaryRow(context, 'pos.subtotal'.tr(),
                  '฿${cartState.subtotal.toStringAsFixed(2)}'),
              const SizedBox(height: 8),
              _buildSummaryRow(context, '${'pos.vat'.tr()} (7%)',
                  '฿${cartState.taxAmount.toStringAsFixed(2)}'),
              const Divider(height: 32),
              _buildSummaryRow(
                context,
                'pos.total'.tr(),
                '฿${cartState.total.toStringAsFixed(2)}',
                isBold: true,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: cartState.items.isEmpty
                      ? null
                      : () => context.go('/checkout'),
                  icon: const Icon(Icons.payments_outlined),
                  label: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text('pos.pay'.tr(),
                        style: const TextStyle(fontSize: 18)),
                  ),
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(BuildContext context, String label, String value,
      {bool isBold = false}) {
    final style = Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontSize: isBold ? 20 : null,
        );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text(value, style: style),
      ],
    );
  }
}
