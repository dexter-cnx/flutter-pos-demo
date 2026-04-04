# New Product Screen Example

## Overview

This is a complete example of adding a new "Product Screen" feature to the POS system.

---

## Feature Description

A screen to browse and manage products in the store.

**Capabilities:**
- Browse all products
- Search products by name/category
- Filter by status (active/inactive)
- Add new products
- Edit existing products
- Delete products
- View product details

---

## Files Created

### Domain Layer

1. **Product Entity** (`domain/entities/product.freezed.dart`)
   - Product model with id, name, price, sku, etc.

2. **Product Repository Interface** (`domain/repositories/product_repository.dart`)
   - Interface for product operations

### Data Layer

1. **Product Model** (`data/models/product_model.dart`)
   - Isar data model with indexes

2. **Local Product Repository** (`data/repositories/local_product_repository.dart`)
   - Implementation using Isar

### Presentation Layer

1. **Product Providers** (`presentation/providers/product_providers.dart`)
   - Riverpod providers for state management

2. **Product Page** (`presentation/pages/product_page.dart`)
   - Main page widget

3. **Product List Widget** (`presentation/widgets/product_list_tile.dart`)
   - List item widget

4. **Product Form Widget** (`presentation/widgets/product_form.dart`)
   - Add/Edit form widget

### Seed Data

5. **Product Seeds** (`lib/app/services/data_seeder.dart`)
   - Seed products for demo

---

## Implementation Steps

### Step 1: Domain Entity

```dart
// lib/features/product/domain/entities/product.freezed.dart
@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    required double price,
    required String sku,
    required String category,
    required bool isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Product;
}
```

**Why these fields:**
- `id`: Primary key
- `name`: Product name
- `price`: Selling price
- `sku`: Stock keeping unit
- `category`: Product category
- `isActive`: Soft delete flag
- `createdAt/updatedAt`: Audit fields

---

### Step 2: Repository Interface

```dart
// lib/features/product/domain/repositories/product_repository.dart
abstract class ProductRepository {
  Future<List<Product>> getAll();
  Future<Product?> getById(String id);
  Future<void> add(Product product);
  Future<void> update(Product product);
  Future<void> delete(String id);
  Future<Product?> searchByName(String name);
  Future<List<Product>> getActive();
  Future<List<Product>> getByCategory(String category);
}
```

---

### Step 3: Data Model

```dart
// lib/features/product/data/models/product_model.dart
@collection(name: 'products')
abstract class ProductModel implements IsarObject, Product {
  Id? id;
  required String name;
  required double price;
  required String sku;
  required String category;
  required bool isActive;
  DateTime createdAt = DateTime.now();
  DateTime? updatedAt;

  // Indexes for queries
  @index
  String get indexBySku => sku;

  @index
  String get indexByCategory => category;

  @index
  bool get isActive => isActive;
}
```

---

### Step 4: Repository Implementation

```dart
// lib/features/product/data/repositories/local_product_repository.dart
class LocalProductRepository implements ProductRepository {
  final IsarProductModelCollection _collection = Isar.ProductModelCollection();

  @override
  Future<List<Product>> getAll() async {
    final models = await _collection.find().sortBy('name').limit(-1).toList();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<Product?> getById(String id) async {
    final model = await _collection.get(id: id);
    return model?.toEntity();
  }

  @override
  Future<void> add(Product product) async {
    final model = ProductModel.fromEntity(product);
    await _collection.add(model);
  }

  @override
  Future<void> update(Product product) async {
    final model = await _collection.get(id: product.id);
    if (model != null) {
      model.name = product.name;
      model.price = product.price;
      // ... update other fields
      await _collection.put(model);
    }
  }

  @override
  Future<void> delete(String id) async {
    await _collection.delete(id);
  }

  @override
  Future<Product?> searchByName(String name) async {
    final models = await _collection.filter<ProductModel>((q) =>
      q.name.contains(name),
    ).limit(10).toList();
    return models.first?.toEntity();
  }
}
```

---

### Step 5: Riverpod Providers

```dart
// lib/features/product/presentation/providers/product_providers.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/local_product_repository.dart';
import '../../domain/repositories/product_repository.dart';

part 'product_providers.g.dart';

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  return LocalProductRepository();
}

@riverpod
Future<List<Product>> all(AllRef ref) async {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getAll();
}

@riverpod
Future<Product?> byId(ByIdRef ref, String id) async {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getById(id);
}
```

---

### Step 6: Main Page

```dart
// lib/features/product/presentation/pages/product_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/product_providers.dart';
import '../widgets/product_list_tile.dart';
import '../widgets/product_form_dialog.dart';

class ProductPage extends ConsumerStatefulWidget {
  const ProductPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  final _searchController = TextEditingController();
  String _filter = 'all'; // all, active, inactive
  ProductFormDialog? _formDialog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Column(
        children: [
          // Search and filter
          _buildSearchAndFilter(),
          // Product list
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: ref.watch(allProvider).when(
                  loading: (_) => 0,
                  error: (_, __) => 0,
                  data: (products) => products.length,
                ),
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (_, index) {
                  final product = ref
                      .watch(allProvider)
                      .when(
                        loading: (_) => null,
                        error: (_, __) => null,
                        data: (products) => products[index],
                      );
                  return product != null
                      ? ProductListTile(product: product, onTap: () => _onTap(product))
                      : const SizedBox.shrink();
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddForm(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

---

### Step 7: List Tile Widget

```dart
// lib/features/product/presentation/widgets/product_list_tile.dart
class ProductListTile extends StatelessWidget {
  const ProductListTile({
    required this.product,
    this.onTap,
    super.key,
  });

  final Product product;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text(
        'S/ ${product.price.toStringAsFixed(2)} • ${product.sku}',
      ),
      trailing: Chip(label: Text(product.category)),
      onTap: onTap,
    );
  }
}
```

---

### Step 8: Seed Data

```dart
// lib/app/services/data_seeder.dart (add these)

final products = [
  Product(
    id: '1',
    name: 'Product A',
    price: 19.99,
    sku: 'SKU001',
    category: 'Electronics',
    isActive: true,
    createdAt: DateTime.now(),
  ),
  Product(
    id: '2',
    name: 'Product B',
    price: 29.99,
    sku: 'SKU002',
    category: 'Electronics',
    isActive: true,
    createdAt: DateTime.now(),
  ),
  // ... more products
];
```

---

## Usage

### Running the Feature

```bash
# Start the app
flutter run

# Navigate to Products
/app/product
```

### Adding a Product

1. Tap the + FAB
2. Fill in the form
3. Tap Save

### Searching

1. Type in the search box
2. Results filter automatically

### Refreshing

- Pull down to refresh
- Or tap the refresh icon

---

## Testing

### Unit Test

```dart
// test/features/product/product_repository_test.dart
void main() {
  test('getAll returns products', () async {
    final repository = LocalProductRepository();
    final products = await repository.getAll();
    expect(products, isNotEmpty);
  });
}
```

### Widget Test

```dart
// test/widget_features/product/product_page_test.dart
void main() {
  testWidgets('shows products', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ProductPage(),
      ),
    );
    expect(find.text('Products'), findsOneWidget);
    expect(find.text('Add'), findsOneWidget);
  });
}
```

---

## Related Examples

- [`../cart-checkout-flow/`](../cart-checkout-flow/)
- [`../../antigravity/`](../../antigravity/README.md)
