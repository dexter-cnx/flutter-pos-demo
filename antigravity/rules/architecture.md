# Clean Architecture Rules

## Purpose
Rules for implementing Clean Architecture in this Flutter POS system.

---

## Layer Structure

```
lib/
├── app/                      # App-wide configurations
└── features/                 # Feature modules
    ├── auth/
    ├── checkout/
    ├── home/
    ├── inventory/
    ├── orders/
    ├── pos/
    ├── receipt/
    └── settings/

feature/
├── data/                     # Implementations (repositories, datasources)
│   ├── models/              # Data models (Isar, API, etc.)
│   └── repositories/        # Repository implementations
├── domain/                   # Pure business logic
│   ├── entities/           # Domain entities (freezed)
│   ├── repositories/       # Repository abstractions
│   └── usecases/           # Business logic
└── presentation/            # UI layer
    ├── pages/              # Screens
    ├── providers/          # Riverpod providers
    ├── widgets/            # Reusable widgets
    └── services/           # Platform services
```

---

## Layer Responsibilities

### Presentation Layer (`presentation/`)
- **UI widgets and pages**
- **Riverpod providers** for UI state
- **Input handling**
- **Error UI** (loading, empty, error states)

**DO:**
- Keep UI logic in widgets
- Use providers for state management
- Handle input validation at UI level

**DON'T:**
- Add business logic here
- Make API calls
- Parse JSON responses
- Query database directly

### Domain Layer (`domain/`)
- **Business logic** (pure Dart)
- **Domain entities**
- **Repository interfaces**
- **Use cases**

**DO:**
- Define entity classes with `@freezed`
- Create repository abstractions
- Implement business logic in use cases

**DON'T:**
- Add platform-specific code
- Use database calls
- Query external APIs

### Data Layer (`data/`)
- **Repository implementations**
- **Data models** (Isar, JSON, etc.)
- **Local/remote datasources**
- **Seed data**

**DO:**
- Implement repository abstractions
- Work with data models
- Handle offline/online states

**DON'T:**
- Expose database directly
- Add UI code
- Implement business logic

---

## Repository Pattern

### Example: Product Repository

**Domain (Interface)**
```dart
// lib/features/pos/domain/repositories/pos_repository.dart
abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
  Future<Product?> getProductById(String id);
  Future<void> deleteProduct(String id);
}
```

**Data (Implementation)**
```dart
// lib/features/pos/data/repositories/local_pos_repository.dart
class LocalProductRepository implements ProductRepository {
  @override
  Future<List<Product>> getAllProducts() async {
    // Query Isar database
    return productCollection.find()...;
  }
}
```

**Presentation (Usage)**
```dart
// lib/features/pos/presentation/providers/pos_providers.dart
@riverpod
Future<List<Product>> products(ProductsRef ref) async {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getAllProducts();
}
```

---

## Entity vs Model

### Domain Entities
```dart
// lib/features/pos/domain/entities/product.dart
@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    required double price,
    required String sku,
    @Default(0) int stockQuantity,
    @Default(true) bool isAvailable,
  }) = _Product;
}
```

### Data Models
```dart
// lib/features/pos/data/models/product_model.dart
class ProductModel {
  String id;
  String name;
  double price;
  String sku;
  int stockQuantity;
  bool isAvailable;
  
  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.sku,
    required this.stockQuantity,
    required this.isAvailable,
  });

  Product toEntity() {
    return Product(
      id: id,
      name: name,
      price: price,
      sku: sku,
      stockQuantity: stockQuantity,
      isAvailable: isAvailable,
    );
  }
}
```

**Convert** models to entities in repository implementation.

---

## Seed Data

### Seed Data Service
```dart
// lib/app/services/data_seeder.dart
class DataSeeder {
  Future<void> seedData() async {
    // Create categories
    // Create products
    // Seed store profile
  }
}
```

### Usage
```dart
// Initialize seed data on first app run
@riverpod
class AppDataNotifier extends _$AppDataNotifier {
  @override
  AppData state = AppData(isInitialized: false);

  Future<void> initialize() async {
    final seeder = DataSeeder();
    await seeder.seedData();
    state = AppData(isInitialized: true);
  }
}
```

---

## Error Handling

### Domain Errors
```dart
// Define error types in domain layer
sealed class ProductError {
  const ProductError();
  
  const ProductError.generic() : _$type = 'generic';
  const ProductError.notFound(String id) : _$type = 'notFound($id)';
  const ProductError.invalidStock(String sku, int current, int required) 
      : _$type = 'invalidStock($sku,$current,$required)';
}
```

### Error Propagation
```dart
// Use Result pattern or throw errors
Future<Product?> getProductById(String id) async {
  try {
    final product = await _repository.getProductById(id);
    return product;
  } on ProductNotFoundException {
    return null; // or throw
  } catch (e) {
    throw ProductError.generic();
  }
}
```

### UI Error Handling
```dart
@riverpod
class Products extends _$Products {
  @override
  AsyncValue<List<Product>> build() {
    return AsyncLoading();
  }

  Future<void> loadProducts() async {
    try {
      state = AsyncLoading();
      final products = await ref.watch(productsProvider);
      state = AsyncData(products);
    } on ProductError catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }
}
```

---

## Validation Rules

### Domain Validation
```dart
// In domain entities or use cases
class Product extends Equatable {
  Product({
    required this.sku,
    required this.name,
    required this.price,
    required this.stockQuantity,
  }) {
    _validate();
  }

  void _validate() {
    if (sku.isEmpty || sku.length < 3) {
      throw ProductValidationError('SKU must be at least 3 characters');
    }
    if (price <= 0) {
      throw ProductValidationError('Price must be greater than 0');
    }
  }
}
```

### Repository Validation
```dart
@override
Future<void> deleteProduct(String id) async {
  // Validate permissions
  if (!await _hasPermission('delete_products')) {
    throw RepositoryError('Permission denied');
  }

  // Validate stock warning
  final product = await _getProductById(id);
  if (product.stockQuantity <= 5) {
    _logWarning('Product low stock before deletion: $id');
  }

  // Delete
  await _repository.delete(id);
}
```

---

## Last Updated
April 2026
