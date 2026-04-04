# Dart Language Conventions

## Purpose
Dart language-specific conventions and best practices.

---

## Import Order

```dart
// Libraries
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:isar/isar.dart';

// Project
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../models/product_model.dart';

// Local
import 'product_page.dart';
import 'product_provider.dart';
```

---

## Class Organization

### Order of Members
```dart
class ProductProvider extends _$ProductProvider {
  // 1. State
  Product state = Product(...);

  // 2. Methods
  Future<void> initialize() async {
    // ...
  }

  // 3. Public methods
  Future<void> loadProducts() async {
    // ...
  }

  // 4. Private methods
  void _validate(String id) {
    // ...
  }
}
```

### StatelessWidget Build Method
```dart
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(...),
      body: ...
    );
  }
}
```

---

## Null Safety

### Prefer Non-Nullable Types
```dart
// Good
String name;
int count;
double price;

// Avoid
String? name; // unless nullable makes sense
int? count;   // only if count can be zero
```

### Nullable Parameters
```dart
// Good
Future<void> saveData(String? value) async {
  // value can be null intentionally
}

// Bad
Future<void> saveData(dynamic value) async { // too permissive
}
```

---

## Extension Methods

### Prefer Extensions Over Helper Classes
```dart
// Good
extension ProductExtensions on Product {
  String get displayName => name.isNotEmpty ? name : sku;
  bool get isOutOfStock => stockQuantity <= 0;
  double get priceWithVat => price * 1.07;
}

// Bad
class ProductHelper {
  static String getDisplayName(Product product) {
    return product.name.isNotEmpty ? product.name : product.sku;
  }
}
```

### Extension Usage
```dart
final product = Product(...);
final name = product.displayName;          // Extension property
final inStock = product.isOutOfStock;      // Extension property
final finalPrice = product.priceWithVat;   // Extension property
```

---

## Generics

### Generic Repository Interface
```dart
abstract class ProductRepository<T extends Entity> {
  Future<List<T>> getAll();
  Future<T?> getById(String id);
}
```

### Generic Provider
```dart
@riverpod
class ProductCache<T extends Product>(ProductCacheRef ref) {
  T? get<T extends Product>(String id) => _cache[id as String] as T?;
}
```

---

## Const Constructors

### Use Const Where Possible
```dart
class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    this.onTap,
    this.showQuantity = true,
    super.key,
  });

  final Product product;
  final VoidCallback? onTap;
  final bool showQuantity;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // ...
      ),
    );
  }
}
```

### Const Initialization
```dart
class AppTheme {
  static const Color primary = Color(0xFF6366F1);
  static const Color secondary = Color(0xFF10B981);
  
  static const textStyles = TextStyles(
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    // ...
  );
}
```

---

## Mixins vs Composition

### Prefer Composition
```dart
// Good
class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(...),
        if (showQuantity)
          Positioned(...)
      ],
    );
  }
}

// Bad
class ProductCard extends StatelessWidget with QuantityMixin {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ...
    );
  }
}
```

---

## Separation of Concerns

### Widget Composition
```dart
class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}
```

### Provider Usage
```dart
class ProductGrid extends ConsumerWidget {
  @override
  Widget build(BuildContext context, AsyncValue<List<Product>> state) {
    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (products) => GridView.builder(...),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}
```

---

## Collection Handling

### Prefer Where/Map/Reduce
```dart
// Good
final outOfStockProducts = products
    .where((p) => p.stockQuantity <= 0)
    .toList();

// Bad
final outOfStockProducts = [];
for (var product in products) {
  if (product.stockQuantity <= 0) {
    outOfStockProducts.add(product);
  }
}
```

### Safe Access
```dart
// Good
final price = product.price ?? 0;
final name = product.name ?? product.sku;

// Bad
try {
  final name = product.name;
} catch (e) {
  final name = product.sku;
}
```

---

## Comments

### When to Comment
- **DO** explain WHY, not WHAT
- **DO** document complex algorithms
- **DON'T** comment every line
- **DON'T** use `// TODO:` without issue tracker link

### Good Comments
```dart
// Convert model to entity after fetching from Isar database
// This ensures domain entities are used throughout the app
Product toEntity() {
  return Product(
    id: id,
    name: name,
    // ...
  );
}
```

### Bad Comments
```dart
// Get product
final product = await getProductById(id); // fetch product

// Create card
return Card(child: Text(product.name)); // create widget
```

---

## Error Handling

### Throw with Meaningful Messages
```dart
throw ProductValidationError('SKU must contain at least 3 characters');
throw NotFoundError('Product with ID $id not found');
```

### Catch Specific Errors
```dart
try {
  await repository.saveProduct(product);
} on ProductValidationError catch (e) {
  showError('Product validation error: ${e.message}');
}
```

---

## Logging

### Prefer Error Handling Over Logging
```dart
// Good
try {
  await repository.saveProduct(product);
} catch (e, st) {
  await logError('Failed to save product', e, st);
}

// Bad
await repository.saveProduct(product); // logs everything
```

---

## Last Updated
April 2026
