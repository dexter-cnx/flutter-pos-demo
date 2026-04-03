import '../../data/models/table_model.dart';

abstract class TableRepository {
  Future<List<TableModel>> getTables();
  Future<void> updateTableStatus(int tableId, String status, {int? sessionId});
  Future<TableModel?> getTable(int tableId);
  Future<void> seedTables(List<TableModel> tables);
}
