import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/layout/responsive_layout.dart';
import '../providers/cart_provider.dart';

class CartSidebar extends ConsumerWidget {
  const CartSidebar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cartState = ref.watch(cartProvider);
    final cartNotifier = ref.read(cartProvider.notifier);

    return LayoutBuilder(
      builder: (context, constraints) {
        final responsive = ResponsiveLayout.fromConstraints(constraints);
        final compact = responsive.isCompactHeight;
        final summaryPadding = compact ? 16.0 : 24.0;
        final checkoutSpacing = compact ? 16.0 : 24.0;
        final summaryRadius = compact ? 20.0 : 32.0;

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(compact ? 12 : 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'pos.cart'.tr(),
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: cartNotifier.clearCart,
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                  ),
                ],
              ),
            ),
            Expanded(
              child: cartState.items.isEmpty
                  ? LayoutBuilder(
                      builder: (context, emptyConstraints) {
                        return SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: emptyConstraints.maxHeight,
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.shopping_cart_outlined,
                                      size: compact ? 48 : 64,
                                      color: theme.disabledColor,
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      'pos.empty_cart'.tr(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: theme.disabledColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : ListView.builder(
                      padding: EdgeInsets.only(bottom: compact ? 8 : 12),
                      itemCount: cartState.items.length,
                      itemBuilder: (context, index) {
                        final item = cartState.items[index];
                        final atMaxStock =
                            item.quantity >= item.product.stockQuantity;

                        return ListTile(
                          dense: compact,
                          title: Text(
                            item.product.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '\u0E3F${item.product.price.toStringAsFixed(2)} • '
                            '${'inventory.stock_remaining'.tr(args: [
                                  '${item.product.stockQuantity}'
                                ])}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () => cartNotifier.updateQuantity(
                                  item.product.id,
                                  -1,
                                ),
                                icon: const Icon(Icons.remove_circle_outline),
                                color: theme.colorScheme.primary,
                              ),
                              Text(
                                '${item.quantity}',
                                style: theme.textTheme.titleMedium,
                              ),
                              IconButton(
                                onPressed: atMaxStock
                                    ? null
                                    : () => cartNotifier.updateQuantity(
                                          item.product.id,
                                          1,
                                        ),
                                icon: const Icon(Icons.add_circle_outline),
                                color: theme.colorScheme.primary,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
            Container(
              padding: EdgeInsets.all(summaryPadding),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(summaryRadius),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildSummaryRow(
                      context,
                      'pos.subtotal'.tr(),
                      '\u0E3F${cartState.subtotal.toStringAsFixed(2)}',
                    ),
                    const SizedBox(height: 8),
                    _buildSummaryRow(
                      context,
                      '${'pos.vat'.tr()} (7%)',
                      '\u0E3F${cartState.taxAmount.toStringAsFixed(2)}',
                    ),
                    Divider(height: compact ? 20 : 32),
                    _buildSummaryRow(
                      context,
                      'pos.total'.tr(),
                      '\u0E3F${cartState.total.toStringAsFixed(2)}',
                      isBold: true,
                    ),
                    SizedBox(height: checkoutSpacing),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: cartState.items.isEmpty
                            ? null
                            : () => context.go('/checkout'),
                        icon: const Icon(Icons.payments_outlined),
                        label: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: compact ? 8 : 12,
                          ),
                          child: Text(
                            'pos.pay'.tr(),
                            style: TextStyle(fontSize: compact ? 16 : 18),
                          ),
                        ),
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSummaryRow(
    BuildContext context,
    String label,
    String value, {
    bool isBold = false,
  }) {
    final style = Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontSize: isBold ? 20 : null,
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(child: Text(label, style: style)),
        const SizedBox(width: 12),
        Text(value, style: style),
      ],
    );
  }
}
