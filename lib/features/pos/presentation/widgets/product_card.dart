import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../settings/presentation/providers/settings_providers.dart';
import '../../domain/entities/product.dart';
import '../providers/cart_provider.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final lowStockThreshold = ref.watch(lowStockThresholdProvider).value ?? 5;
    final isOutOfStock = !product.isAvailable || product.stockQuantity <= 0;
    final isLowStock =
        product.stockQuantity > 0 && product.stockQuantity <= lowStockThreshold;

    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: theme.dividerColor, width: 1),
      ),
      child: InkWell(
        onTap: isOutOfStock
            ? null
            : () => ref.read(cartProvider.notifier).addItem(product),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      color: theme.colorScheme.surfaceContainerHighest,
                      child: product.imageUrl != null
                          ? Image.network(product.imageUrl!, fit: BoxFit.cover)
                          : Center(
                              child: Icon(
                                Icons.fastfood_rounded,
                                size: 48,
                                color: theme.colorScheme.primary
                                    .withValues(alpha: 0.5),
                              ),
                            ),
                    ),
                  ),
                  if (isOutOfStock || isLowStock)
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Chip(
                        label: Text(
                          isOutOfStock
                              ? 'inventory.out_of_stock'.tr()
                              : 'inventory.low_stock'.tr(),
                        ),
                        backgroundColor: isOutOfStock
                            ? theme.colorScheme.errorContainer
                            : theme.colorScheme.tertiaryContainer,
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isOutOfStock
                        ? 'inventory.out_of_stock'.tr()
                        : 'inventory.stock_remaining'
                            .tr(args: ['${product.stockQuantity}']),
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: isOutOfStock
                          ? theme.colorScheme.error
                          : isLowStock
                              ? theme.colorScheme.tertiary
                              : theme.hintColor,
                      fontWeight: isOutOfStock || isLowStock
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\u0E3F${product.price.toStringAsFixed(2)}',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          product.sku,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.hintColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
