// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ordersHash() => r'07daf038f476a03c148559fa83623c15450b25c4';

/// See also [orders].
@ProviderFor(orders)
final ordersProvider = AutoDisposeFutureProvider<List<OrderModel>>.internal(
  orders,
  name: r'ordersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ordersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OrdersRef = AutoDisposeFutureProviderRef<List<OrderModel>>;
String _$orderReceiptHash() => r'fef0b4d09baad33287c088ccf058934368ab7158';

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

/// See also [orderReceipt].
@ProviderFor(orderReceipt)
const orderReceiptProvider = OrderReceiptFamily();

/// See also [orderReceipt].
class OrderReceiptFamily extends Family<AsyncValue<OrderModel?>> {
  /// See also [orderReceipt].
  const OrderReceiptFamily();

  /// See also [orderReceipt].
  OrderReceiptProvider call(
    int orderId,
  ) {
    return OrderReceiptProvider(
      orderId,
    );
  }

  @override
  OrderReceiptProvider getProviderOverride(
    covariant OrderReceiptProvider provider,
  ) {
    return call(
      provider.orderId,
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
  String? get name => r'orderReceiptProvider';
}

/// See also [orderReceipt].
class OrderReceiptProvider extends AutoDisposeFutureProvider<OrderModel?> {
  /// See also [orderReceipt].
  OrderReceiptProvider(
    int orderId,
  ) : this._internal(
          (ref) => orderReceipt(
            ref as OrderReceiptRef,
            orderId,
          ),
          from: orderReceiptProvider,
          name: r'orderReceiptProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$orderReceiptHash,
          dependencies: OrderReceiptFamily._dependencies,
          allTransitiveDependencies:
              OrderReceiptFamily._allTransitiveDependencies,
          orderId: orderId,
        );

  OrderReceiptProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.orderId,
  }) : super.internal();

  final int orderId;

  @override
  Override overrideWith(
    FutureOr<OrderModel?> Function(OrderReceiptRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OrderReceiptProvider._internal(
        (ref) => create(ref as OrderReceiptRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        orderId: orderId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<OrderModel?> createElement() {
    return _OrderReceiptProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OrderReceiptProvider && other.orderId == orderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, orderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OrderReceiptRef on AutoDisposeFutureProviderRef<OrderModel?> {
  /// The parameter `orderId` of this provider.
  int get orderId;
}

class _OrderReceiptProviderElement
    extends AutoDisposeFutureProviderElement<OrderModel?> with OrderReceiptRef {
  _OrderReceiptProviderElement(super.provider);

  @override
  int get orderId => (origin as OrderReceiptProvider).orderId;
}

String _$orderCountHash() => r'c5f8051f7bbc6fb34806655d64598baa162d6c92';

/// See also [orderCount].
@ProviderFor(orderCount)
final orderCountProvider = AutoDisposeFutureProvider<int>.internal(
  orderCount,
  name: r'orderCountProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$orderCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OrderCountRef = AutoDisposeFutureProviderRef<int>;
String _$orderHistoryHash() => r'9c0c8b27c53c92a34479c2cc55963a6cb93ded1c';

/// See also [OrderHistory].
@ProviderFor(OrderHistory)
final orderHistoryProvider =
    AutoDisposeAsyncNotifierProvider<OrderHistory, void>.internal(
  OrderHistory.new,
  name: r'orderHistoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$orderHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OrderHistory = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
