import '../../../../features/orders/data/models/order_model.dart';
import '../../../../features/settings/domain/entities/store_profile.dart';
import '../../../receipt/domain/services/receipt_composer.dart';
import '../../../receipt/domain/services/receipt_renderer.dart';
import '../../../receipt/domain/services/thermal_receipt_renderer.dart';
import '../repositories/printer_repository.dart';

/// Orchestrates: Order Data → Receipt Document (Layout) → Bytes → Printer.
class ReceiptPrintService {
  ReceiptPrintService({
    required PrinterRepository printerRepository,
    required ReceiptComposer receiptComposer,
    ReceiptRenderer<List<int>>? renderer,
  })  : _printer = printerRepository,
        _composer = receiptComposer,
        _renderer = renderer ?? ThermalReceiptRenderer();

  final PrinterRepository _printer;
  final ReceiptComposer _composer;
  final ReceiptRenderer<List<int>> _renderer;

  Future<void> printOrder({
    required OrderModel order,
    required StoreProfile storeProfile,
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
  }
}
