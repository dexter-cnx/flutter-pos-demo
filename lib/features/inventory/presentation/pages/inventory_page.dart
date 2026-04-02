import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/layout/responsive_layout.dart';
import '../../../../app/widgets/async_state_view.dart';
import '../../../pos/domain/entities/product.dart';
import '../../../pos/presentation/providers/pos_providers.dart';
import '../../../settings/presentation/providers/settings_providers.dart';

class InventoryPage extends ConsumerWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(inventoryProductsProvider);
    final lowStockCountAsync = ref.watch(lowStockCountProvider);
    final thresholdAsync = ref.watch(lowStockThresholdProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.go('/'),
        ),
        title: Text('inventory.title'.tr()),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: lowStockCountAsync.when(
                data: (count) =>
                    Text('inventory.low_stock_count'.tr(args: ['$count'])),
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: thresholdAsync.when(
          data: (threshold) => productsAsync.when(
            data: (products) {
              if (products.isEmpty) {
                return AppEmptyState(
                  icon: Icons.inventory_2_outlined,
                  title: 'pos.empty_products'.tr(),
                  message: 'pos.empty_products_hint'.tr(),
                  actionLabel: 'common.back'.tr(),
                  onAction: () => context.go('/'),
                );
              }

              final sortedProducts = [...products]
                ..sort((a, b) {
                  final aRank = a.stockQuantity <= 0
                      ? 0
                      : a.stockQuantity <= threshold
                      ? 1
                      : 2;
                  final bRank = b.stockQuantity <= 0
                      ? 0
                      : b.stockQuantity <= threshold
                      ? 1
                      : 2;
                  if (aRank != bRank) return aRank.compareTo(bRank);
                  return a.name.compareTo(b.name);
                });

              return LayoutBuilder(
                builder: (context, constraints) {
                  final responsive = ResponsiveLayout.fromConstraints(
                    constraints,
                  );
                  final crossAxisCount = responsive.inventoryGridCount;

                  return ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      lowStockCountAsync.when(
                        data: (count) => count == 0
                            ? const SizedBox.shrink()
                            : Card(
                                color: Theme.of(
                                  context,
                                ).colorScheme.tertiaryContainer,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.warning_amber_rounded),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          'inventory.warning_summary'.tr(
                                            args: ['$count', '$threshold'],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        loading: () => const SizedBox.shrink(),
                        error: (_, __) => const SizedBox.shrink(),
                      ),
                      const SizedBox(height: 12),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: sortedProducts.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: responsive.inventoryCardAspectRatio,
                        ),
                        itemBuilder: (context, index) => _InventoryCard(
                          product: sortedProducts[index],
                          threshold: threshold,
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            loading: () => const AppLoadingState(),
            error: (error, _) => AppErrorState(
              message: error.toString(),
              onRetry: () => ref.invalidate(inventoryProductsProvider),
            ),
          ),
          loading: () => const AppLoadingState(),
          error: (error, _) => AppErrorState(
            message: error.toString(),
            onRetry: () {
              ref.invalidate(storeProfileProvider);
              ref.invalidate(lowStockThresholdProvider);
            },
          ),
        ),
      ),
    );
  }
}

class _InventoryCard extends ConsumerWidget {
  const _InventoryCard({required this.product, required this.threshold});

  final Product product;
  final int threshold;

  Future<void> _showRestockDialog(BuildContext context, WidgetRef ref) async {
    final controller = TextEditingController(text: '5');
    final quantity = await showDialog<int>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('inventory.restock'.tr()),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'inventory.restock_quantity'.tr(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('common.cancel'.tr()),
            ),
            FilledButton(
              onPressed: () =>
                  Navigator.of(context).pop(int.tryParse(controller.text)),
              child: Text('common.confirm'.tr()),
            ),
          ],
        );
      },
    );

    if (quantity == null || quantity <= 0) return;

    await ref
        .read(inventoryActionsProvider.notifier)
        .restockProduct(product.id, quantity);
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('inventory.restock_success'.tr(args: [product.name])),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOutOfStock = product.stockQuantity <= 0;
    final isLowStock =
        product.stockQuantity > 0 && product.stockQuantity <= threshold;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (isOutOfStock)
                  Chip(
                    label: Text('inventory.out_of_stock'.tr()),
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  )
                else if (isLowStock)
                  Chip(
                    label: Text('inventory.low_stock'.tr()),
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              '${product.sku} • \u0E3F${product.price.toStringAsFixed(2)}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              'inventory.stock_remaining'.tr(
                args: ['${product.stockQuantity}'],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            FilledButton.icon(
              onPressed: () => _showRestockDialog(context, ref),
              icon: const Icon(Icons.add_box_outlined),
              label: Text('inventory.restock'.tr()),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(44),
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
