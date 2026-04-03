// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$analyticsServiceHash() => r'b93f51a5ac8bf6a253d885701fd40418edd3f4d4';

/// See also [analyticsService].
@ProviderFor(analyticsService)
final analyticsServiceProvider = Provider<AnalyticsService>.internal(
  analyticsService,
  name: r'analyticsServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$analyticsServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AnalyticsServiceRef = ProviderRef<AnalyticsService>;
String _$todaySummaryHash() => r'c885da5ce30ae245d955812d431df32e127ba992';

/// See also [todaySummary].
@ProviderFor(todaySummary)
final todaySummaryProvider = AutoDisposeFutureProvider<DailySummary>.internal(
  todaySummary,
  name: r'todaySummaryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todaySummaryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TodaySummaryRef = AutoDisposeFutureProviderRef<DailySummary>;
String _$revenueByDateRangeHash() =>
    r'6b9508289f88296ddc9d4120064721a4558933b8';

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

/// See also [revenueByDateRange].
@ProviderFor(revenueByDateRange)
const revenueByDateRangeProvider = RevenueByDateRangeFamily();

/// See also [revenueByDateRange].
class RevenueByDateRangeFamily
    extends Family<AsyncValue<List<DailyDataPoint>>> {
  /// See also [revenueByDateRange].
  const RevenueByDateRangeFamily();

  /// See also [revenueByDateRange].
  RevenueByDateRangeProvider call({
    required DateTime start,
    required DateTime end,
  }) {
    return RevenueByDateRangeProvider(
      start: start,
      end: end,
    );
  }

  @override
  RevenueByDateRangeProvider getProviderOverride(
    covariant RevenueByDateRangeProvider provider,
  ) {
    return call(
      start: provider.start,
      end: provider.end,
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
  String? get name => r'revenueByDateRangeProvider';
}

/// See also [revenueByDateRange].
class RevenueByDateRangeProvider
    extends AutoDisposeFutureProvider<List<DailyDataPoint>> {
  /// See also [revenueByDateRange].
  RevenueByDateRangeProvider({
    required DateTime start,
    required DateTime end,
  }) : this._internal(
          (ref) => revenueByDateRange(
            ref as RevenueByDateRangeRef,
            start: start,
            end: end,
          ),
          from: revenueByDateRangeProvider,
          name: r'revenueByDateRangeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$revenueByDateRangeHash,
          dependencies: RevenueByDateRangeFamily._dependencies,
          allTransitiveDependencies:
              RevenueByDateRangeFamily._allTransitiveDependencies,
          start: start,
          end: end,
        );

  RevenueByDateRangeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.start,
    required this.end,
  }) : super.internal();

  final DateTime start;
  final DateTime end;

  @override
  Override overrideWith(
    FutureOr<List<DailyDataPoint>> Function(RevenueByDateRangeRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RevenueByDateRangeProvider._internal(
        (ref) => create(ref as RevenueByDateRangeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        start: start,
        end: end,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<DailyDataPoint>> createElement() {
    return _RevenueByDateRangeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RevenueByDateRangeProvider &&
        other.start == start &&
        other.end == end;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, start.hashCode);
    hash = _SystemHash.combine(hash, end.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RevenueByDateRangeRef
    on AutoDisposeFutureProviderRef<List<DailyDataPoint>> {
  /// The parameter `start` of this provider.
  DateTime get start;

  /// The parameter `end` of this provider.
  DateTime get end;
}

class _RevenueByDateRangeProviderElement
    extends AutoDisposeFutureProviderElement<List<DailyDataPoint>>
    with RevenueByDateRangeRef {
  _RevenueByDateRangeProviderElement(super.provider);

  @override
  DateTime get start => (origin as RevenueByDateRangeProvider).start;
  @override
  DateTime get end => (origin as RevenueByDateRangeProvider).end;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
