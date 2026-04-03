// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_plan_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$floorPlanRepositoryHash() =>
    r'fb7564bdaeb05c3845255cf3e04aee03d94bec8f';

/// See also [floorPlanRepository].
@ProviderFor(floorPlanRepository)
final floorPlanRepositoryProvider = Provider<FloorPlanRepository>.internal(
  floorPlanRepository,
  name: r'floorPlanRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$floorPlanRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FloorPlanRepositoryRef = ProviderRef<FloorPlanRepository>;
String _$layoutObjectRepositoryHash() =>
    r'83617f2f33a0943e2b28db538e40d97cc979f89f';

/// See also [layoutObjectRepository].
@ProviderFor(layoutObjectRepository)
final layoutObjectRepositoryProvider =
    Provider<LayoutObjectRepository>.internal(
  layoutObjectRepository,
  name: r'layoutObjectRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$layoutObjectRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LayoutObjectRepositoryRef = ProviderRef<LayoutObjectRepository>;
String _$floorPlansHash() => r'a149312786c97bb203eb4352964caf1c696a7799';

/// See also [FloorPlans].
@ProviderFor(FloorPlans)
final floorPlansProvider =
    AutoDisposeAsyncNotifierProvider<FloorPlans, List<FloorPlan>>.internal(
  FloorPlans.new,
  name: r'floorPlansProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$floorPlansHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FloorPlans = AutoDisposeAsyncNotifier<List<FloorPlan>>;
String _$layoutObjectsHash() => r'bef715cba31837e25732450cffe69e9c7e817d9b';

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

abstract class _$LayoutObjects
    extends BuildlessAutoDisposeAsyncNotifier<List<LayoutObject>> {
  late final String floorPlanId;

  FutureOr<List<LayoutObject>> build(
    String floorPlanId,
  );
}

/// See also [LayoutObjects].
@ProviderFor(LayoutObjects)
const layoutObjectsProvider = LayoutObjectsFamily();

/// See also [LayoutObjects].
class LayoutObjectsFamily extends Family<AsyncValue<List<LayoutObject>>> {
  /// See also [LayoutObjects].
  const LayoutObjectsFamily();

  /// See also [LayoutObjects].
  LayoutObjectsProvider call(
    String floorPlanId,
  ) {
    return LayoutObjectsProvider(
      floorPlanId,
    );
  }

  @override
  LayoutObjectsProvider getProviderOverride(
    covariant LayoutObjectsProvider provider,
  ) {
    return call(
      provider.floorPlanId,
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
  String? get name => r'layoutObjectsProvider';
}

/// See also [LayoutObjects].
class LayoutObjectsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    LayoutObjects, List<LayoutObject>> {
  /// See also [LayoutObjects].
  LayoutObjectsProvider(
    String floorPlanId,
  ) : this._internal(
          () => LayoutObjects()..floorPlanId = floorPlanId,
          from: layoutObjectsProvider,
          name: r'layoutObjectsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$layoutObjectsHash,
          dependencies: LayoutObjectsFamily._dependencies,
          allTransitiveDependencies:
              LayoutObjectsFamily._allTransitiveDependencies,
          floorPlanId: floorPlanId,
        );

  LayoutObjectsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.floorPlanId,
  }) : super.internal();

  final String floorPlanId;

  @override
  FutureOr<List<LayoutObject>> runNotifierBuild(
    covariant LayoutObjects notifier,
  ) {
    return notifier.build(
      floorPlanId,
    );
  }

  @override
  Override overrideWith(LayoutObjects Function() create) {
    return ProviderOverride(
      origin: this,
      override: LayoutObjectsProvider._internal(
        () => create()..floorPlanId = floorPlanId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        floorPlanId: floorPlanId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<LayoutObjects, List<LayoutObject>>
      createElement() {
    return _LayoutObjectsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LayoutObjectsProvider && other.floorPlanId == floorPlanId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, floorPlanId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LayoutObjectsRef
    on AutoDisposeAsyncNotifierProviderRef<List<LayoutObject>> {
  /// The parameter `floorPlanId` of this provider.
  String get floorPlanId;
}

class _LayoutObjectsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<LayoutObjects,
        List<LayoutObject>> with LayoutObjectsRef {
  _LayoutObjectsProviderElement(super.provider);

  @override
  String get floorPlanId => (origin as LayoutObjectsProvider).floorPlanId;
}

String _$floorPlanViewToggleHash() =>
    r'c6ad6dcb2d7e2a7836e71a850c586079b21d301a';

/// See also [FloorPlanViewToggle].
@ProviderFor(FloorPlanViewToggle)
final floorPlanViewToggleProvider =
    AutoDisposeNotifierProvider<FloorPlanViewToggle, bool>.internal(
  FloorPlanViewToggle.new,
  name: r'floorPlanViewToggleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$floorPlanViewToggleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FloorPlanViewToggle = AutoDisposeNotifier<bool>;
String _$activeFloorPlanIdHash() => r'f45822a65cbce3c7c5695051635b50efedea60b1';

/// See also [ActiveFloorPlanId].
@ProviderFor(ActiveFloorPlanId)
final activeFloorPlanIdProvider =
    AutoDisposeNotifierProvider<ActiveFloorPlanId, String?>.internal(
  ActiveFloorPlanId.new,
  name: r'activeFloorPlanIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeFloorPlanIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActiveFloorPlanId = AutoDisposeNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
