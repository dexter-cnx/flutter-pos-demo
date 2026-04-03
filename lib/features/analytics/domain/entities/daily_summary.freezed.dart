// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DailySummary {
  double get totalRevenue => throw _privateConstructorUsedError;
  int get orderCount => throw _privateConstructorUsedError;
  int get customerCount => throw _privateConstructorUsedError;
  List<TopProduct> get topProducts => throw _privateConstructorUsedError;
  Map<int, double> get hourlyRevenue => throw _privateConstructorUsedError;
  Map<String, double> get paymentBreakdown =>
      throw _privateConstructorUsedError;
  double? get previousDayRevenue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DailySummaryCopyWith<DailySummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailySummaryCopyWith<$Res> {
  factory $DailySummaryCopyWith(
          DailySummary value, $Res Function(DailySummary) then) =
      _$DailySummaryCopyWithImpl<$Res, DailySummary>;
  @useResult
  $Res call(
      {double totalRevenue,
      int orderCount,
      int customerCount,
      List<TopProduct> topProducts,
      Map<int, double> hourlyRevenue,
      Map<String, double> paymentBreakdown,
      double? previousDayRevenue});
}

/// @nodoc
class _$DailySummaryCopyWithImpl<$Res, $Val extends DailySummary>
    implements $DailySummaryCopyWith<$Res> {
  _$DailySummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRevenue = null,
    Object? orderCount = null,
    Object? customerCount = null,
    Object? topProducts = null,
    Object? hourlyRevenue = null,
    Object? paymentBreakdown = null,
    Object? previousDayRevenue = freezed,
  }) {
    return _then(_value.copyWith(
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      customerCount: null == customerCount
          ? _value.customerCount
          : customerCount // ignore: cast_nullable_to_non_nullable
              as int,
      topProducts: null == topProducts
          ? _value.topProducts
          : topProducts // ignore: cast_nullable_to_non_nullable
              as List<TopProduct>,
      hourlyRevenue: null == hourlyRevenue
          ? _value.hourlyRevenue
          : hourlyRevenue // ignore: cast_nullable_to_non_nullable
              as Map<int, double>,
      paymentBreakdown: null == paymentBreakdown
          ? _value.paymentBreakdown
          : paymentBreakdown // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      previousDayRevenue: freezed == previousDayRevenue
          ? _value.previousDayRevenue
          : previousDayRevenue // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailySummaryImplCopyWith<$Res>
    implements $DailySummaryCopyWith<$Res> {
  factory _$$DailySummaryImplCopyWith(
          _$DailySummaryImpl value, $Res Function(_$DailySummaryImpl) then) =
      __$$DailySummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double totalRevenue,
      int orderCount,
      int customerCount,
      List<TopProduct> topProducts,
      Map<int, double> hourlyRevenue,
      Map<String, double> paymentBreakdown,
      double? previousDayRevenue});
}

/// @nodoc
class __$$DailySummaryImplCopyWithImpl<$Res>
    extends _$DailySummaryCopyWithImpl<$Res, _$DailySummaryImpl>
    implements _$$DailySummaryImplCopyWith<$Res> {
  __$$DailySummaryImplCopyWithImpl(
      _$DailySummaryImpl _value, $Res Function(_$DailySummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRevenue = null,
    Object? orderCount = null,
    Object? customerCount = null,
    Object? topProducts = null,
    Object? hourlyRevenue = null,
    Object? paymentBreakdown = null,
    Object? previousDayRevenue = freezed,
  }) {
    return _then(_$DailySummaryImpl(
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      customerCount: null == customerCount
          ? _value.customerCount
          : customerCount // ignore: cast_nullable_to_non_nullable
              as int,
      topProducts: null == topProducts
          ? _value._topProducts
          : topProducts // ignore: cast_nullable_to_non_nullable
              as List<TopProduct>,
      hourlyRevenue: null == hourlyRevenue
          ? _value._hourlyRevenue
          : hourlyRevenue // ignore: cast_nullable_to_non_nullable
              as Map<int, double>,
      paymentBreakdown: null == paymentBreakdown
          ? _value._paymentBreakdown
          : paymentBreakdown // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      previousDayRevenue: freezed == previousDayRevenue
          ? _value.previousDayRevenue
          : previousDayRevenue // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$DailySummaryImpl implements _DailySummary {
  const _$DailySummaryImpl(
      {required this.totalRevenue,
      required this.orderCount,
      required this.customerCount,
      required final List<TopProduct> topProducts,
      required final Map<int, double> hourlyRevenue,
      required final Map<String, double> paymentBreakdown,
      this.previousDayRevenue})
      : _topProducts = topProducts,
        _hourlyRevenue = hourlyRevenue,
        _paymentBreakdown = paymentBreakdown;

  @override
  final double totalRevenue;
  @override
  final int orderCount;
  @override
  final int customerCount;
  final List<TopProduct> _topProducts;
  @override
  List<TopProduct> get topProducts {
    if (_topProducts is EqualUnmodifiableListView) return _topProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topProducts);
  }

  final Map<int, double> _hourlyRevenue;
  @override
  Map<int, double> get hourlyRevenue {
    if (_hourlyRevenue is EqualUnmodifiableMapView) return _hourlyRevenue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_hourlyRevenue);
  }

  final Map<String, double> _paymentBreakdown;
  @override
  Map<String, double> get paymentBreakdown {
    if (_paymentBreakdown is EqualUnmodifiableMapView) return _paymentBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_paymentBreakdown);
  }

  @override
  final double? previousDayRevenue;

  @override
  String toString() {
    return 'DailySummary(totalRevenue: $totalRevenue, orderCount: $orderCount, customerCount: $customerCount, topProducts: $topProducts, hourlyRevenue: $hourlyRevenue, paymentBreakdown: $paymentBreakdown, previousDayRevenue: $previousDayRevenue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailySummaryImpl &&
            (identical(other.totalRevenue, totalRevenue) ||
                other.totalRevenue == totalRevenue) &&
            (identical(other.orderCount, orderCount) ||
                other.orderCount == orderCount) &&
            (identical(other.customerCount, customerCount) ||
                other.customerCount == customerCount) &&
            const DeepCollectionEquality()
                .equals(other._topProducts, _topProducts) &&
            const DeepCollectionEquality()
                .equals(other._hourlyRevenue, _hourlyRevenue) &&
            const DeepCollectionEquality()
                .equals(other._paymentBreakdown, _paymentBreakdown) &&
            (identical(other.previousDayRevenue, previousDayRevenue) ||
                other.previousDayRevenue == previousDayRevenue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalRevenue,
      orderCount,
      customerCount,
      const DeepCollectionEquality().hash(_topProducts),
      const DeepCollectionEquality().hash(_hourlyRevenue),
      const DeepCollectionEquality().hash(_paymentBreakdown),
      previousDayRevenue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailySummaryImplCopyWith<_$DailySummaryImpl> get copyWith =>
      __$$DailySummaryImplCopyWithImpl<_$DailySummaryImpl>(this, _$identity);
}

abstract class _DailySummary implements DailySummary {
  const factory _DailySummary(
      {required final double totalRevenue,
      required final int orderCount,
      required final int customerCount,
      required final List<TopProduct> topProducts,
      required final Map<int, double> hourlyRevenue,
      required final Map<String, double> paymentBreakdown,
      final double? previousDayRevenue}) = _$DailySummaryImpl;

  @override
  double get totalRevenue;
  @override
  int get orderCount;
  @override
  int get customerCount;
  @override
  List<TopProduct> get topProducts;
  @override
  Map<int, double> get hourlyRevenue;
  @override
  Map<String, double> get paymentBreakdown;
  @override
  double? get previousDayRevenue;
  @override
  @JsonKey(ignore: true)
  _$$DailySummaryImplCopyWith<_$DailySummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
