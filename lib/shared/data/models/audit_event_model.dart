import 'dart:convert';
import 'package:isar/isar.dart';
import 'package:thai_pos_demo/shared/domain/entities/audit_event.dart';

part 'audit_event_model.g.dart';

@collection
class AuditEventModel {
  Id id = Isar.autoIncrement;

  late String eventId;
  late String eventType;
  late String entityType;
  late String entityId;
  late String action;
  String? actorId;
  String? actorLabel;
  late String source;
  late DateTime timestamp;
  late String summary;
  String? payload;
  String? beforeAfterStatus;

  AuditEventModel({
    required this.eventId,
    required this.eventType,
    required this.entityType,
    required this.entityId,
    required this.action,
    this.actorId,
    this.actorLabel,
    required this.source,
    required this.timestamp,
    required this.summary,
    this.payload,
    this.beforeAfterStatus,
  });

  /// Converts this model to a domain entity
  AuditEvent toDomain() {
    return AuditEvent(
      id: eventId,
      eventType: eventType,
      entityType: entityType,
      entityId: entityId,
      action: action,
      actorId: actorId,
      actorLabel: actorLabel,
      source: source,
      timestamp: timestamp,
      summary: summary,
      payload: payload != null ? jsonDecode(payload!) : null,
      beforeAfterStatus: beforeAfterStatus != null
          ? jsonDecode(beforeAfterStatus!)
          : null,
    );
  }

  /// Creates a model from a domain entity
  static AuditEventModel fromDomain(AuditEvent auditEvent) {
    return AuditEventModel(
      eventId: auditEvent.id,
      eventType: auditEvent.eventType,
      entityType: auditEvent.entityType,
      entityId: auditEvent.entityId,
      action: auditEvent.action,
      actorId: auditEvent.actorId,
      actorLabel: auditEvent.actorLabel,
      source: auditEvent.source,
      timestamp: auditEvent.timestamp,
      summary: auditEvent.summary,
      payload: auditEvent.payload != null
          ? jsonEncode(auditEvent.payload)
          : null,
      beforeAfterStatus: auditEvent.beforeAfterStatus != null
          ? jsonEncode(auditEvent.beforeAfterStatus)
          : null,
    );
  }
}