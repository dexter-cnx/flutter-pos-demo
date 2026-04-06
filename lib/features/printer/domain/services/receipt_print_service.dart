import '../../../../features/orders/data/models/order_model.dart';
import '../../../../features/settings/domain/entities/store_profile.dart';
import '../../../receipt/domain/services/receipt_composer.dart';
import '../../../receipt/domain/services/receipt_renderer.dart';
import '../../../receipt/domain/services/thermal_receipt_renderer.dart';
import '../repositories/printer_repository.dart';
import 'package:thai_pos_demo/shared/domain/services/audit_service.dart';
import 'package:thai_pos_demo/shared/domain/enums/audit_event_source.dart';

/// Orchestrates: Order Data → Receipt Document (Layout) → Bytes → Printer.
class ReceiptPrintService {
  ReceiptPrintService({
    required PrinterRepository printerRepository,
    required ReceiptComposer receiptComposer,
    required AuditService auditService,
    ReceiptRenderer<List<int>>? renderer,
  })  : _printer = printerRepository,
        _composer = receiptComposer,
        _auditService = auditService,
        _renderer = renderer ?? ThermalReceiptRenderer();

  final PrinterRepository _printer;
  final ReceiptComposer _composer;
  final AuditService _auditService;
  final ReceiptRenderer<List<int>> _renderer;

  Future<void> printOrder({
    required OrderModel order,
    required StoreProfile storeProfile,
    bool isReprint = false,
    String? actorId,
    String? actorLabel,
  }) async {
    // 1. Compose abstract layout
    final document = _composer.compose(
      order: order,
      storeProfile: storeProfile,
    );

    // 2. Render layout to printer commands
    final bytes = await _renderer.render(document);

    // 3. Send to printer hardware
    await _printer.printBytes(bytes);

    // 4. Log audit event
    await _auditService.logReceiptPrint(
      receiptId: order.id.toString(),
      source: actorId != null ? AuditEventSource.staff : AuditEventSource.system,
      isReprint: isReprint,
      actorId: actorId,
      actorLabel: actorLabel,
    );
  }
}
