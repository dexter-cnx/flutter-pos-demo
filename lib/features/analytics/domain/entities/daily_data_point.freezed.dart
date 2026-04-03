// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_data_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DailyDataPoint {
  DateTime get date => throw _privateConstructorUsedError;
  double get revenue => throw _privateConstructorUsedError;
  int get orderCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DailyDataPointCopyWith<DailyDataPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyDataPointCopyWith<$Res> {
  factory $DailyDataPointCopyWith(
          DailyDataPoint value, $Res Function(DailyDataPoint) then) =
      _$DailyDataPointCopyWithImpl<$Res, DailyDataPoint>;
  @useResult
  $Res call({DateTime date, double revenue, int orderCount});
}

/// @nodoc
class _$DailyDataPointCopyWithImpl<$Res, $Val extends DailyDataPoint>
    implements $DailyDataPointCopyWith<$Res> {
  _$DailyDataPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? revenue = null,
    Object? orderCount = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyDataPointImplCopyWith<$Res>
    implements $DailyDataPointCopyWith<$Res> {
  factory _$$DailyDataPointImplCopyWith(_$DailyDataPointImpl value,
          $Res Function(_$DailyDataPointImpl) then) =
      __$$DailyDataPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, double revenue, int orderCount});
}

/// @nodoc
class __$$DailyDataPointImplCopyWithImpl<$Res>
    extends _$DailyDataPointCopyWithImpl<$Res, _$DailyDataPointImpl>
    implements _$$DailyDataPointImplCopyWith<$Res> {
  __$$DailyDataPointImplCopyWithImpl(
      _$DailyDataPointImpl _value, $Res Function(_$DailyDataPointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? revenue = null,
    Object? orderCount = null,
  }) {
    return _then(_$DailyDataPointImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DailyDataPointImpl implements _DailyDataPoint {
  const _$DailyDataPointImpl(
      {required this.date, required this.revenue, required this.orderCount});

  @override
  final DateTime date;
  @override
  final double revenue;
  @override
  final int orderCount;

  @override
  String toString() {
    return 'DailyDataPoint(date: $date, revenue: $revenue, orderCount: $orderCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyDataPointImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            (identical(other.orderCount, orderCount) ||
                other.orderCount == orderCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, revenue, orderCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyDataPointImplCopyWith<_$DailyDataPointImpl> get copyWith =>
      __$$DailyDataPointImplCopyWithImpl<_$DailyDataPointImpl>(
          this, _$identity);
}

abstract class _DailyDataPoint implements DailyDataPoint {
  const factory _DailyDataPoint(
      {required final DateTime date,
      required final double revenue,
      required final int orderCount}) = _$DailyDataPointImpl;

  @override
  DateTime get date;
  @override
  double get revenue;
  @override
  int get orderCount;
  @override
  @JsonKey(ignore: true)
  _$$DailyDataPointImplCopyWith<_$DailyDataPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
