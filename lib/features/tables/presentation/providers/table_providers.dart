import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/table_model.dart';
import '../../data/repositories/isar_table_repository.dart';
import '../../domain/repositories/table_repository.dart';

part 'table_providers.g.dart';

@riverpod
TableRepository tableRepository(TableRepositoryRef ref) {
  return IsarTableRepository();
}

@riverpod
class TablesNotifier extends _$TablesNotifier {
  @override
  Future<List<TableModel>> build() async {
    return ref.watch(tableRepositoryProvider).getTables();
  }

  Future<void> updateStatus(int tableId, String status, {int? sessionId}) async {
    await ref.read(tableRepositoryProvider).updateTableStatus(tableId, status, sessionId: sessionId);
    ref.invalidateSelf();
  }
}
