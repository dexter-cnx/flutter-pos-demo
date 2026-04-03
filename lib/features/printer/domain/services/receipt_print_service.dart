import '../../../../features/orders/data/models/order_model.dart';
import '../../../../features/settings/domain/entities/store_profile.dart';
import '../../../receipt/domain/services/receipt_composer.dart';
import '../repositories/printer_repository.dart';

/// Orchestrates receipt composition → byte transmission.
/// Call this from checkout, NOT directly from UI widgets.
class ReceiptPrintService {
  const ReceiptPrintService({
    required PrinterRepository printerRepository,
    required ReceiptComposer receiptComposer,
  })  : _printer = printerRepository,
        _composer = receiptComposer;

  final PrinterRepository _printer;
  final ReceiptComposer _composer;

  Future<void> printOrder({
    required OrderModel order,
    required StoreProfile storeProfile,
  }) async {
    final bytes = await _composer.compose(
      order: order,
      storeProfile: storeProfile,
    );
    await _printer.printBytes(bytes);
  }
}
