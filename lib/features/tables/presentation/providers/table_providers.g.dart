// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tableRepositoryHash() => r'237036778669641a91e893035f5b968a45da4283';

/// See also [tableRepository].
@ProviderFor(tableRepository)
final tableRepositoryProvider = AutoDisposeProvider<TableRepository>.internal(
  tableRepository,
  name: r'tableRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tableRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TableRepositoryRef = AutoDisposeProviderRef<TableRepository>;
String _$tablesNotifierHash() => r'479d900d4cebf62fe7dc4b0ea1b4bbb1f722692e';

/// See also [TablesNotifier].
@ProviderFor(TablesNotifier)
final tablesNotifierProvider =
    AutoDisposeAsyncNotifierProvider<TablesNotifier, List<TableModel>>.internal(
  TablesNotifier.new,
  name: r'tablesNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tablesNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TablesNotifier = AutoDisposeAsyncNotifier<List<TableModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
