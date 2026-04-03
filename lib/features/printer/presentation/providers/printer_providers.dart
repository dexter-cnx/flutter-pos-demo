import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/bluetooth_printer_datasource.dart';
import '../../data/datasources/printer_prefs_datasource.dart';
import '../../data/repositories/printer_repository_impl.dart';
import '../../domain/entities/printer_device.dart';
import '../../domain/entities/printer_status.dart';
import '../../domain/repositories/printer_repository.dart';
import '../../domain/services/receipt_print_service.dart';
import '../../../../features/receipt/domain/services/retail_receipt_composer.dart';

part 'printer_providers.g.dart';

// ─── Infrastructure ──────────────────────────────────────────────────────────

@riverpod
BluetoothPrinterDatasource bluetoothPrinterDatasource(Ref ref) {
  return BluetoothPrinterDatasource();
}

@riverpod
PrinterPrefsDatasource printerPrefsDatasource(Ref ref) {
  return PrinterPrefsDatasource();
}

@riverpod
PrinterRepository printerRepository(Ref ref) {
  return PrinterRepositoryImpl(
    bluetoothDatasource: ref.watch(bluetoothPrinterDatasourceProvider),
    prefsDatasource: ref.watch(printerPrefsDatasourceProvider),
  );
}

@riverpod
ReceiptPrintService receiptPrintService(Ref ref) {
  return ReceiptPrintService(
    printerRepository: ref.watch(printerRepositoryProvider),
    receiptComposer: RetailReceiptComposer(),
  );
}

// ─── State ───────────────────────────────────────────────────────────────────

/// Current connection status of the printer subsystem.
@riverpod
class PrinterStatusNotifier extends _$PrinterStatusNotifier {
  @override
  PrinterStatus build() => PrinterStatus.idle;

  void setStatus(PrinterStatus status) => state = status;
}

/// The printer the user has actively selected in this session.
@riverpod
class SelectedPrinterNotifier extends _$SelectedPrinterNotifier {
  @override
  PrinterDevice? build() => null;

  void select(PrinterDevice device) => state = device;
  void clear() => state = null;
}

// ─── Async data ───────────────────────────────────────────────────────────────

/// Loads paired Bluetooth printers on demand.
@riverpod
Future<List<PrinterDevice>> pairedPrinters(Ref ref) async {
  return ref.watch(printerRepositoryProvider).getPairedPrinters();
}

/// Loads the persisted default printer from prefs.
@riverpod
Future<PrinterDevice?> defaultPrinter(Ref ref) async {
  return ref.watch(printerRepositoryProvider).loadDefaultPrinter();
}

// ─── Actions ──────────────────────────────────────────────────────────────────

/// Connects to [device] and updates status accordingly.
Future<void> connectPrinter(WidgetRef ref, PrinterDevice device) async {
  final statusNotifier = ref.read(printerStatusNotifierProvider.notifier);
  statusNotifier.setStatus(PrinterStatus.scanning);
  try {
    await ref.read(printerRepositoryProvider).connect(device.address);
    ref.read(selectedPrinterNotifierProvider.notifier).select(
          device.copyWith(isConnected: true),
        );
    statusNotifier.setStatus(PrinterStatus.connected);
    ref.invalidate(pairedPrintersProvider);
  } catch (_) {
    statusNotifier.setStatus(PrinterStatus.error);
    rethrow;
  }
}

/// Disconnects the active printer.
Future<void> disconnectPrinter(WidgetRef ref) async {
  final statusNotifier = ref.read(printerStatusNotifierProvider.notifier);
  try {
    await ref.read(printerRepositoryProvider).disconnect();
    ref.read(selectedPrinterNotifierProvider.notifier).clear();
    statusNotifier.setStatus(PrinterStatus.disconnected);
    ref.invalidate(pairedPrintersProvider);
  } catch (_) {
    statusNotifier.setStatus(PrinterStatus.error);
    rethrow;
  }
}

/// Sends a test print to the connected printer.
Future<void> testPrint(WidgetRef ref) async {
  final statusNotifier = ref.read(printerStatusNotifierProvider.notifier);
  statusNotifier.setStatus(PrinterStatus.printing);
  try {
    await ref.read(printerRepositoryProvider).testPrint();
    statusNotifier.setStatus(PrinterStatus.connected);
  } catch (_) {
    statusNotifier.setStatus(PrinterStatus.error);
    rethrow;
  }
}

/// Saves [device] as the system-wide default printer.
Future<void> saveAsDefault(WidgetRef ref, PrinterDevice device) async {
  await ref.read(printerRepositoryProvider).saveDefaultPrinter(
        address: device.address,
        name: device.name,
      );
  ref.invalidate(defaultPrinterProvider);
  ref.invalidate(pairedPrintersProvider);
}
