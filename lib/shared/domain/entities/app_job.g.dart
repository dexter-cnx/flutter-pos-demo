// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppJobImpl _$$AppJobImplFromJson(Map<String, dynamic> json) => _$AppJobImpl(
      id: json['id'] as String,
      type: $enumDecode(_$JobTypeEnumMap, json['type']),
      status: $enumDecode(_$JobStatusEnumMap, json['status']),
      priority: $enumDecodeNullable(_$JobPriorityEnumMap, json['priority']) ??
          JobPriority.medium,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      retryCount: (json['retryCount'] as num?)?.toInt() ?? 0,
      errorMessage: json['errorMessage'] as String?,
      payload: json['payload'] as Map<String, dynamic>?,
      sourceEntityId: json['sourceEntityId'] as String?,
      actorId: json['actorId'] as String?,
    );

Map<String, dynamic> _$$AppJobImplToJson(_$AppJobImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$JobTypeEnumMap[instance.type]!,
      'status': _$JobStatusEnumMap[instance.status]!,
      'priority': _$JobPriorityEnumMap[instance.priority]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'retryCount': instance.retryCount,
      'errorMessage': instance.errorMessage,
      'payload': instance.payload,
      'sourceEntityId': instance.sourceEntityId,
      'actorId': instance.actorId,
    };

const _$JobTypeEnumMap = {
  JobType.receiptReprint: 'receiptReprint',
  JobType.reportGenerate: 'reportGenerate',
  JobType.syncPendingTransactions: 'syncPendingTransactions',
  JobType.notifyQueueCalled: 'notifyQueueCalled',
  JobType.queueDisplayRefresh: 'queueDisplayRefresh',
  JobType.other: 'other',
};

const _$JobStatusEnumMap = {
  JobStatus.pending: 'pending',
  JobStatus.running: 'running',
  JobStatus.completed: 'completed',
  JobStatus.failed: 'failed',
  JobStatus.cancelled: 'cancelled',
};

const _$JobPriorityEnumMap = {
  JobPriority.low: 'low',
  JobPriority.medium: 'medium',
  JobPriority.high: 'high',
  JobPriority.urgent: 'urgent',
};
