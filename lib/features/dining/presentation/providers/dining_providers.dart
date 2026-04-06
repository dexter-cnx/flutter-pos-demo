import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/dining_session_model.dart';
import '../../data/repositories/isar_dining_session_repository.dart';
import '../../domain/repositories/dining_session_repository.dart';
import '../../../tables/presentation/providers/table_providers.dart';

import '../widgets/open_table_dialog.dart';

import 'package:thai_pos_demo/shared/presentation/providers/access_providers.dart';
import 'package:thai_pos_demo/shared/presentation/providers/audit_providers.dart' hide isar;
import 'package:thai_pos_demo/shared/domain/enums/audit_event_type.dart';
import 'package:thai_pos_demo/shared/domain/enums/audit_event_source.dart';

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
    
    // Log audit event
    final userProfile = ref.read(userAccessProfileProvider);
    final auditService = ref.read(auditServiceProvider);
    
    await auditService.logEvent(
      eventType: AuditEventType.tableSessionOpened,
      entityType: 'table',
      entityId: tableId.toString(),
      action: 'open_session',
      actorId: userProfile.userId,
      actorLabel: userProfile.displayName,
      source: AuditEventSource.staff,
      summary: 'Table $tableName (ID: $tableId) opened for session #$sessionId',
      payload: {
        'session_id': sessionId,
        'adults': config.adultCount,
        'children': config.childCount,
        'elderly': config.elderlyCount,
        'buffet_tier': config.buffetTier?.name,
      },
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
    final userProfile = ref.read(userAccessProfileProvider);
    final auditService = ref.read(auditServiceProvider);

    await ref.read(diningSessionRepositoryProvider).closeSession(sessionId);
    
    // Log audit event
    await auditService.logEvent(
      eventType: AuditEventType.tableSessionClosed,
      entityType: 'table',
      entityId: tableId.toString(),
      action: 'checkout',
      actorId: userProfile.userId,
      actorLabel: userProfile.displayName,
      source: AuditEventSource.staff,
      summary: 'Table session #$sessionId checked out for table #$tableId',
      payload: {'session_id': sessionId},
    );

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
