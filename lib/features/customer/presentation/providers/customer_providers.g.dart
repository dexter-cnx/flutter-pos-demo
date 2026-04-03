// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$customerRepositoryHash() =>
    r'97524f481950cac17762225204acf33c1ec7428e';

/// See also [customerRepository].
@ProviderFor(customerRepository)
final customerRepositoryProvider = Provider<IsarCustomerRepository>.internal(
  customerRepository,
  name: r'customerRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$customerRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CustomerRepositoryRef = ProviderRef<IsarCustomerRepository>;
String _$customerSearchHash() => r'f488a4bd721b1661ad4953706d2af4d8c69d4ed9';

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

/// See also [customerSearch].
@ProviderFor(customerSearch)
const customerSearchProvider = CustomerSearchFamily();

/// See also [customerSearch].
class CustomerSearchFamily extends Family<AsyncValue<List<Customer>>> {
  /// See also [customerSearch].
  const CustomerSearchFamily();

  /// See also [customerSearch].
  CustomerSearchProvider call(
    String query,
  ) {
    return CustomerSearchProvider(
      query,
    );
  }

  @override
  CustomerSearchProvider getProviderOverride(
    covariant CustomerSearchProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'customerSearchProvider';
}

/// See also [customerSearch].
class CustomerSearchProvider extends AutoDisposeFutureProvider<List<Customer>> {
  /// See also [customerSearch].
  CustomerSearchProvider(
    String query,
  ) : this._internal(
          (ref) => customerSearch(
            ref as CustomerSearchRef,
            query,
          ),
          from: customerSearchProvider,
          name: r'customerSearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$customerSearchHash,
          dependencies: CustomerSearchFamily._dependencies,
          allTransitiveDependencies:
              CustomerSearchFamily._allTransitiveDependencies,
          query: query,
        );

  CustomerSearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<Customer>> Function(CustomerSearchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CustomerSearchProvider._internal(
        (ref) => create(ref as CustomerSearchRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Customer>> createElement() {
    return _CustomerSearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CustomerSearchProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CustomerSearchRef on AutoDisposeFutureProviderRef<List<Customer>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _CustomerSearchProviderElement
    extends AutoDisposeFutureProviderElement<List<Customer>>
    with CustomerSearchRef {
  _CustomerSearchProviderElement(super.provider);

  @override
  String get query => (origin as CustomerSearchProvider).query;
}

String _$promotionRepositoryHash() =>
    r'6c07cdcbc93b3f10f77365853f2d1d5d12b64105';

/// See also [promotionRepository].
@ProviderFor(promotionRepository)
final promotionRepositoryProvider = Provider<IsarPromotionRepository>.internal(
  promotionRepository,
  name: r'promotionRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$promotionRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PromotionRepositoryRef = ProviderRef<IsarPromotionRepository>;
String _$activePromotionsHash() => r'a330239fc3950c4d302d7101603c67b46c5e00eb';

/// See also [activePromotions].
@ProviderFor(activePromotions)
final activePromotionsProvider =
    AutoDisposeFutureProvider<List<Promotion>>.internal(
  activePromotions,
  name: r'activePromotionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activePromotionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ActivePromotionsRef = AutoDisposeFutureProviderRef<List<Promotion>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
