// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuditEvent _$AuditEventFromJson(Map<String, dynamic> json) {
  return _AuditEvent.fromJson(json);
}

/// @nodoc
mixin _$AuditEvent {
  /// Unique identifier for the audit event
  String get id => throw _privateConstructorUsedError;

  /// Type of event (e.g., transaction_created, receipt_printed)
  String get eventType => throw _privateConstructorUsedError;

  /// Entity type being audited (e.g., transaction, receipt, setting)
  String get entityType => throw _privateConstructorUsedError;

  /// ID of the entity being audited
  String get entityId => throw _privateConstructorUsedError;

  /// Action performed (e.g., created, paid, printed, voided)
  String get action => throw _privateConstructorUsedError;

  /// Actor who performed the action (e.g., staff ID, system, job)
  String? get actorId => throw _privateConstructorUsedError;

  /// Label for the actor (e.g., "John Doe", "System", "Auto Backup")
  String? get actorLabel => throw _privateConstructorUsedError;

  /// Source of the action (staff, system, job, customer, etc.)
  String get source => throw _privateConstructorUsedError;

  /// Timestamp of the event
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Summary message describing the event
  String get summary => throw _privateConstructorUsedError;

  /// Optional payload or metadata about the event
  Map<String, dynamic>? get payload => throw _privateConstructorUsedError;

  /// Optional before/after status for state transitions
  Map<String, dynamic>? get beforeAfterStatus =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuditEventCopyWith<AuditEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuditEventCopyWith<$Res> {
  factory $AuditEventCopyWith(
          AuditEvent value, $Res Function(AuditEvent) then) =
      _$AuditEventCopyWithImpl<$Res, AuditEvent>;
  @useResult
  $Res call(
      {String id,
      String eventType,
      String entityType,
      String entityId,
      String action,
      String? actorId,
      String? actorLabel,
      String source,
      DateTime timestamp,
      String summary,
      Map<String, dynamic>? payload,
      Map<String, dynamic>? beforeAfterStatus});
}

/// @nodoc
class _$AuditEventCopyWithImpl<$Res, $Val extends AuditEvent>
    implements $AuditEventCopyWith<$Res> {
  _$AuditEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventType = null,
    Object? entityType = null,
    Object? entityId = null,
    Object? action = null,
    Object? actorId = freezed,
    Object? actorLabel = freezed,
    Object? source = null,
    Object? timestamp = null,
    Object? summary = null,
    Object? payload = freezed,
    Object? beforeAfterStatus = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      actorId: freezed == actorId
          ? _value.actorId
          : actorId // ignore: cast_nullable_to_non_nullable
              as String?,
      actorLabel: freezed == actorLabel
          ? _value.actorLabel
          : actorLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      payload: freezed == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      beforeAfterStatus: freezed == beforeAfterStatus
          ? _value.beforeAfterStatus
          : beforeAfterStatus // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuditEventImplCopyWith<$Res>
    implements $AuditEventCopyWith<$Res> {
  factory _$$AuditEventImplCopyWith(
          _$AuditEventImpl value, $Res Function(_$AuditEventImpl) then) =
      __$$AuditEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String eventType,
      String entityType,
      String entityId,
      String action,
      String? actorId,
      String? actorLabel,
      String source,
      DateTime timestamp,
      String summary,
      Map<String, dynamic>? payload,
      Map<String, dynamic>? beforeAfterStatus});
}

/// @nodoc
class __$$AuditEventImplCopyWithImpl<$Res>
    extends _$AuditEventCopyWithImpl<$Res, _$AuditEventImpl>
    implements _$$AuditEventImplCopyWith<$Res> {
  __$$AuditEventImplCopyWithImpl(
      _$AuditEventImpl _value, $Res Function(_$AuditEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventType = null,
    Object? entityType = null,
    Object? entityId = null,
    Object? action = null,
    Object? actorId = freezed,
    Object? actorLabel = freezed,
    Object? source = null,
    Object? timestamp = null,
    Object? summary = null,
    Object? payload = freezed,
    Object? beforeAfterStatus = freezed,
  }) {
    return _then(_$AuditEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      actorId: freezed == actorId
          ? _value.actorId
          : actorId // ignore: cast_nullable_to_non_nullable
              as String?,
      actorLabel: freezed == actorLabel
          ? _value.actorLabel
          : actorLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      payload: freezed == payload
          ? _value._payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      beforeAfterStatus: freezed == beforeAfterStatus
          ? _value._beforeAfterStatus
          : beforeAfterStatus // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuditEventImpl extends _AuditEvent {
  const _$AuditEventImpl(
      {required this.id,
      required this.eventType,
      required this.entityType,
      required this.entityId,
      required this.action,
      this.actorId,
      this.actorLabel,
      required this.source,
      required this.timestamp,
      required this.summary,
      final Map<String, dynamic>? payload,
      final Map<String, dynamic>? beforeAfterStatus})
      : _payload = payload,
        _beforeAfterStatus = beforeAfterStatus,
        super._();

  factory _$AuditEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuditEventImplFromJson(json);

  /// Unique identifier for the audit event
  @override
  final String id;

  /// Type of event (e.g., transaction_created, receipt_printed)
  @override
  final String eventType;

  /// Entity type being audited (e.g., transaction, receipt, setting)
  @override
  final String entityType;

  /// ID of the entity being audited
  @override
  final String entityId;

  /// Action performed (e.g., created, paid, printed, voided)
  @override
  final String action;

  /// Actor who performed the action (e.g., staff ID, system, job)
  @override
  final String? actorId;

  /// Label for the actor (e.g., "John Doe", "System", "Auto Backup")
  @override
  final String? actorLabel;

  /// Source of the action (staff, system, job, customer, etc.)
  @override
  final String source;

  /// Timestamp of the event
  @override
  final DateTime timestamp;

  /// Summary message describing the event
  @override
  final String summary;

  /// Optional payload or metadata about the event
  final Map<String, dynamic>? _payload;

  /// Optional payload or metadata about the event
  @override
  Map<String, dynamic>? get payload {
    final value = _payload;
    if (value == null) return null;
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Optional before/after status for state transitions
  final Map<String, dynamic>? _beforeAfterStatus;

  /// Optional before/after status for state transitions
  @override
  Map<String, dynamic>? get beforeAfterStatus {
    final value = _beforeAfterStatus;
    if (value == null) return null;
    if (_beforeAfterStatus is EqualUnmodifiableMapView)
      return _beforeAfterStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AuditEvent(id: $id, eventType: $eventType, entityType: $entityType, entityId: $entityId, action: $action, actorId: $actorId, actorLabel: $actorLabel, source: $source, timestamp: $timestamp, summary: $summary, payload: $payload, beforeAfterStatus: $beforeAfterStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuditEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.actorId, actorId) || other.actorId == actorId) &&
            (identical(other.actorLabel, actorLabel) ||
                other.actorLabel == actorLabel) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(other._payload, _payload) &&
            const DeepCollectionEquality()
                .equals(other._beforeAfterStatus, _beforeAfterStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      eventType,
      entityType,
      entityId,
      action,
      actorId,
      actorLabel,
      source,
      timestamp,
      summary,
      const DeepCollectionEquality().hash(_payload),
      const DeepCollectionEquality().hash(_beforeAfterStatus));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuditEventImplCopyWith<_$AuditEventImpl> get copyWith =>
      __$$AuditEventImplCopyWithImpl<_$AuditEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuditEventImplToJson(
      this,
    );
  }
}

abstract class _AuditEvent extends AuditEvent {
  const factory _AuditEvent(
      {required final String id,
      required final String eventType,
      required final String entityType,
      required final String entityId,
      required final String action,
      final String? actorId,
      final String? actorLabel,
      required final String source,
      required final DateTime timestamp,
      required final String summary,
      final Map<String, dynamic>? payload,
      final Map<String, dynamic>? beforeAfterStatus}) = _$AuditEventImpl;
  const _AuditEvent._() : super._();

  factory _AuditEvent.fromJson(Map<String, dynamic> json) =
      _$AuditEventImpl.fromJson;

  @override

  /// Unique identifier for the audit event
  String get id;
  @override

  /// Type of event (e.g., transaction_created, receipt_printed)
  String get eventType;
  @override

  /// Entity type being audited (e.g., transaction, receipt, setting)
  String get entityType;
  @override

  /// ID of the entity being audited
  String get entityId;
  @override

  /// Action performed (e.g., created, paid, printed, voided)
  String get action;
  @override

  /// Actor who performed the action (e.g., staff ID, system, job)
  String? get actorId;
  @override

  /// Label for the actor (e.g., "John Doe", "System", "Auto Backup")
  String? get actorLabel;
  @override

  /// Source of the action (staff, system, job, customer, etc.)
  String get source;
  @override

  /// Timestamp of the event
  DateTime get timestamp;
  @override

  /// Summary message describing the event
  String get summary;
  @override

  /// Optional payload or metadata about the event
  Map<String, dynamic>? get payload;
  @override

  /// Optional before/after status for state transitions
  Map<String, dynamic>? get beforeAfterStatus;
  @override
  @JsonKey(ignore: true)
  _$$AuditEventImplCopyWith<_$AuditEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
