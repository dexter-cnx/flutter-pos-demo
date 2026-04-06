// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$accessRepositoryHash() => r'32159d250ed02eae4d56833fa3582bbde69ae0c1';

/// See also [accessRepository].
@ProviderFor(accessRepository)
final accessRepositoryProvider = AutoDisposeProvider<AccessRepository>.internal(
  accessRepository,
  name: r'accessRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$accessRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AccessRepositoryRef = AutoDisposeProviderRef<AccessRepository>;
String _$permissionServiceHash() => r'12ee1c079a8f2ada7ea63a5892a7d4065a670397';

/// See also [permissionService].
@ProviderFor(permissionService)
final permissionServiceProvider =
    AutoDisposeProvider<PermissionService>.internal(
  permissionService,
  name: r'permissionServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$permissionServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PermissionServiceRef = AutoDisposeProviderRef<PermissionService>;
String _$userAccessProfileHash() => r'71d8454fcb6c1ff0d894b3956e6c13958c4ad817';

/// See also [userAccessProfile].
@ProviderFor(userAccessProfile)
final userAccessProfileProvider =
    AutoDisposeProvider<UserAccessProfile>.internal(
  userAccessProfile,
  name: r'userAccessProfileProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userAccessProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserAccessProfileRef = AutoDisposeProviderRef<UserAccessProfile>;
String _$hasPermissionHash() => r'000c035dae3787f273a1839afdf6ca2a70d9e765';

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

/// See also [hasPermission].
@ProviderFor(hasPermission)
const hasPermissionProvider = HasPermissionFamily();

/// See also [hasPermission].
class HasPermissionFamily extends Family<bool> {
  /// See also [hasPermission].
  const HasPermissionFamily();

  /// See also [hasPermission].
  HasPermissionProvider call(
    AppPermission permission,
  ) {
    return HasPermissionProvider(
      permission,
    );
  }

  @override
  HasPermissionProvider getProviderOverride(
    covariant HasPermissionProvider provider,
  ) {
    return call(
      provider.permission,
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
  String? get name => r'hasPermissionProvider';
}

/// See also [hasPermission].
class HasPermissionProvider extends AutoDisposeProvider<bool> {
  /// See also [hasPermission].
  HasPermissionProvider(
    AppPermission permission,
  ) : this._internal(
          (ref) => hasPermission(
            ref as HasPermissionRef,
            permission,
          ),
          from: hasPermissionProvider,
          name: r'hasPermissionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$hasPermissionHash,
          dependencies: HasPermissionFamily._dependencies,
          allTransitiveDependencies:
              HasPermissionFamily._allTransitiveDependencies,
          permission: permission,
        );

  HasPermissionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.permission,
  }) : super.internal();

  final AppPermission permission;

  @override
  Override overrideWith(
    bool Function(HasPermissionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HasPermissionProvider._internal(
        (ref) => create(ref as HasPermissionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        permission: permission,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<bool> createElement() {
    return _HasPermissionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HasPermissionProvider && other.permission == permission;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, permission.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HasPermissionRef on AutoDisposeProviderRef<bool> {
  /// The parameter `permission` of this provider.
  AppPermission get permission;
}

class _HasPermissionProviderElement extends AutoDisposeProviderElement<bool>
    with HasPermissionRef {
  _HasPermissionProviderElement(super.provider);

  @override
  AppPermission get permission => (origin as HasPermissionProvider).permission;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
