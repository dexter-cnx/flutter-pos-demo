// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_job.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppJob _$AppJobFromJson(Map<String, dynamic> json) {
  return _AppJob.fromJson(json);
}

/// @nodoc
mixin _$AppJob {
  String get id => throw _privateConstructorUsedError;
  JobType get type => throw _privateConstructorUsedError;
  JobStatus get status => throw _privateConstructorUsedError;
  JobPriority get priority => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get retryCount => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  Map<String, dynamic>? get payload => throw _privateConstructorUsedError;
  String? get sourceEntityId => throw _privateConstructorUsedError;
  String? get actorId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppJobCopyWith<AppJob> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppJobCopyWith<$Res> {
  factory $AppJobCopyWith(AppJob value, $Res Function(AppJob) then) =
      _$AppJobCopyWithImpl<$Res, AppJob>;
  @useResult
  $Res call(
      {String id,
      JobType type,
      JobStatus status,
      JobPriority priority,
      DateTime createdAt,
      DateTime updatedAt,
      int retryCount,
      String? errorMessage,
      Map<String, dynamic>? payload,
      String? sourceEntityId,
      String? actorId});
}

/// @nodoc
class _$AppJobCopyWithImpl<$Res, $Val extends AppJob>
    implements $AppJobCopyWith<$Res> {
  _$AppJobCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? status = null,
    Object? priority = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? retryCount = null,
    Object? errorMessage = freezed,
    Object? payload = freezed,
    Object? sourceEntityId = freezed,
    Object? actorId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as JobType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as JobStatus,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as JobPriority,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      retryCount: null == retryCount
          ? _value.retryCount
          : retryCount // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      payload: freezed == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      sourceEntityId: freezed == sourceEntityId
          ? _value.sourceEntityId
          : sourceEntityId // ignore: cast_nullable_to_non_nullable
              as String?,
      actorId: freezed == actorId
          ? _value.actorId
          : actorId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppJobImplCopyWith<$Res> implements $AppJobCopyWith<$Res> {
  factory _$$AppJobImplCopyWith(
          _$AppJobImpl value, $Res Function(_$AppJobImpl) then) =
      __$$AppJobImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      JobType type,
      JobStatus status,
      JobPriority priority,
      DateTime createdAt,
      DateTime updatedAt,
      int retryCount,
      String? errorMessage,
      Map<String, dynamic>? payload,
      String? sourceEntityId,
      String? actorId});
}

/// @nodoc
class __$$AppJobImplCopyWithImpl<$Res>
    extends _$AppJobCopyWithImpl<$Res, _$AppJobImpl>
    implements _$$AppJobImplCopyWith<$Res> {
  __$$AppJobImplCopyWithImpl(
      _$AppJobImpl _value, $Res Function(_$AppJobImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? status = null,
    Object? priority = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? retryCount = null,
    Object? errorMessage = freezed,
    Object? payload = freezed,
    Object? sourceEntityId = freezed,
    Object? actorId = freezed,
  }) {
    return _then(_$AppJobImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as JobType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as JobStatus,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as JobPriority,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      retryCount: null == retryCount
          ? _value.retryCount
          : retryCount // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      payload: freezed == payload
          ? _value._payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      sourceEntityId: freezed == sourceEntityId
          ? _value.sourceEntityId
          : sourceEntityId // ignore: cast_nullable_to_non_nullable
              as String?,
      actorId: freezed == actorId
          ? _value.actorId
          : actorId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppJobImpl extends _AppJob {
  const _$AppJobImpl(
      {required this.id,
      required this.type,
      required this.status,
      this.priority = JobPriority.medium,
      required this.createdAt,
      required this.updatedAt,
      this.retryCount = 0,
      this.errorMessage,
      final Map<String, dynamic>? payload,
      this.sourceEntityId,
      this.actorId})
      : _payload = payload,
        super._();

  factory _$AppJobImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppJobImplFromJson(json);

  @override
  final String id;
  @override
  final JobType type;
  @override
  final JobStatus status;
  @override
  @JsonKey()
  final JobPriority priority;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final int retryCount;
  @override
  final String? errorMessage;
  final Map<String, dynamic>? _payload;
  @override
  Map<String, dynamic>? get payload {
    final value = _payload;
    if (value == null) return null;
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? sourceEntityId;
  @override
  final String? actorId;

  @override
  String toString() {
    return 'AppJob(id: $id, type: $type, status: $status, priority: $priority, createdAt: $createdAt, updatedAt: $updatedAt, retryCount: $retryCount, errorMessage: $errorMessage, payload: $payload, sourceEntityId: $sourceEntityId, actorId: $actorId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppJobImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.retryCount, retryCount) ||
                other.retryCount == retryCount) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._payload, _payload) &&
            (identical(other.sourceEntityId, sourceEntityId) ||
                other.sourceEntityId == sourceEntityId) &&
            (identical(other.actorId, actorId) || other.actorId == actorId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      status,
      priority,
      createdAt,
      updatedAt,
      retryCount,
      errorMessage,
      const DeepCollectionEquality().hash(_payload),
      sourceEntityId,
      actorId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppJobImplCopyWith<_$AppJobImpl> get copyWith =>
      __$$AppJobImplCopyWithImpl<_$AppJobImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppJobImplToJson(
      this,
    );
  }
}

abstract class _AppJob extends AppJob {
  const factory _AppJob(
      {required final String id,
      required final JobType type,
      required final JobStatus status,
      final JobPriority priority,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final int retryCount,
      final String? errorMessage,
      final Map<String, dynamic>? payload,
      final String? sourceEntityId,
      final String? actorId}) = _$AppJobImpl;
  const _AppJob._() : super._();

  factory _AppJob.fromJson(Map<String, dynamic> json) = _$AppJobImpl.fromJson;

  @override
  String get id;
  @override
  JobType get type;
  @override
  JobStatus get status;
  @override
  JobPriority get priority;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  int get retryCount;
  @override
  String? get errorMessage;
  @override
  Map<String, dynamic>? get payload;
  @override
  String? get sourceEntityId;
  @override
  String? get actorId;
  @override
  @JsonKey(ignore: true)
  _$$AppJobImplCopyWith<_$AppJobImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
