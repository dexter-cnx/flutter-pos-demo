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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
