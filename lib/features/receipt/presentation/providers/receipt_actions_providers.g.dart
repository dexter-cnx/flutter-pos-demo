// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_actions_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$downloadedReceiptPathHash() =>
    r'9cca74feaff7f2c8cb324a25fa589362e7726a62';

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

abstract class _$DownloadedReceiptPath
    extends BuildlessAutoDisposeNotifier<String?> {
  late final int orderId;

  String? build(
    int orderId,
  );
}

/// See also [DownloadedReceiptPath].
@ProviderFor(DownloadedReceiptPath)
const downloadedReceiptPathProvider = DownloadedReceiptPathFamily();

/// See also [DownloadedReceiptPath].
class DownloadedReceiptPathFamily extends Family<String?> {
  /// See also [DownloadedReceiptPath].
  const DownloadedReceiptPathFamily();

  /// See also [DownloadedReceiptPath].
  DownloadedReceiptPathProvider call(
    int orderId,
  ) {
    return DownloadedReceiptPathProvider(
      orderId,
    );
  }

  @override
  DownloadedReceiptPathProvider getProviderOverride(
    covariant DownloadedReceiptPathProvider provider,
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
  String? get name => r'downloadedReceiptPathProvider';
}

/// See also [DownloadedReceiptPath].
class DownloadedReceiptPathProvider
    extends AutoDisposeNotifierProviderImpl<DownloadedReceiptPath, String?> {
  /// See also [DownloadedReceiptPath].
  DownloadedReceiptPathProvider(
    int orderId,
  ) : this._internal(
          () => DownloadedReceiptPath()..orderId = orderId,
          from: downloadedReceiptPathProvider,
          name: r'downloadedReceiptPathProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$downloadedReceiptPathHash,
          dependencies: DownloadedReceiptPathFamily._dependencies,
          allTransitiveDependencies:
              DownloadedReceiptPathFamily._allTransitiveDependencies,
          orderId: orderId,
        );

  DownloadedReceiptPathProvider._internal(
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
  String? runNotifierBuild(
    covariant DownloadedReceiptPath notifier,
  ) {
    return notifier.build(
      orderId,
    );
  }

  @override
  Override overrideWith(DownloadedReceiptPath Function() create) {
    return ProviderOverride(
      origin: this,
      override: DownloadedReceiptPathProvider._internal(
        () => create()..orderId = orderId,
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
  AutoDisposeNotifierProviderElement<DownloadedReceiptPath, String?>
      createElement() {
    return _DownloadedReceiptPathProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DownloadedReceiptPathProvider && other.orderId == orderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, orderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DownloadedReceiptPathRef on AutoDisposeNotifierProviderRef<String?> {
  /// The parameter `orderId` of this provider.
  int get orderId;
}

class _DownloadedReceiptPathProviderElement
    extends AutoDisposeNotifierProviderElement<DownloadedReceiptPath, String?>
    with DownloadedReceiptPathRef {
  _DownloadedReceiptPathProviderElement(super.provider);

  @override
  int get orderId => (origin as DownloadedReceiptPathProvider).orderId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
