import 'package:isar/isar.dart';
import '../../../../app/bootstrap.dart';
import '../../data/models/table_model.dart';
import '../../domain/repositories/table_repository.dart';

class IsarTableRepository implements TableRepository {
  @override
  Future<List<TableModel>> getTables() async {
    final database = isar;
    if (database == null) return [];
    return database.tableModels.where().findAll();
  }

  @override
  Future<void> updateTableStatus(int tableId, String status, {int? sessionId}) async {
    final database = isar;
    if (database == null) return;

    await database.writeTxn(() async {
      final table = await database.tableModels.get(tableId);
      if (table != null) {
        table.status = status;
        table.currentSessionId = sessionId;
        table.updatedAt = DateTime.now();
        await database.tableModels.put(table);
      }
    });
  }

  @override
  Future<TableModel?> getTable(int tableId) async {
    final database = isar;
    if (database == null) return null;
    return database.tableModels.get(tableId);
  }

  @override
  Future<void> seedTables(List<TableModel> tables) async {
    final database = isar;
    if (database == null) return;

    await database.writeTxn(() async {
      final existingCount = await database.tableModels.count();
      if (existingCount == 0) {
        await database.tableModels.putAll(tables);
      }
    });
  }
}
