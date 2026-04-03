// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_mode_registry.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$businessModeRegistryHash() =>
    r'f3c488042b8c2a560dc7ec67703d42e7b926dbf4';

/// Registry of all supported business modes in the application.
///
/// Copied from [businessModeRegistry].
@ProviderFor(businessModeRegistry)
final businessModeRegistryProvider =
    AutoDisposeProvider<Map<BusinessMode, BusinessModeDefinition>>.internal(
  businessModeRegistry,
  name: r'businessModeRegistryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$businessModeRegistryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BusinessModeRegistryRef
    = AutoDisposeProviderRef<Map<BusinessMode, BusinessModeDefinition>>;
String _$businessModeDefinitionHash() =>
    r'56bc94af9e1d4fee75598e3b7da183c90fa1e594';

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

/// Helper provider to get a mode definition by its identity.
///
/// Copied from [businessModeDefinition].
@ProviderFor(businessModeDefinition)
const businessModeDefinitionProvider = BusinessModeDefinitionFamily();

/// Helper provider to get a mode definition by its identity.
///
/// Copied from [businessModeDefinition].
class BusinessModeDefinitionFamily extends Family<BusinessModeDefinition> {
  /// Helper provider to get a mode definition by its identity.
  ///
  /// Copied from [businessModeDefinition].
  const BusinessModeDefinitionFamily();

  /// Helper provider to get a mode definition by its identity.
  ///
  /// Copied from [businessModeDefinition].
  BusinessModeDefinitionProvider call(
    BusinessMode mode,
  ) {
    return BusinessModeDefinitionProvider(
      mode,
    );
  }

  @override
  BusinessModeDefinitionProvider getProviderOverride(
    covariant BusinessModeDefinitionProvider provider,
  ) {
    return call(
      provider.mode,
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
  String? get name => r'businessModeDefinitionProvider';
}

/// Helper provider to get a mode definition by its identity.
///
/// Copied from [businessModeDefinition].
class BusinessModeDefinitionProvider
    extends AutoDisposeProvider<BusinessModeDefinition> {
  /// Helper provider to get a mode definition by its identity.
  ///
  /// Copied from [businessModeDefinition].
  BusinessModeDefinitionProvider(
    BusinessMode mode,
  ) : this._internal(
          (ref) => businessModeDefinition(
            ref as BusinessModeDefinitionRef,
            mode,
          ),
          from: businessModeDefinitionProvider,
          name: r'businessModeDefinitionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$businessModeDefinitionHash,
          dependencies: BusinessModeDefinitionFamily._dependencies,
          allTransitiveDependencies:
              BusinessModeDefinitionFamily._allTransitiveDependencies,
          mode: mode,
        );

  BusinessModeDefinitionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mode,
  }) : super.internal();

  final BusinessMode mode;

  @override
  Override overrideWith(
    BusinessModeDefinition Function(BusinessModeDefinitionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BusinessModeDefinitionProvider._internal(
        (ref) => create(ref as BusinessModeDefinitionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mode: mode,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<BusinessModeDefinition> createElement() {
    return _BusinessModeDefinitionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BusinessModeDefinitionProvider && other.mode == mode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BusinessModeDefinitionRef
    on AutoDisposeProviderRef<BusinessModeDefinition> {
  /// The parameter `mode` of this provider.
  BusinessMode get mode;
}

class _BusinessModeDefinitionProviderElement
    extends AutoDisposeProviderElement<BusinessModeDefinition>
    with BusinessModeDefinitionRef {
  _BusinessModeDefinitionProviderElement(super.provider);

  @override
  BusinessMode get mode => (origin as BusinessModeDefinitionProvider).mode;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
