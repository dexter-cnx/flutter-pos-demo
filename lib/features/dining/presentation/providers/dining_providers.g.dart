// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dining_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$diningSessionRepositoryHash() =>
    r'd11d395dac0b6ce4651e3ced6d65e890449b28ae';

/// See also [diningSessionRepository].
@ProviderFor(diningSessionRepository)
final diningSessionRepositoryProvider =
    AutoDisposeProvider<DiningSessionRepository>.internal(
  diningSessionRepository,
  name: r'diningSessionRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$diningSessionRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DiningSessionRepositoryRef
    = AutoDisposeProviderRef<DiningSessionRepository>;
String _$activeDiningSessionIdHash() =>
    r'82963eadf86b2a414b84f13de4e012bf882b4ad2';

/// See also [ActiveDiningSessionId].
@ProviderFor(ActiveDiningSessionId)
final activeDiningSessionIdProvider =
    AutoDisposeNotifierProvider<ActiveDiningSessionId, int?>.internal(
  ActiveDiningSessionId.new,
  name: r'activeDiningSessionIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeDiningSessionIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActiveDiningSessionId = AutoDisposeNotifier<int?>;
String _$diningSessionsNotifierHash() =>
    r'a6ff91c14cd00009d4cfb443eec43894cf891c9c';

/// See also [DiningSessionsNotifier].
@ProviderFor(DiningSessionsNotifier)
final diningSessionsNotifierProvider = AutoDisposeAsyncNotifierProvider<
    DiningSessionsNotifier, List<DiningSessionModel>>.internal(
  DiningSessionsNotifier.new,
  name: r'diningSessionsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$diningSessionsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DiningSessionsNotifier
    = AutoDisposeAsyncNotifier<List<DiningSessionModel>>;
String _$activeDiningSessionHash() =>
    r'247460732ccd2450ff48f64c2ac06e161549e8ab';

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

abstract class _$ActiveDiningSession
    extends BuildlessAutoDisposeAsyncNotifier<DiningSessionModel?> {
  late final int sessionId;

  FutureOr<DiningSessionModel?> build(
    int sessionId,
  );
}

/// See also [ActiveDiningSession].
@ProviderFor(ActiveDiningSession)
const activeDiningSessionProvider = ActiveDiningSessionFamily();

/// See also [ActiveDiningSession].
class ActiveDiningSessionFamily
    extends Family<AsyncValue<DiningSessionModel?>> {
  /// See also [ActiveDiningSession].
  const ActiveDiningSessionFamily();

  /// See also [ActiveDiningSession].
  ActiveDiningSessionProvider call(
    int sessionId,
  ) {
    return ActiveDiningSessionProvider(
      sessionId,
    );
  }

  @override
  ActiveDiningSessionProvider getProviderOverride(
    covariant ActiveDiningSessionProvider provider,
  ) {
    return call(
      provider.sessionId,
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
  String? get name => r'activeDiningSessionProvider';
}

/// See also [ActiveDiningSession].
class ActiveDiningSessionProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ActiveDiningSession, DiningSessionModel?> {
  /// See also [ActiveDiningSession].
  ActiveDiningSessionProvider(
    int sessionId,
  ) : this._internal(
          () => ActiveDiningSession()..sessionId = sessionId,
          from: activeDiningSessionProvider,
          name: r'activeDiningSessionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$activeDiningSessionHash,
          dependencies: ActiveDiningSessionFamily._dependencies,
          allTransitiveDependencies:
              ActiveDiningSessionFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  ActiveDiningSessionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
  }) : super.internal();

  final int sessionId;

  @override
  FutureOr<DiningSessionModel?> runNotifierBuild(
    covariant ActiveDiningSession notifier,
  ) {
    return notifier.build(
      sessionId,
    );
  }

  @override
  Override overrideWith(ActiveDiningSession Function() create) {
    return ProviderOverride(
      origin: this,
      override: ActiveDiningSessionProvider._internal(
        () => create()..sessionId = sessionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ActiveDiningSession,
      DiningSessionModel?> createElement() {
    return _ActiveDiningSessionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ActiveDiningSessionProvider && other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ActiveDiningSessionRef
    on AutoDisposeAsyncNotifierProviderRef<DiningSessionModel?> {
  /// The parameter `sessionId` of this provider.
  int get sessionId;
}

class _ActiveDiningSessionProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ActiveDiningSession,
        DiningSessionModel?> with ActiveDiningSessionRef {
  _ActiveDiningSessionProviderElement(super.provider);

  @override
  int get sessionId => (origin as ActiveDiningSessionProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
