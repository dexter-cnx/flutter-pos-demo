import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: Text('pos.title'.tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              // TODO: Navigation to History
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Navigation to Settings
            },
          ),
        ],
      ),
      body: Row(
        children: [
          // Main POS Area
          Expanded(
            flex: 3,
            child: Column(
              children: [
                // Category Bar
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
                            onSelected: (_) => ref.read(selectedCategoryIdProvider.notifier).select(null),
                          );
                        }
                        final category = categories[index - 1];
                        return FilterChip(
                          label: Text(category.name),
                          selected: selectedCategoryId == category.id,
                          onSelected: (_) => ref.read(selectedCategoryIdProvider.notifier).select(category.id),
                        );
                      },
                    ),
                  ),
                  loading: () => const LinearProgressIndicator(),
                  error: (e, _) => Center(child: Text(e.toString())),
                ),

                // Product Grid
                Expanded(
                  child: productsAsync.when(
                    data: (products) => GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // For Tablet Landscape
                        childAspectRatio: 0.85,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(product: products[index]);
                      },
                    ),
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (e, _) => Center(child: Text(e.toString())),
                  ),
                ),
              ],
            ),
          ),

          // Vertical Divider
          VerticalDivider(width: 1, color: theme.dividerColor),

          // Cart Sidebar
          const SizedBox(
            width: 400,
            child: CartSidebar(),
          ),
        ],
      ),
    );
  }
}
