// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_mode_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appProfileHash() => r'4bb899097778fd6c9cc100cf5964f5f30e8e1069';

/// See also [appProfile].
@ProviderFor(appProfile)
final appProfileProvider = AutoDisposeFutureProvider<AppProfile>.internal(
  appProfile,
  name: r'appProfileProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppProfileRef = AutoDisposeFutureProviderRef<AppProfile>;
String _$currentBusinessModeHash() =>
    r'9f87046a7a3fb0ef4f5ce2a69fe1e72573c96787';

/// Provides the current active business mode (identity).
///
/// Copied from [currentBusinessMode].
@ProviderFor(currentBusinessMode)
final currentBusinessModeProvider = AutoDisposeProvider<BusinessMode>.internal(
  currentBusinessMode,
  name: r'currentBusinessModeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentBusinessModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentBusinessModeRef = AutoDisposeProviderRef<BusinessMode>;
String _$currentModeDefinitionHash() =>
    r'06c0d77c35aa55414f0e4807f3be662352065071';

/// Provides the full definition for the currently active mode.
///
/// Copied from [currentModeDefinition].
@ProviderFor(currentModeDefinition)
final currentModeDefinitionProvider =
    AutoDisposeProvider<BusinessModeDefinition>.internal(
  currentModeDefinition,
  name: r'currentModeDefinitionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentModeDefinitionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentModeDefinitionRef
    = AutoDisposeProviderRef<BusinessModeDefinition>;
String _$isCapabilityEnabledHash() =>
    r'e486df19df90d2705712035f67a37aa6e845418a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Helper to check if a specific capability is enabled in the current mode.
///
/// Copied from [isCapabilityEnabled].
@ProviderFor(isCapabilityEnabled)
const isCapabilityEnabledProvider = IsCapabilityEnabledFamily();

/// Helper to check if a specific capability is enabled in the current mode.
///
/// Copied from [isCapabilityEnabled].
class IsCapabilityEnabledFamily extends Family<bool> {
  /// Helper to check if a specific capability is enabled in the current mode.
  ///
  /// Copied from [isCapabilityEnabled].
  const IsCapabilityEnabledFamily();

  /// Helper to check if a specific capability is enabled in the current mode.
  ///
  /// Copied from [isCapabilityEnabled].
  IsCapabilityEnabledProvider call(
    FeatureCapability capability,
  ) {
    return IsCapabilityEnabledProvider(
      capability,
    );
  }

  @override
  IsCapabilityEnabledProvider getProviderOverride(
    covariant IsCapabilityEnabledProvider provider,
  ) {
    return call(
      provider.capability,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'isCapabilityEnabledProvider';
}

/// Helper to check if a specific capability is enabled in the current mode.
///
/// Copied from [isCapabilityEnabled].
class IsCapabilityEnabledProvider extends AutoDisposeProvider<bool> {
  /// Helper to check if a specific capability is enabled in the current mode.
  ///
  /// Copied from [isCapabilityEnabled].
  IsCapabilityEnabledProvider(
    FeatureCapability capability,
  ) : this._internal(
          (ref) => isCapabilityEnabled(
            ref as IsCapabilityEnabledRef,
            capability,
          ),
          from: isCapabilityEnabledProvider,
          name: r'isCapabilityEnabledProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isCapabilityEnabledHash,
          dependencies: IsCapabilityEnabledFamily._dependencies,
          allTransitiveDependencies:
              IsCapabilityEnabledFamily._allTransitiveDependencies,
          capability: capability,
        );

  IsCapabilityEnabledProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.capability,
  }) : super.internal();

  final FeatureCapability capability;

  @override
  Override overrideWith(
    bool Function(IsCapabilityEnabledRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsCapabilityEnabledProvider._internal(
        (ref) => create(ref as IsCapabilityEnabledRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        capability: capability,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<bool> createElement() {
    return _IsCapabilityEnabledProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsCapabilityEnabledProvider &&
        other.capability == capability;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, capability.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IsCapabilityEnabledRef on AutoDisposeProviderRef<bool> {
  /// The parameter `capability` of this provider.
  FeatureCapability get capability;
}

class _IsCapabilityEnabledProviderElement
    extends AutoDisposeProviderElement<bool> with IsCapabilityEnabledRef {
  _IsCapabilityEnabledProviderElement(super.provider);

  @override
  FeatureCapability get capability =>
      (origin as IsCapabilityEnabledProvider).capability;
}

String _$appProfileNotifierHash() =>
    r'5bfc6078abf957f536a23ab58787a10d4172b03f';

/// See also [AppProfileNotifier].
@ProviderFor(AppProfileNotifier)
final appProfileNotifierProvider =
    AutoDisposeAsyncNotifierProvider<AppProfileNotifier, AppProfile>.internal(
  AppProfileNotifier.new,
  name: r'appProfileNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appProfileNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppProfileNotifier = AutoDisposeAsyncNotifier<AppProfile>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
