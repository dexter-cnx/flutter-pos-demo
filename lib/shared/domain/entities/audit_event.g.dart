// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuditEventImpl _$$AuditEventImplFromJson(Map<String, dynamic> json) =>
    _$AuditEventImpl(
      id: json['id'] as String,
      eventType: json['eventType'] as String,
      entityType: json['entityType'] as String,
      entityId: json['entityId'] as String,
      action: json['action'] as String,
      actorId: json['actorId'] as String?,
      actorLabel: json['actorLabel'] as String?,
      source: json['source'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      summary: json['summary'] as String,
      payload: json['payload'] as Map<String, dynamic>?,
      beforeAfterStatus: json['beforeAfterStatus'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AuditEventImplToJson(_$AuditEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventType': instance.eventType,
      'entityType': instance.entityType,
      'entityId': instance.entityId,
      'action': instance.action,
      'actorId': instance.actorId,
      'actorLabel': instance.actorLabel,
      'source': instance.source,
      'timestamp': instance.timestamp.toIso8601String(),
      'summary': instance.summary,
      'payload': instance.payload,
      'beforeAfterStatus': instance.beforeAfterStatus,
    };
