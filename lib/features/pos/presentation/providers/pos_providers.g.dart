// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$posRepositoryHash() => r'6f3287f403649654c51f8ad7c33fde8ac0edbdb0';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
