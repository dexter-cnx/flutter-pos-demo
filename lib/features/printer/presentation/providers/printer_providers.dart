import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/bluetooth_printer_datasource.dart';
import '../../data/datasources/printer_prefs_datasource.dart';
import '../../data/repositories/printer_repository_impl.dart';
import '../../domain/entities/printer_device.dart';
import '../../domain/entities/printer_status.dart';
import '../../domain/repositories/printer_repository.dart';
import '../../domain/services/receipt_print_service.dart';
import '../../../../features/receipt/domain/services/thermal_receipt_renderer.dart';
import '../../../../app/mode/current_mode_provider.dart';
import '../../../../app/bootstrap.dart';
import '../../data/models/receipt_template_model.dart';
import '../../domain/services/thai_thermal_printer.dart';
import '../../domain/services/kitchen_ticket_service.dart';
import '../../domain/services/edc_service.dart';
import 'package:thai_pos_demo/shared/domain/entities/app_permission.dart';
import 'package:thai_pos_demo/shared/presentation/providers/access_providers.dart';
import 'package:isar/isar.dart';
import 'package:thai_pos_demo/shared/presentation/providers/audit_providers.dart' hide isar;
import 'package:thai_pos_demo/shared/domain/enums/audit_event_type.dart';
import 'package:thai_pos_demo/shared/domain/enums/audit_event_source.dart';

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
ThaiThermalPrinter thaiThermalPrinter(Ref ref) {
  return ThaiThermalPrinter(ref.watch(bluetoothPrinterDatasourceProvider));
}

@riverpod
KitchenTicketService kitchenTicketService(Ref ref) {
  return KitchenTicketService(ref.watch(thaiThermalPrinterProvider));
}

@riverpod
EdcService edcService(Ref ref) {
  return MockEdcService();
}

@riverpod
ReceiptPrintService receiptPrintService(ReceiptPrintServiceRef ref) {
  final definition = ref.watch(currentModeDefinitionProvider);

  return ReceiptPrintService(
    printerRepository: ref.watch(printerRepositoryProvider),
    receiptComposer: definition.receiptComposer,
    auditService: ref.watch(auditServiceProvider),
    renderer: ThermalReceiptRenderer(), // Default to thermal for now
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
  final userProfile = ref.read(userAccessProfileProvider);
  final auditService = ref.read(auditServiceProvider);

  statusNotifier.setStatus(PrinterStatus.scanning);
  try {
    await ref.read(printerRepositoryProvider).connect(device.address);
    ref.read(selectedPrinterNotifierProvider.notifier).select(
          device.copyWith(isConnected: true),
        );
    statusNotifier.setStatus(PrinterStatus.connected);
    
    await auditService.logEvent(
      eventType: AuditEventType.printerSettingsChanged,
      entityType: 'printer',
      entityId: device.address,
      action: 'connected',
      actorId: userProfile.userId,
      actorLabel: userProfile.displayName,
      source: AuditEventSource.staff,
      summary: 'Printer connected: ${device.name} (${device.address})',
    );
    
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
  final permissionService = ref.read(permissionServiceProvider);
  final userProfile = ref.read(userAccessProfileProvider);
  final auditService = ref.read(auditServiceProvider);

  if (!permissionService.can(userProfile, AppPermission.printerChangeDefault)) {
    throw Exception('Permission Denied: printer.change_default');
  }

  await ref.read(printerRepositoryProvider).saveDefaultPrinter(
        address: device.address,
        name: device.name,
      );

  await auditService.logEvent(
    eventType: AuditEventType.printerSettingsChanged,
    entityType: 'printer',
    entityId: device.address,
    action: 'set_default',
    actorId: userProfile.userId,
    actorLabel: userProfile.displayName,
    source: AuditEventSource.staff,
    summary: 'Printer set as default: ${device.name}',
  );

  ref.invalidate(defaultPrinterProvider);
  ref.invalidate(pairedPrintersProvider);
}

// ─── Receipt Templates (Isar) ────────────────────────────────────────────────

@riverpod
Future<List<ReceiptTemplateModel>> allTemplates(Ref ref) {
  return isar!.receiptTemplateModels.where().findAll();
}

@riverpod
Future<ReceiptTemplateModel?> defaultReceiptTemplate(Ref ref) {
  return isar!.receiptTemplateModels
      .where()
      .filter()
      .typeEqualTo('receipt')
      .and()
      .isDefaultEqualTo(true)
      .findFirst();
}

@riverpod
Future<ReceiptTemplateModel?> defaultKitchenTemplate(Ref ref) {
  return isar!.receiptTemplateModels
      .where()
      .filter()
      .typeEqualTo('kitchen_ticket')
      .and()
      .isDefaultEqualTo(true)
      .findFirst();
}

@riverpod
class ReceiptTemplateNotifier extends _$ReceiptTemplateNotifier {
  @override
  FutureOr<ReceiptTemplateModel?> build(int templateId) {
    return isar!.receiptTemplateModels.get(templateId);
  }

  Future<void> updateTemplate(ReceiptTemplateModel template) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await isar!.writeTxn(() => isar!.receiptTemplateModels.put(template));
      ref.invalidateSelf();
      ref.invalidate(allTemplatesProvider);
      ref.invalidate(defaultReceiptTemplateProvider);
      ref.invalidate(defaultKitchenTemplateProvider);
      return template;
    });
  }
}
