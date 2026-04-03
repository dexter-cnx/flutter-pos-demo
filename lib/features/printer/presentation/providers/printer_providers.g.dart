// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'printer_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bluetoothPrinterDatasourceHash() =>
    r'c394ee1675654bf49f4866aa45f0484eed308497';

/// See also [bluetoothPrinterDatasource].
@ProviderFor(bluetoothPrinterDatasource)
final bluetoothPrinterDatasourceProvider =
    AutoDisposeProvider<BluetoothPrinterDatasource>.internal(
  bluetoothPrinterDatasource,
  name: r'bluetoothPrinterDatasourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$bluetoothPrinterDatasourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BluetoothPrinterDatasourceRef
    = AutoDisposeProviderRef<BluetoothPrinterDatasource>;
String _$printerPrefsDatasourceHash() =>
    r'75573433b7e1ee3b96e928d32936b49ac2669d42';

/// See also [printerPrefsDatasource].
@ProviderFor(printerPrefsDatasource)
final printerPrefsDatasourceProvider =
    AutoDisposeProvider<PrinterPrefsDatasource>.internal(
  printerPrefsDatasource,
  name: r'printerPrefsDatasourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$printerPrefsDatasourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PrinterPrefsDatasourceRef
    = AutoDisposeProviderRef<PrinterPrefsDatasource>;
String _$printerRepositoryHash() => r'deb8d1ed69cda5936b5372dbbbd10beabd5435dd';

/// See also [printerRepository].
@ProviderFor(printerRepository)
final printerRepositoryProvider =
    AutoDisposeProvider<PrinterRepository>.internal(
  printerRepository,
  name: r'printerRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$printerRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PrinterRepositoryRef = AutoDisposeProviderRef<PrinterRepository>;
String _$thaiThermalPrinterHash() =>
    r'aa0656c03d7f2f1303fcaf898026ffcee39cf8be';

/// See also [thaiThermalPrinter].
@ProviderFor(thaiThermalPrinter)
final thaiThermalPrinterProvider =
    AutoDisposeProvider<ThaiThermalPrinter>.internal(
  thaiThermalPrinter,
  name: r'thaiThermalPrinterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$thaiThermalPrinterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ThaiThermalPrinterRef = AutoDisposeProviderRef<ThaiThermalPrinter>;
String _$kitchenTicketServiceHash() =>
    r'ddb6685eb98f8c76a534fad63e543403606fdc9f';

/// See also [kitchenTicketService].
@ProviderFor(kitchenTicketService)
final kitchenTicketServiceProvider =
    AutoDisposeProvider<KitchenTicketService>.internal(
  kitchenTicketService,
  name: r'kitchenTicketServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$kitchenTicketServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef KitchenTicketServiceRef = AutoDisposeProviderRef<KitchenTicketService>;
String _$edcServiceHash() => r'c0094dc6df30f578afe0af19c2dd2071526a176c';

/// See also [edcService].
@ProviderFor(edcService)
final edcServiceProvider = AutoDisposeProvider<EdcService>.internal(
  edcService,
  name: r'edcServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$edcServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EdcServiceRef = AutoDisposeProviderRef<EdcService>;
String _$receiptPrintServiceHash() =>
    r'65d9890c5e8aecfe9c0ee9ab1d666451d0422e44';

/// See also [receiptPrintService].
@ProviderFor(receiptPrintService)
final receiptPrintServiceProvider =
    AutoDisposeProvider<ReceiptPrintService>.internal(
  receiptPrintService,
  name: r'receiptPrintServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$receiptPrintServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ReceiptPrintServiceRef = AutoDisposeProviderRef<ReceiptPrintService>;
String _$pairedPrintersHash() => r'c138e7e892ee921e67202d477f87597bc2e9f8a1';

/// Loads paired Bluetooth printers on demand.
///
/// Copied from [pairedPrinters].
@ProviderFor(pairedPrinters)
final pairedPrintersProvider =
    AutoDisposeFutureProvider<List<PrinterDevice>>.internal(
  pairedPrinters,
  name: r'pairedPrintersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pairedPrintersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PairedPrintersRef = AutoDisposeFutureProviderRef<List<PrinterDevice>>;
String _$defaultPrinterHash() => r'9583a0741b282dba8a8c4394a94383b739ae5242';

/// Loads the persisted default printer from prefs.
///
/// Copied from [defaultPrinter].
@ProviderFor(defaultPrinter)
final defaultPrinterProvider =
    AutoDisposeFutureProvider<PrinterDevice?>.internal(
  defaultPrinter,
  name: r'defaultPrinterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$defaultPrinterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DefaultPrinterRef = AutoDisposeFutureProviderRef<PrinterDevice?>;
String _$allTemplatesHash() => r'770c3300701fa1859620c2bf2ab309b10c173394';

/// See also [allTemplates].
@ProviderFor(allTemplates)
final allTemplatesProvider =
    AutoDisposeFutureProvider<List<ReceiptTemplateModel>>.internal(
  allTemplates,
  name: r'allTemplatesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allTemplatesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllTemplatesRef
    = AutoDisposeFutureProviderRef<List<ReceiptTemplateModel>>;
String _$defaultReceiptTemplateHash() =>
    r'515ba20da694913542c462d5d1342502ef6fa418';

/// See also [defaultReceiptTemplate].
@ProviderFor(defaultReceiptTemplate)
final defaultReceiptTemplateProvider =
    AutoDisposeFutureProvider<ReceiptTemplateModel?>.internal(
  defaultReceiptTemplate,
  name: r'defaultReceiptTemplateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$defaultReceiptTemplateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DefaultReceiptTemplateRef
    = AutoDisposeFutureProviderRef<ReceiptTemplateModel?>;
String _$defaultKitchenTemplateHash() =>
    r'7d538abd0f84674db1c6e7bb4904ab46d32ab586';

/// See also [defaultKitchenTemplate].
@ProviderFor(defaultKitchenTemplate)
final defaultKitchenTemplateProvider =
    AutoDisposeFutureProvider<ReceiptTemplateModel?>.internal(
  defaultKitchenTemplate,
  name: r'defaultKitchenTemplateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$defaultKitchenTemplateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DefaultKitchenTemplateRef
    = AutoDisposeFutureProviderRef<ReceiptTemplateModel?>;
String _$printerStatusNotifierHash() =>
    r'1260272fdf7a3808ec6be719ce16fba7b7716917';

/// Current connection status of the printer subsystem.
///
/// Copied from [PrinterStatusNotifier].
@ProviderFor(PrinterStatusNotifier)
final printerStatusNotifierProvider =
    AutoDisposeNotifierProvider<PrinterStatusNotifier, PrinterStatus>.internal(
  PrinterStatusNotifier.new,
  name: r'printerStatusNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$printerStatusNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PrinterStatusNotifier = AutoDisposeNotifier<PrinterStatus>;
String _$selectedPrinterNotifierHash() =>
    r'66912735b950fed6a768f1f5ed2a8cbe96851c01';

/// The printer the user has actively selected in this session.
///
/// Copied from [SelectedPrinterNotifier].
@ProviderFor(SelectedPrinterNotifier)
final selectedPrinterNotifierProvider = AutoDisposeNotifierProvider<
    SelectedPrinterNotifier, PrinterDevice?>.internal(
  SelectedPrinterNotifier.new,
  name: r'selectedPrinterNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedPrinterNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedPrinterNotifier = AutoDisposeNotifier<PrinterDevice?>;
String _$receiptTemplateNotifierHash() =>
    r'a046c4e5810dc87475f28fb13558a7a2184b5e52';

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

abstract class _$ReceiptTemplateNotifier
    extends BuildlessAutoDisposeAsyncNotifier<ReceiptTemplateModel?> {
  late final int templateId;

  FutureOr<ReceiptTemplateModel?> build(
    int templateId,
  );
}

/// See also [ReceiptTemplateNotifier].
@ProviderFor(ReceiptTemplateNotifier)
const receiptTemplateNotifierProvider = ReceiptTemplateNotifierFamily();

/// See also [ReceiptTemplateNotifier].
class ReceiptTemplateNotifierFamily
    extends Family<AsyncValue<ReceiptTemplateModel?>> {
  /// See also [ReceiptTemplateNotifier].
  const ReceiptTemplateNotifierFamily();

  /// See also [ReceiptTemplateNotifier].
  ReceiptTemplateNotifierProvider call(
    int templateId,
  ) {
    return ReceiptTemplateNotifierProvider(
      templateId,
    );
  }

  @override
  ReceiptTemplateNotifierProvider getProviderOverride(
    covariant ReceiptTemplateNotifierProvider provider,
  ) {
    return call(
      provider.templateId,
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
  String? get name => r'receiptTemplateNotifierProvider';
}

/// See also [ReceiptTemplateNotifier].
class ReceiptTemplateNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ReceiptTemplateNotifier,
        ReceiptTemplateModel?> {
  /// See also [ReceiptTemplateNotifier].
  ReceiptTemplateNotifierProvider(
    int templateId,
  ) : this._internal(
          () => ReceiptTemplateNotifier()..templateId = templateId,
          from: receiptTemplateNotifierProvider,
          name: r'receiptTemplateNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$receiptTemplateNotifierHash,
          dependencies: ReceiptTemplateNotifierFamily._dependencies,
          allTransitiveDependencies:
              ReceiptTemplateNotifierFamily._allTransitiveDependencies,
          templateId: templateId,
        );

  ReceiptTemplateNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.templateId,
  }) : super.internal();

  final int templateId;

  @override
  FutureOr<ReceiptTemplateModel?> runNotifierBuild(
    covariant ReceiptTemplateNotifier notifier,
  ) {
    return notifier.build(
      templateId,
    );
  }

  @override
  Override overrideWith(ReceiptTemplateNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ReceiptTemplateNotifierProvider._internal(
        () => create()..templateId = templateId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        templateId: templateId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ReceiptTemplateNotifier,
      ReceiptTemplateModel?> createElement() {
    return _ReceiptTemplateNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReceiptTemplateNotifierProvider &&
        other.templateId == templateId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, templateId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ReceiptTemplateNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<ReceiptTemplateModel?> {
  /// The parameter `templateId` of this provider.
  int get templateId;
}

class _ReceiptTemplateNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ReceiptTemplateNotifier,
        ReceiptTemplateModel?> with ReceiptTemplateNotifierRef {
  _ReceiptTemplateNotifierProviderElement(super.provider);

  @override
  int get templateId => (origin as ReceiptTemplateNotifierProvider).templateId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
