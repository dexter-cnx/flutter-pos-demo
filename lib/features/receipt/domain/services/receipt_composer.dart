import '../../../orders/data/models/order_model.dart';
import '../../../settings/domain/entities/store_profile.dart';
import '../entities/receipt_document.dart';

/// Contract for composing a layout abstraction from order data.
/// Implementations map domain models to a flat ReceiptDocument.
abstract class ReceiptComposer {
  ReceiptDocument compose({
    required OrderModel order,
    required StoreProfile storeProfile,
  });
}
