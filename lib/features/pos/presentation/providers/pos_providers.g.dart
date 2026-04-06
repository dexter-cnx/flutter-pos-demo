// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$posRepositoryHash() => r'c0c55d4b2c60cd12866208ca464f80d29d44a997';

/// See also [posRepository].
@ProviderFor(posRepository)
final posRepositoryProvider = AutoDisposeProvider<PosRepository>.internal(
  posRepository,
  name: r'posRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$posRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PosRepositoryRef = AutoDisposeProviderRef<PosRepository>;
String _$categoriesHash() => r'b6c80ecf7c95a29393d93558798552adb235b9d5';

/// See also [categories].
@ProviderFor(categories)
final categoriesProvider = AutoDisposeFutureProvider<List<Category>>.internal(
  categories,
  name: r'categoriesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$categoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CategoriesRef = AutoDisposeFutureProviderRef<List<Category>>;
String _$categoryCountHash() => r'd659ce7c5649b9bbdb84ef9c8d0739c7e7cdf8e4';

/// See also [categoryCount].
@ProviderFor(categoryCount)
final categoryCountProvider = AutoDisposeFutureProvider<int>.internal(
  categoryCount,
  name: r'categoryCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoryCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CategoryCountRef = AutoDisposeFutureProviderRef<int>;
String _$productsHash() => r'b1268e82504fee42d6c6c0aab8239153b57ba924';

/// See also [products].
@ProviderFor(products)
final productsProvider = AutoDisposeFutureProvider<List<Product>>.internal(
  products,
  name: r'productsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$productsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProductsRef = AutoDisposeFutureProviderRef<List<Product>>;
String _$inventoryProductsHash() => r'7ed0fad9f7b1b1904a3447f7b19538260f35e38b';

/// See also [inventoryProducts].
@ProviderFor(inventoryProducts)
final inventoryProductsProvider =
    AutoDisposeFutureProvider<List<Product>>.internal(
  inventoryProducts,
  name: r'inventoryProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$inventoryProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef InventoryProductsRef = AutoDisposeFutureProviderRef<List<Product>>;
String _$productCountHash() => r'66ea9c8698b0200c05cee799703499985f2fa261';

/// See also [productCount].
@ProviderFor(productCount)
final productCountProvider = AutoDisposeFutureProvider<int>.internal(
  productCount,
  name: r'productCountProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$productCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProductCountRef = AutoDisposeFutureProviderRef<int>;
String _$lowStockCountHash() => r'b270f677938bfe45c4b1fea9ce566f3d6f21a3a9';

/// See also [lowStockCount].
@ProviderFor(lowStockCount)
final lowStockCountProvider = AutoDisposeFutureProvider<int>.internal(
  lowStockCount,
  name: r'lowStockCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$lowStockCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LowStockCountRef = AutoDisposeFutureProviderRef<int>;
String _$selectedCategoryIdHash() =>
    r'e200877d189e9efa39b0a04655f56101e28aaf21';

/// See also [SelectedCategoryId].
@ProviderFor(SelectedCategoryId)
final selectedCategoryIdProvider =
    AutoDisposeNotifierProvider<SelectedCategoryId, String?>.internal(
  SelectedCategoryId.new,
  name: r'selectedCategoryIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedCategoryIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedCategoryId = AutoDisposeNotifier<String?>;
String _$inventoryActionsHash() => r'570c851a10830e2045e21c1353e924777507f107';

/// See also [InventoryActions].
@ProviderFor(InventoryActions)
final inventoryActionsProvider =
    AutoDisposeAsyncNotifierProvider<InventoryActions, void>.internal(
  InventoryActions.new,
  name: r'inventoryActionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$inventoryActionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$InventoryActions = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
