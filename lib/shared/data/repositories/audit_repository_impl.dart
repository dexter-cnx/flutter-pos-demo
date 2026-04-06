import 'package:isar/isar.dart';
import 'package:thai_pos_demo/shared/domain/entities/audit_event.dart';
import 'package:thai_pos_demo/shared/domain/repositories/audit_repository.dart';
import 'package:thai_pos_demo/shared/data/models/audit_event_model.dart';

/// Implementation of AuditRepository using Isar
class AuditRepositoryImpl implements AuditRepository {
  final Isar _isar;

  /// Creates a new audit repository implementation
  AuditRepositoryImpl(this._isar);

  @override
  Future<void> saveAuditEvent(AuditEvent auditEvent) async {
    final model = AuditEventModel.fromDomain(auditEvent);
    await _isar.writeTxn(() async {
      await _isar.auditEventModels.put(model);
    });
  }

  @override
  Future<List<AuditEvent>> getAuditEventsByEntity(
    String entityType,
    String entityId,
  ) async {
    final models = await _isar.auditEventModels
        .filter()
        .entityTypeEqualTo(entityType)
        .entityIdEqualTo(entityId)
        .findAll();

    return models.map((model) => model.toDomain()).toList();
  }

  @override
  Future<List<AuditEvent>> getAuditEventsByType(String eventType) async {
    final models = await _isar.auditEventModels
        .filter()
        .eventTypeEqualTo(eventType)
        .findAll();

    return models.map((model) => model.toDomain()).toList();
  }

  @override
  Future<List<AuditEvent>> getAuditEventsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final models = await _isar.auditEventModels
        .filter()
        .timestampBetween(startDate, endDate)
        .findAll();

    return models.map((model) => model.toDomain()).toList();
  }

  @override
  Future<List<AuditEvent>> getAllAuditEvents() async {
    final models = await _isar.auditEventModels.where().findAll();
    return models.map((model) => model.toDomain()).toList();
  }
}