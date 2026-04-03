import '../../data/models/dining_session_model.dart';
import '../../../orders/data/models/order_model.dart';

abstract class DiningSessionRepository {
  Future<List<DiningSessionModel>> getActiveSessions();
  Future<DiningSessionModel?> getSession(int sessionId);
  Future<DiningSessionModel?> getSessionByTable(int tableId);
  Future<int> openSession(
    int tableId,
    String tableName, {
    int adultCount = 1,
    int childCount = 0,
    int elderlyCount = 0,
    int? buffetTierId,
    String? buffetTierName,
    double buffetAdultPrice = 0,
    double buffetChildPrice = 0,
    int? timeLimitMinutes,
  });
  Future<void> updateItems(int sessionId, List<OrderItemModel> items, double subtotal, double taxAmount, double total);
  Future<void> closeSession(int sessionId);
}
