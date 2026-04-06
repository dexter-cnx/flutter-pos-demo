import 'package:freezed_annotation/freezed_annotation.dart';

part 'audit_event.freezed.dart';
part 'audit_event.g.dart';

/// Audit event domain entity
@freezed
class AuditEvent with _$AuditEvent {
  const AuditEvent._();

  /// Creates a new audit event
  const factory AuditEvent({
    /// Unique identifier for the audit event
    required String id,

    /// Type of event (e.g., transaction_created, receipt_printed)
    required String eventType,

    /// Entity type being audited (e.g., transaction, receipt, setting)
    required String entityType,

    /// ID of the entity being audited
    required String entityId,

    /// Action performed (e.g., created, paid, printed, voided)
    required String action,

    /// Actor who performed the action (e.g., staff ID, system, job)
    String? actorId,

    /// Label for the actor (e.g., "John Doe", "System", "Auto Backup")
    String? actorLabel,

    /// Source of the action (staff, system, job, customer, etc.)
    required String source,

    /// Timestamp of the event
    required DateTime timestamp,

    /// Summary message describing the event
    required String summary,

    /// Optional payload or metadata about the event
    Map<String, dynamic>? payload,

    /// Optional before/after status for state transitions
    Map<String, dynamic>? beforeAfterStatus,
  }) = _AuditEvent;

  /// Creates an audit event from JSON
  factory AuditEvent.fromJson(Map<String, dynamic> json) => _$AuditEventFromJson(json);
}