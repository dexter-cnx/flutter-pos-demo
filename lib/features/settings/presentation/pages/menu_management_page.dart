import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../../../app/layout/responsive_layout.dart';
import '../../../../app/widgets/async_state_view.dart';
import '../../../pos/domain/entities/category.dart';
import '../../../pos/domain/entities/product.dart';
import '../../../pos/presentation/providers/pos_providers.dart';
import '../../../auth/presentation/providers/auth_provider.dart';

class MenuManagementPage extends ConsumerStatefulWidget {
  const MenuManagementPage({super.key});

  @override
  ConsumerState<MenuManagementPage> createState() => _MenuManagementPageState();
}

class _MenuManagementPageState extends ConsumerState<MenuManagementPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.go('/settings'),
        ),
        title: Text('menu.title'.tr()),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(authNotifierProvider.notifier).logout();
              context.go('/login');
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'menu.category_title'.tr(), icon: const Icon(Icons.category_outlined)),
            Tab(text: 'menu.product_title'.tr(), icon: const Icon(Icons.restaurant_menu_outlined)),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: const [
            _CategoryListTab(),
            _ProductListTab(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showUpsertDialog(),
        icon: const Icon(Icons.add),
        label: Text(_tabController.index == 0 
          ? 'menu.add_category'.tr() 
          : 'menu.add_product'.tr()),
      ),
    );
  }

  void _showUpsertDialog() {
    if (_tabController.index == 0) {
      showDialog(
        context: context,
        builder: (context) => const _UpsertCategoryDialog(),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => const _UpsertProductDialog(),
      );
    }
  }

  Future<String?> _pickAndCropImage(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null || !context.mounted) return null;

    final croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'menu.browse_image'.tr(),
          toolbarColor: Theme.of(context).colorScheme.primary,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: 'menu.browse_image'.tr(),
          aspectRatioLockEnabled: true,
        ),
        WebUiSettings(
          context: context,
          presentStyle: WebPresentStyle.dialog,
          size: const CropperSize(width: 500, height: 500),
        ),
      ],
    );

    if (croppedFile == null || !context.mounted) return null;
    return croppedFile.path;
  }
}

class _CategoryListTab extends ConsumerWidget {
  const _CategoryListTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);

    return categoriesAsync.when(
      data: (categories) {
        if (categories.isEmpty) {
          return AppEmptyState(
            icon: Icons.category_outlined,
            title: 'menu.empty_categories'.tr(),
            message: '',
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: categories.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final category = categories[index];
            return Card(
              child: ListTile(
                title: Text(category.name),
                subtitle: Text('menu.sort_order'.tr(args: ['${category.sortOrder}'])),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit_outlined),
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => _UpsertCategoryDialog(category: category),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () => _confirmDelete(context, ref, category),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      loading: () => const AppLoadingState(),
      error: (error, _) => AppErrorState(
        message: error.toString(),
        onRetry: () => ref.invalidate(categoriesProvider),
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, Category category) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('menu.confirm_delete_title'.tr(args: [category.name])),
        content: Text('menu.confirm_delete_message'.tr()),
        actions: [
          TextButton(onPressed: () => context.pop(false), child: Text('common.cancel'.tr())),
          FilledButton(onPressed: () => context.pop(true), child: Text('menu.delete_category'.tr())),
        ],
      ),
    ) ?? false;

    if (confirmed) {
      await ref.read(inventoryActionsProvider.notifier).deleteCategory(category.id);
    }
  }
}

class _ProductListTab extends ConsumerWidget {
  const _ProductListTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(inventoryProductsProvider);

    return productsAsync.when(
      data: (products) {
        if (products.isEmpty) {
          return AppEmptyState(
            icon: Icons.restaurant_menu_outlined,
            title: 'menu.empty_products'.tr(),
            message: '',
          );
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            final responsive = ResponsiveLayout.fromConstraints(constraints);
            final columns = responsive.inventoryGridCount;

            return GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: responsive.inventoryCardAspectRatio,
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return _ProductManagementCard(product: product);
              },
            );
          },
        );
      },
      loading: () => const AppLoadingState(),
      error: (error, _) => AppErrorState(
        message: error.toString(),
        onRetry: () => ref.invalidate(inventoryProductsProvider),
      ),
    );
  }
}

class _ProductManagementCard extends ConsumerWidget {
  const _ProductManagementCard({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) async {
                    if (value == 'edit') {
                      await showDialog(
                        context: context,
                        builder: (context) => _UpsertProductDialog(product: product),
                      );
                    } else if (value == 'delete') {
                      await _confirmDelete(context, ref, product);
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          const Icon(Icons.edit_outlined, size: 20),
                          const SizedBox(width: 8),
                          Text('menu.edit_product'.tr()),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          const Icon(Icons.delete_outline, size: 20, color: Colors.red),
                          const SizedBox(width: 8),
                          Text('menu.delete_product'.tr()),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text('${product.sku} • \u0E3F${product.price.toStringAsFixed(2)}'),
            const Spacer(),
            Text('inventory.stock_remaining'.tr(args: ['${product.stockQuantity}'])),
            const SizedBox(height: 8),
            Chip(
              label: Text(product.category?.name ?? 'n/a'),
              visualDensity: VisualDensity.compact,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, Product product) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('menu.confirm_delete_title'.tr(args: [product.name])),
        content: Text('menu.confirm_delete_message'.tr()),
        actions: [
          TextButton(onPressed: () => context.pop(false), child: Text('common.cancel'.tr())),
          FilledButton(onPressed: () => context.pop(true), child: Text('menu.delete_product'.tr())),
        ],
      ),
    ) ?? false;

    if (confirmed) {
      await ref.read(inventoryActionsProvider.notifier).deleteProduct(product.id);
    }
  }
}

class _UpsertCategoryDialog extends ConsumerStatefulWidget {
  const _UpsertCategoryDialog({this.category});

  final Category? category;

  @override
  ConsumerState<_UpsertCategoryDialog> createState() => _UpsertCategoryDialogState();
}

class _UpsertCategoryDialogState extends ConsumerState<_UpsertCategoryDialog> {
  late final TextEditingController _nameController;
  late final TextEditingController _orderController;
  late final TextEditingController _imageController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.category?.name);
    _orderController = TextEditingController(text: (widget.category?.sortOrder ?? 0).toString());
    _imageController = TextEditingController(text: widget.category?.imageUrl);
    _imageController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _orderController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.category == null ? 'menu.add_category'.tr() : 'menu.edit_category'.tr()),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_imageController.text.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    _imageController.text,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      height: 120,
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.broken_image_outlined, size: 40),
                    ),
                  ),
                ),
              ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'menu.category_name'.tr()),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _orderController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'menu.sort_order'.tr()),
            ),
            const SizedBox(height: 12),
            if (kIsWeb)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'menu.web_image_warning'.tr(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.orange.shade800,
                  ),
                ),
              ),
            TextField(
              controller: _imageController,
              decoration: InputDecoration(
                labelText: 'menu.image_url_hint'.tr(),
                suffixIcon: IconButton(
                  onPressed: () async {
                    final parentState = context.findAncestorStateOfType<_MenuManagementPageState>();
                    final path = await parentState?._pickAndCropImage(context);
                    if (path != null) {
                      setState(() => _imageController.text = path);
                    }
                  },
                  icon: const Icon(Icons.add_photo_alternate_outlined),
                  tooltip: 'menu.browse_image'.tr(),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => context.pop(), child: Text('common.cancel'.tr())),
        FilledButton(
          onPressed: () async {
            final category = Category(
              id: widget.category?.id ?? '', // Repository handles autoincrement if empty
              name: _nameController.text.trim(),
              sortOrder: int.tryParse(_orderController.text.trim()) ?? 0,
              imageUrl: _imageController.text.trim().isEmpty ? null : _imageController.text.trim(),
            );
            await ref.read(inventoryActionsProvider.notifier).upsertCategory(category);
            if (context.mounted) context.pop();
          },
          child: Text('common.confirm'.tr()),
        ),
      ],
    );
  }
}

class _UpsertProductDialog extends ConsumerStatefulWidget {
  const _UpsertProductDialog({this.product});

  final Product? product;

  @override
  ConsumerState<_UpsertProductDialog> createState() => _UpsertProductDialogState();
}

class _UpsertProductDialogState extends ConsumerState<_UpsertProductDialog> {
  late final TextEditingController _nameController;
  late final TextEditingController _priceController;
  late final TextEditingController _skuController;
  late final TextEditingController _stockController;
  late final TextEditingController _imageController;
  String? _selectedCategoryId;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product?.name);
    _priceController = TextEditingController(text: widget.product?.price.toString());
    _skuController = TextEditingController(text: widget.product?.sku);
    _stockController = TextEditingController(text: widget.product?.stockQuantity.toString());
    _imageController = TextEditingController(text: widget.product?.imageUrl);
    _selectedCategoryId = widget.product?.category?.id;
    _imageController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _skuController.dispose();
    _stockController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(categoriesProvider);

    return AlertDialog(
      title: Text(widget.product == null ? 'menu.add_product'.tr() : 'menu.edit_product'.tr()),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_imageController.text.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    _imageController.text,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      height: 120,
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.broken_image_outlined, size: 40),
                    ),
                  ),
                ),
              ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'menu.product_name'.tr()),
            ),
            const SizedBox(height: 12),
            categoriesAsync.when(
              data: (categories) => DropdownButtonFormField<String>(
                // ignore: deprecated_member_use
                value: _selectedCategoryId,
                decoration: InputDecoration(labelText: 'menu.select_category'.tr()),
                items: categories.map((c) => DropdownMenuItem(value: c.id, child: Text(c.name))).toList(),
                onChanged: (val) => setState(() => _selectedCategoryId = val),
              ),
              loading: () => const CircularProgressIndicator(),
              error: (_, __) => Text('Error loading categories'),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'menu.price'.tr()),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _stockController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'menu.stock'.tr()),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _skuController,
              decoration: InputDecoration(labelText: 'menu.sku'.tr()),
            ),
            const SizedBox(height: 12),
            if (kIsWeb)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'menu.web_image_warning'.tr(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.orange.shade800,
                  ),
                ),
              ),
            TextField(
              controller: _imageController,
              decoration: InputDecoration(
                labelText: 'menu.image_url_hint'.tr(),
                suffixIcon: IconButton(
                  onPressed: () async {
                    final parentState = context.findAncestorStateOfType<_MenuManagementPageState>();
                    final path = await parentState?._pickAndCropImage(context);
                    if (path != null) {
                      setState(() => _imageController.text = path);
                    }
                  },
                  icon: const Icon(Icons.add_photo_alternate_outlined),
                  tooltip: 'menu.browse_image'.tr(),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => context.pop(), child: Text('common.cancel'.tr())),
        FilledButton(
          onPressed: () async {
            final category = _selectedCategoryId == null ? null : (await ref.read(categoriesProvider.future))
                .firstWhere((c) => c.id == _selectedCategoryId);

            final product = Product(
              id: widget.product?.id ?? '',
              name: _nameController.text.trim(),
              price: double.tryParse(_priceController.text.trim()) ?? 0,
              sku: _skuController.text.trim(),
              stockQuantity: int.tryParse(_stockController.text.trim()) ?? 0,
              isAvailable: (int.tryParse(_stockController.text.trim()) ?? 0) > 0,
              imageUrl: _imageController.text.trim().isEmpty ? null : _imageController.text.trim(),
              category: category,
            );
            await ref.read(inventoryActionsProvider.notifier).upsertProduct(product);
            if (context.mounted) context.pop();
          },
          child: Text('common.confirm'.tr()),
        ),
      ],
    );
  }
}
