// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingsRepositoryHash() =>
    r'13f6379bb1daf12acaa8176554ba9d2f38de0b05';

/// See also [settingsRepository].
@ProviderFor(settingsRepository)
final settingsRepositoryProvider =
    AutoDisposeProvider<SettingsRepository>.internal(
      settingsRepository,
      name: r'settingsRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$settingsRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef SettingsRepositoryRef = AutoDisposeProviderRef<SettingsRepository>;
String _$storeProfileHash() => r'96e3371393d69129e89a58426f2f2a6582da45f9';

/// See also [storeProfile].
@ProviderFor(storeProfile)
final storeProfileProvider = AutoDisposeFutureProvider<StoreProfile>.internal(
  storeProfile,
  name: r'storeProfileProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$storeProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StoreProfileRef = AutoDisposeFutureProviderRef<StoreProfile>;
String _$lowStockThresholdHash() => r'4d1455154e2d6d8aa84bd67cf3551d4eb8cef7d9';

/// See also [lowStockThreshold].
@ProviderFor(lowStockThreshold)
final lowStockThresholdProvider = AutoDisposeFutureProvider<int>.internal(
  lowStockThreshold,
  name: r'lowStockThresholdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$lowStockThresholdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LowStockThresholdRef = AutoDisposeFutureProviderRef<int>;
String _$settingsControllerHash() =>
    r'30fbf570aa9f713049a3f8641ef49154f47d24cd';

/// See also [SettingsController].
@ProviderFor(SettingsController)
final settingsControllerProvider =
    AutoDisposeAsyncNotifierProvider<SettingsController, void>.internal(
      SettingsController.new,
      name: r'settingsControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$settingsControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SettingsController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
