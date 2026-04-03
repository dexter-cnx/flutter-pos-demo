// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buffet_tier_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$buffetTierRepositoryHash() =>
    r'5899e555817c0aaba271e6b56c4028b5d75d7acc';

/// See also [buffetTierRepository].
@ProviderFor(buffetTierRepository)
final buffetTierRepositoryProvider =
    AutoDisposeProvider<BuffetTierRepository>.internal(
  buffetTierRepository,
  name: r'buffetTierRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$buffetTierRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BuffetTierRepositoryRef = AutoDisposeProviderRef<BuffetTierRepository>;
String _$activeBuffetTiersHash() => r'1be27431a9def966bcdd14a6d62ac89209e0f3c5';

/// See also [activeBuffetTiers].
@ProviderFor(activeBuffetTiers)
final activeBuffetTiersProvider =
    AutoDisposeFutureProvider<List<BuffetTier>>.internal(
  activeBuffetTiers,
  name: r'activeBuffetTiersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeBuffetTiersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ActiveBuffetTiersRef = AutoDisposeFutureProviderRef<List<BuffetTier>>;
String _$allBuffetTiersHash() => r'ddaffa0b8adec9a16e1c38d0130e63af1f957637';

/// See also [allBuffetTiers].
@ProviderFor(allBuffetTiers)
final allBuffetTiersProvider =
    AutoDisposeFutureProvider<List<BuffetTier>>.internal(
  allBuffetTiers,
  name: r'allBuffetTiersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allBuffetTiersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllBuffetTiersRef = AutoDisposeFutureProviderRef<List<BuffetTier>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
