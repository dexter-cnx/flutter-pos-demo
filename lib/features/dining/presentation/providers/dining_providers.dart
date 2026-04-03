import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/dining_session_model.dart';
import '../../data/repositories/isar_dining_session_repository.dart';
import '../../domain/repositories/dining_session_repository.dart';
import '../../../tables/presentation/providers/table_providers.dart';

import '../widgets/open_table_dialog.dart';

part 'dining_providers.g.dart';

@riverpod
class ActiveDiningSessionId extends _$ActiveDiningSessionId {
  @override
  int? build() => null;

  void set(int? id) => state = id;
}

@riverpod
DiningSessionRepository diningSessionRepository(DiningSessionRepositoryRef ref) {
  return IsarDiningSessionRepository();
}

@riverpod
class DiningSessionsNotifier extends _$DiningSessionsNotifier {
  @override
  Future<List<DiningSessionModel>> build() async {
    return ref.watch(diningSessionRepositoryProvider).getActiveSessions();
  }

  Future<int> openSession(int tableId, String tableName, SessionConfig config) async {
    int? parsedTierId;
    if (config.buffetTier?.id != null) {
      parsedTierId = int.tryParse(config.buffetTier!.id);
    }

    final sessionId = await ref.read(diningSessionRepositoryProvider).openSession(
      tableId,
      tableName,
      adultCount: config.adultCount,
      childCount: config.childCount,
      elderlyCount: config.elderlyCount,
      buffetTierId: parsedTierId,
      buffetTierName: config.buffetTier?.name,
      buffetAdultPrice: config.buffetTier?.adultPrice ?? 0,
      buffetChildPrice: config.buffetTier?.childPrice ?? 0,
      timeLimitMinutes: config.buffetTier?.timeLimitMinutes,
    );
    
    // Update table status
    await ref.read(tablesNotifierProvider.notifier).updateStatus(
      tableId,
      'occupied',
      sessionId: sessionId,
    );

    ref.invalidateSelf();
    return sessionId;
  }

  Future<void> checkoutSession(int sessionId, int tableId) async {
    await ref.read(diningSessionRepositoryProvider).closeSession(sessionId);
    
    // Update table status to cleaning
    await ref.read(tablesNotifierProvider.notifier).updateStatus(
      tableId,
      'cleaning',
    );

    ref.invalidateSelf();
  }
}

@riverpod
class ActiveDiningSession extends _$ActiveDiningSession {
  @override
  Future<DiningSessionModel?> build(int sessionId) async {
    return ref.watch(diningSessionRepositoryProvider).getSession(sessionId);
  }
}
