import 'package:thai_pos_demo/shared/domain/entities/audit_event.dart';

/// Repository interface for audit events
abstract class AuditRepository {
  /// Saves an audit event
  Future<void> saveAuditEvent(AuditEvent auditEvent);

  /// Gets audit events by entity type and ID
  Future<List<AuditEvent>> getAuditEventsByEntity(
    String entityType,
    String entityId,
  );

  /// Gets audit events by event type
  Future<List<AuditEvent>> getAuditEventsByType(String eventType);

  /// Gets audit events within a date range
  Future<List<AuditEvent>> getAuditEventsByDateRange(
    DateTime startDate,
    DateTime endDate,
  );

  /// Gets all audit events
  Future<List<AuditEvent>> getAllAuditEvents();
}