// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppProfile _$AppProfileFromJson(Map<String, dynamic> json) {
  return _AppProfile.fromJson(json);
}

/// @nodoc
mixin _$AppProfile {
  String get activeModeId =>
      throw _privateConstructorUsedError; // e.g., 'retail', 'restaurant'
  bool get isOfflineFirst => throw _privateConstructorUsedError;
  String get languageCode => throw _privateConstructorUsedError;
  String get currencyCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppProfileCopyWith<AppProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppProfileCopyWith<$Res> {
  factory $AppProfileCopyWith(
          AppProfile value, $Res Function(AppProfile) then) =
      _$AppProfileCopyWithImpl<$Res, AppProfile>;
  @useResult
  $Res call(
      {String activeModeId,
      bool isOfflineFirst,
      String languageCode,
      String currencyCode});
}

/// @nodoc
class _$AppProfileCopyWithImpl<$Res, $Val extends AppProfile>
    implements $AppProfileCopyWith<$Res> {
  _$AppProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeModeId = null,
    Object? isOfflineFirst = null,
    Object? languageCode = null,
    Object? currencyCode = null,
  }) {
    return _then(_value.copyWith(
      activeModeId: null == activeModeId
          ? _value.activeModeId
          : activeModeId // ignore: cast_nullable_to_non_nullable
              as String,
      isOfflineFirst: null == isOfflineFirst
          ? _value.isOfflineFirst
          : isOfflineFirst // ignore: cast_nullable_to_non_nullable
              as bool,
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppProfileImplCopyWith<$Res>
    implements $AppProfileCopyWith<$Res> {
  factory _$$AppProfileImplCopyWith(
          _$AppProfileImpl value, $Res Function(_$AppProfileImpl) then) =
      __$$AppProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activeModeId,
      bool isOfflineFirst,
      String languageCode,
      String currencyCode});
}

/// @nodoc
class __$$AppProfileImplCopyWithImpl<$Res>
    extends _$AppProfileCopyWithImpl<$Res, _$AppProfileImpl>
    implements _$$AppProfileImplCopyWith<$Res> {
  __$$AppProfileImplCopyWithImpl(
      _$AppProfileImpl _value, $Res Function(_$AppProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeModeId = null,
    Object? isOfflineFirst = null,
    Object? languageCode = null,
    Object? currencyCode = null,
  }) {
    return _then(_$AppProfileImpl(
      activeModeId: null == activeModeId
          ? _value.activeModeId
          : activeModeId // ignore: cast_nullable_to_non_nullable
              as String,
      isOfflineFirst: null == isOfflineFirst
          ? _value.isOfflineFirst
          : isOfflineFirst // ignore: cast_nullable_to_non_nullable
              as bool,
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppProfileImpl implements _AppProfile {
  const _$AppProfileImpl(
      {required this.activeModeId,
      this.isOfflineFirst = true,
      this.languageCode = 'th',
      this.currencyCode = 'THB'});

  factory _$AppProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppProfileImplFromJson(json);

  @override
  final String activeModeId;
// e.g., 'retail', 'restaurant'
  @override
  @JsonKey()
  final bool isOfflineFirst;
  @override
  @JsonKey()
  final String languageCode;
  @override
  @JsonKey()
  final String currencyCode;

  @override
  String toString() {
    return 'AppProfile(activeModeId: $activeModeId, isOfflineFirst: $isOfflineFirst, languageCode: $languageCode, currencyCode: $currencyCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppProfileImpl &&
            (identical(other.activeModeId, activeModeId) ||
                other.activeModeId == activeModeId) &&
            (identical(other.isOfflineFirst, isOfflineFirst) ||
                other.isOfflineFirst == isOfflineFirst) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, activeModeId, isOfflineFirst, languageCode, currencyCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppProfileImplCopyWith<_$AppProfileImpl> get copyWith =>
      __$$AppProfileImplCopyWithImpl<_$AppProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppProfileImplToJson(
      this,
    );
  }
}

abstract class _AppProfile implements AppProfile {
  const factory _AppProfile(
      {required final String activeModeId,
      final bool isOfflineFirst,
      final String languageCode,
      final String currencyCode}) = _$AppProfileImpl;

  factory _AppProfile.fromJson(Map<String, dynamic> json) =
      _$AppProfileImpl.fromJson;

  @override
  String get activeModeId;
  @override // e.g., 'retail', 'restaurant'
  bool get isOfflineFirst;
  @override
  String get languageCode;
  @override
  String get currencyCode;
  @override
  @JsonKey(ignore: true)
  _$$AppProfileImplCopyWith<_$AppProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
