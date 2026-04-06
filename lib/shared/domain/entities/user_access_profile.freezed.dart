// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_access_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserAccessProfile _$UserAccessProfileFromJson(Map<String, dynamic> json) {
  return _UserAccessProfile.fromJson(json);
}

/// @nodoc
mixin _$UserAccessProfile {
  String get userId => throw _privateConstructorUsedError;
  AppRole get role => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAccessProfileCopyWith<UserAccessProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAccessProfileCopyWith<$Res> {
  factory $UserAccessProfileCopyWith(
          UserAccessProfile value, $Res Function(UserAccessProfile) then) =
      _$UserAccessProfileCopyWithImpl<$Res, UserAccessProfile>;
  @useResult
  $Res call({String userId, AppRole role, String displayName, bool isActive});
}

/// @nodoc
class _$UserAccessProfileCopyWithImpl<$Res, $Val extends UserAccessProfile>
    implements $UserAccessProfileCopyWith<$Res> {
  _$UserAccessProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? role = null,
    Object? displayName = null,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as AppRole,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAccessProfileImplCopyWith<$Res>
    implements $UserAccessProfileCopyWith<$Res> {
  factory _$$UserAccessProfileImplCopyWith(_$UserAccessProfileImpl value,
          $Res Function(_$UserAccessProfileImpl) then) =
      __$$UserAccessProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, AppRole role, String displayName, bool isActive});
}

/// @nodoc
class __$$UserAccessProfileImplCopyWithImpl<$Res>
    extends _$UserAccessProfileCopyWithImpl<$Res, _$UserAccessProfileImpl>
    implements _$$UserAccessProfileImplCopyWith<$Res> {
  __$$UserAccessProfileImplCopyWithImpl(_$UserAccessProfileImpl _value,
      $Res Function(_$UserAccessProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? role = null,
    Object? displayName = null,
    Object? isActive = null,
  }) {
    return _then(_$UserAccessProfileImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as AppRole,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAccessProfileImpl extends _UserAccessProfile {
  const _$UserAccessProfileImpl(
      {this.userId = 'anonymous',
      required this.role,
      this.displayName = 'Unknown User',
      this.isActive = true})
      : super._();

  factory _$UserAccessProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAccessProfileImplFromJson(json);

  @override
  @JsonKey()
  final String userId;
  @override
  final AppRole role;
  @override
  @JsonKey()
  final String displayName;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'UserAccessProfile(userId: $userId, role: $role, displayName: $displayName, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAccessProfileImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, role, displayName, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAccessProfileImplCopyWith<_$UserAccessProfileImpl> get copyWith =>
      __$$UserAccessProfileImplCopyWithImpl<_$UserAccessProfileImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAccessProfileImplToJson(
      this,
    );
  }
}

abstract class _UserAccessProfile extends UserAccessProfile {
  const factory _UserAccessProfile(
      {final String userId,
      required final AppRole role,
      final String displayName,
      final bool isActive}) = _$UserAccessProfileImpl;
  const _UserAccessProfile._() : super._();

  factory _UserAccessProfile.fromJson(Map<String, dynamic> json) =
      _$UserAccessProfileImpl.fromJson;

  @override
  String get userId;
  @override
  AppRole get role;
  @override
  String get displayName;
  @override
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$UserAccessProfileImplCopyWith<_$UserAccessProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
