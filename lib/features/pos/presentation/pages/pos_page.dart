import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/layout/responsive_layout.dart';
import '../../../../app/widgets/async_state_view.dart';
import '../../../settings/presentation/providers/settings_providers.dart';
import '../providers/pos_providers.dart';
import '../widgets/cart_sidebar.dart';
import '../widgets/product_card.dart';

class PosPage extends ConsumerWidget {
  const PosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final categoriesAsync = ref.watch(categoriesProvider);
    final productsAsync = ref.watch(productsProvider);
    final selectedCategoryId = ref.watch(selectedCategoryIdProvider);
    final lowStockCountAsync = ref.watch(lowStockCountProvider);
    final lowStockThresholdAsync = ref.watch(lowStockThresholdProvider);
    final categoriesError = categoriesAsync.hasError;
    final productsError = productsAsync.hasError;

    return Scaffold(
      appBar: AppBar(
        title: Text('pos.title'.tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.inventory_2_outlined),
            onPressed: () => context.go('/inventory'),
          ),
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => context.go('/history'),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.go('/settings'),
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final responsive = ResponsiveLayout.fromConstraints(constraints);
            final crossAxisCount = responsive.contentGridCount;

            final mainContent = Column(
              children: [
                lowStockCountAsync.when(
                  data: (count) => lowStockThresholdAsync.when(
                    data: (threshold) => count == 0
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                            child: Card(
                              color: theme.colorScheme.tertiaryContainer,
                              child: Padding(
                                padding: const EdgeInsets.all(14),
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
                          ),
                    loading: () => const SizedBox.shrink(),
                    error: (_, __) => const SizedBox.shrink(),
                  ),
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                ),
                categoriesAsync.when(
                  data: (categories) => Container(
                    height: 60,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length + 1,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return FilterChip(
                            label: Text('pos.all_categories'.tr()),
                            selected: selectedCategoryId == null,
                            onSelected: (_) => ref
                                .read(selectedCategoryIdProvider.notifier)
                                .select(null),
                          );
                        }
                        final category = categories[index - 1];
                        return FilterChip(
                          label: Text(category.name),
                          selected: selectedCategoryId == category.id,
                          onSelected: (_) => ref
                              .read(selectedCategoryIdProvider.notifier)
                              .select(category.id),
                        );
                      },
                    ),
                  ),
                  loading: () => const SizedBox(
                    height: 60,
                    child: AppLoadingState(compact: true),
                  ),
                  error: (e, _) => SizedBox(
                    height: 72,
                    child: AppErrorState(
                      message: e.toString(),
                      compact: true,
                      onRetry: () {
                        ref.invalidate(categoriesProvider);
                        ref.invalidate(productsProvider);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: productsAsync.when(
                    data: (products) {
                      if (products.isEmpty) {
                        return AppEmptyState(
                          icon: Icons.inventory_2_outlined,
                          title: 'pos.empty_products'.tr(),
                          message: 'pos.empty_products_hint'.tr(),
                          actionLabel: 'common.retry'.tr(),
                          onAction: () {
                            ref.invalidate(categoriesProvider);
                            ref.invalidate(productsProvider);
                          },
                        );
                      }

                      return GridView.builder(
                        padding: const EdgeInsets.all(16),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          childAspectRatio: responsive.contentCardAspectRatio,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return ProductCard(product: products[index]);
                        },
                      );
                    },
                    loading: () => const AppLoadingState(),
                    error: (e, _) => AppErrorState(
                      message: e.toString(),
                      onRetry: () {
                        ref.invalidate(categoriesProvider);
                        ref.invalidate(productsProvider);
                      },
                    ),
                  ),
                ),
              ],
            );

            if (responsive.isSplitView) {
              return Row(
                children: [
                  Expanded(flex: 3, child: mainContent),
                  VerticalDivider(width: 1, color: theme.dividerColor),
                  SizedBox(
                    width: responsive.cartPanelWidth,
                    child: CartSidebar(
                      showRetryHint: categoriesError || productsError,
                    ),
                  ),
                ],
              );
            }

            return Column(
              children: [
                Expanded(child: mainContent),
                Container(
                  height: responsive.cartDockHeight,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: theme.dividerColor),
                    ),
                  ),
                  child: CartSidebar(
                    showRetryHint: categoriesError || productsError,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
