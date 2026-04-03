import '../../../orders/data/models/order_model.dart';
import '../../../settings/domain/entities/store_profile.dart';

/// Contract for composing ESC/POS byte sequences from order data.
/// Implementations must NOT write to the printer — only return bytes.
abstract class ReceiptComposer {
  Future<List<int>> compose({
    required OrderModel order,
    required StoreProfile storeProfile,
  });
}
