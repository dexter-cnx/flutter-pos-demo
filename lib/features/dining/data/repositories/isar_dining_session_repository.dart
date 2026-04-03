import 'package:isar/isar.dart';
import '../../../../app/bootstrap.dart';
import '../../data/models/dining_session_model.dart';
import '../../domain/repositories/dining_session_repository.dart';
import '../../../orders/data/models/order_model.dart';

class IsarDiningSessionRepository implements DiningSessionRepository {
  @override
  Future<List<DiningSessionModel>> getActiveSessions() async {
    final database = isar;
    if (database == null) return [];
    return database.diningSessionModels.filter().isOpenEqualTo(true).findAll();
  }

  @override
  Future<DiningSessionModel?> getSession(int sessionId) async {
    final database = isar;
    if (database == null) return null;
    return database.diningSessionModels.get(sessionId);
  }

  @override
  Future<DiningSessionModel?> getSessionByTable(int tableId) async {
    final database = isar;
    if (database == null) return null;
    return database.diningSessionModels
        .filter()
        .tableIdEqualTo(tableId)
        .isOpenEqualTo(true)
        .findFirst();
  }

  @override
  Future<int> openSession(int tableId, String tableName, int headcount) async {
    final database = isar;
    if (database == null) return -1;

    final session = DiningSessionModel()
      ..tableId = tableId
      ..tableName = tableName
      ..headcount = headcount
      ..isOpen = true
      ..startTime = DateTime.now()
      ..subtotal = 0
      ..taxAmount = 0
      ..total = 0;

    return database.writeTxn(() async {
      return database.diningSessionModels.put(session);
    });
  }

  @override
  Future<void> updateItems(
      int sessionId, List<OrderItemModel> items, double subtotal, double taxAmount, double total) async {
    final database = isar;
    if (database == null) return;

    await database.writeTxn(() async {
      final session = await database.diningSessionModels.get(sessionId);
      if (session != null && session.isOpen) {
        session.items = items;
        session.subtotal = subtotal;
        session.taxAmount = taxAmount;
        session.total = total;
        await database.diningSessionModels.put(session);
      }
    });
  }

  @override
  Future<void> closeSession(int sessionId) async {
    final database = isar;
    if (database == null) return;

    await database.writeTxn(() async {
      final session = await database.diningSessionModels.get(sessionId);
      if (session != null) {
        session.isOpen = false;
        session.endTime = DateTime.now();
        await database.diningSessionModels.put(session);
      }
    });
  }
}
