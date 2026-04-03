// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'floor_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FloorPlan {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  double get canvasWidth => throw _privateConstructorUsedError;
  double get canvasHeight => throw _privateConstructorUsedError;
  String get bgColorHex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FloorPlanCopyWith<FloorPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FloorPlanCopyWith<$Res> {
  factory $FloorPlanCopyWith(FloorPlan value, $Res Function(FloorPlan) then) =
      _$FloorPlanCopyWithImpl<$Res, FloorPlan>;
  @useResult
  $Res call(
      {String id,
      String name,
      int sortOrder,
      bool isDefault,
      double canvasWidth,
      double canvasHeight,
      String bgColorHex});
}

/// @nodoc
class _$FloorPlanCopyWithImpl<$Res, $Val extends FloorPlan>
    implements $FloorPlanCopyWith<$Res> {
  _$FloorPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sortOrder = null,
    Object? isDefault = null,
    Object? canvasWidth = null,
    Object? canvasHeight = null,
    Object? bgColorHex = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      canvasWidth: null == canvasWidth
          ? _value.canvasWidth
          : canvasWidth // ignore: cast_nullable_to_non_nullable
              as double,
      canvasHeight: null == canvasHeight
          ? _value.canvasHeight
          : canvasHeight // ignore: cast_nullable_to_non_nullable
              as double,
      bgColorHex: null == bgColorHex
          ? _value.bgColorHex
          : bgColorHex // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FloorPlanImplCopyWith<$Res>
    implements $FloorPlanCopyWith<$Res> {
  factory _$$FloorPlanImplCopyWith(
          _$FloorPlanImpl value, $Res Function(_$FloorPlanImpl) then) =
      __$$FloorPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int sortOrder,
      bool isDefault,
      double canvasWidth,
      double canvasHeight,
      String bgColorHex});
}

/// @nodoc
class __$$FloorPlanImplCopyWithImpl<$Res>
    extends _$FloorPlanCopyWithImpl<$Res, _$FloorPlanImpl>
    implements _$$FloorPlanImplCopyWith<$Res> {
  __$$FloorPlanImplCopyWithImpl(
      _$FloorPlanImpl _value, $Res Function(_$FloorPlanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sortOrder = null,
    Object? isDefault = null,
    Object? canvasWidth = null,
    Object? canvasHeight = null,
    Object? bgColorHex = null,
  }) {
    return _then(_$FloorPlanImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      canvasWidth: null == canvasWidth
          ? _value.canvasWidth
          : canvasWidth // ignore: cast_nullable_to_non_nullable
              as double,
      canvasHeight: null == canvasHeight
          ? _value.canvasHeight
          : canvasHeight // ignore: cast_nullable_to_non_nullable
              as double,
      bgColorHex: null == bgColorHex
          ? _value.bgColorHex
          : bgColorHex // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FloorPlanImpl implements _FloorPlan {
  const _$FloorPlanImpl(
      {required this.id,
      required this.name,
      this.sortOrder = 0,
      this.isDefault = false,
      this.canvasWidth = 1200,
      this.canvasHeight = 800,
      this.bgColorHex = '#F5F5F5'});

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey()
  final int sortOrder;
  @override
  @JsonKey()
  final bool isDefault;
  @override
  @JsonKey()
  final double canvasWidth;
  @override
  @JsonKey()
  final double canvasHeight;
  @override
  @JsonKey()
  final String bgColorHex;

  @override
  String toString() {
    return 'FloorPlan(id: $id, name: $name, sortOrder: $sortOrder, isDefault: $isDefault, canvasWidth: $canvasWidth, canvasHeight: $canvasHeight, bgColorHex: $bgColorHex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FloorPlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.canvasWidth, canvasWidth) ||
                other.canvasWidth == canvasWidth) &&
            (identical(other.canvasHeight, canvasHeight) ||
                other.canvasHeight == canvasHeight) &&
            (identical(other.bgColorHex, bgColorHex) ||
                other.bgColorHex == bgColorHex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, sortOrder, isDefault,
      canvasWidth, canvasHeight, bgColorHex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FloorPlanImplCopyWith<_$FloorPlanImpl> get copyWith =>
      __$$FloorPlanImplCopyWithImpl<_$FloorPlanImpl>(this, _$identity);
}

abstract class _FloorPlan implements FloorPlan {
  const factory _FloorPlan(
      {required final String id,
      required final String name,
      final int sortOrder,
      final bool isDefault,
      final double canvasWidth,
      final double canvasHeight,
      final String bgColorHex}) = _$FloorPlanImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  int get sortOrder;
  @override
  bool get isDefault;
  @override
  double get canvasWidth;
  @override
  double get canvasHeight;
  @override
  String get bgColorHex;
  @override
  @JsonKey(ignore: true)
  _$$FloorPlanImplCopyWith<_$FloorPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
