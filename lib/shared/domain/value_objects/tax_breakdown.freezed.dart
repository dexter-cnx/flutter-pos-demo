// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tax_breakdown.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaxBreakdown _$TaxBreakdownFromJson(Map<String, dynamic> json) {
  return _TaxBreakdown.fromJson(json);
}

/// @nodoc
mixin _$TaxBreakdown {
  /// Total amount including tax
  double get total => throw _privateConstructorUsedError;

  /// Estimated tax component (amount of total that is tax)
  double get taxAmount => throw _privateConstructorUsedError;

  /// Base amount (total - taxAmount)
  double get subtotal => throw _privateConstructorUsedError;

  /// The VAT rate applied (typically 0.07 for Thai business)
  double get rate => throw _privateConstructorUsedError;

  /// Whether the calculation was tax-inclusive (most common for retail)
  bool get inclusive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaxBreakdownCopyWith<TaxBreakdown> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxBreakdownCopyWith<$Res> {
  factory $TaxBreakdownCopyWith(
          TaxBreakdown value, $Res Function(TaxBreakdown) then) =
      _$TaxBreakdownCopyWithImpl<$Res, TaxBreakdown>;
  @useResult
  $Res call(
      {double total,
      double taxAmount,
      double subtotal,
      double rate,
      bool inclusive});
}

/// @nodoc
class _$TaxBreakdownCopyWithImpl<$Res, $Val extends TaxBreakdown>
    implements $TaxBreakdownCopyWith<$Res> {
  _$TaxBreakdownCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? taxAmount = null,
    Object? subtotal = null,
    Object? rate = null,
    Object? inclusive = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      inclusive: null == inclusive
          ? _value.inclusive
          : inclusive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaxBreakdownImplCopyWith<$Res>
    implements $TaxBreakdownCopyWith<$Res> {
  factory _$$TaxBreakdownImplCopyWith(
          _$TaxBreakdownImpl value, $Res Function(_$TaxBreakdownImpl) then) =
      __$$TaxBreakdownImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double total,
      double taxAmount,
      double subtotal,
      double rate,
      bool inclusive});
}

/// @nodoc
class __$$TaxBreakdownImplCopyWithImpl<$Res>
    extends _$TaxBreakdownCopyWithImpl<$Res, _$TaxBreakdownImpl>
    implements _$$TaxBreakdownImplCopyWith<$Res> {
  __$$TaxBreakdownImplCopyWithImpl(
      _$TaxBreakdownImpl _value, $Res Function(_$TaxBreakdownImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? taxAmount = null,
    Object? subtotal = null,
    Object? rate = null,
    Object? inclusive = null,
  }) {
    return _then(_$TaxBreakdownImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      inclusive: null == inclusive
          ? _value.inclusive
          : inclusive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaxBreakdownImpl implements _TaxBreakdown {
  const _$TaxBreakdownImpl(
      {required this.total,
      required this.taxAmount,
      required this.subtotal,
      this.rate = 0.07,
      this.inclusive = true});

  factory _$TaxBreakdownImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaxBreakdownImplFromJson(json);

  /// Total amount including tax
  @override
  final double total;

  /// Estimated tax component (amount of total that is tax)
  @override
  final double taxAmount;

  /// Base amount (total - taxAmount)
  @override
  final double subtotal;

  /// The VAT rate applied (typically 0.07 for Thai business)
  @override
  @JsonKey()
  final double rate;

  /// Whether the calculation was tax-inclusive (most common for retail)
  @override
  @JsonKey()
  final bool inclusive;

  @override
  String toString() {
    return 'TaxBreakdown(total: $total, taxAmount: $taxAmount, subtotal: $subtotal, rate: $rate, inclusive: $inclusive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaxBreakdownImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.inclusive, inclusive) ||
                other.inclusive == inclusive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, total, taxAmount, subtotal, rate, inclusive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaxBreakdownImplCopyWith<_$TaxBreakdownImpl> get copyWith =>
      __$$TaxBreakdownImplCopyWithImpl<_$TaxBreakdownImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaxBreakdownImplToJson(
      this,
    );
  }
}

abstract class _TaxBreakdown implements TaxBreakdown {
  const factory _TaxBreakdown(
      {required final double total,
      required final double taxAmount,
      required final double subtotal,
      final double rate,
      final bool inclusive}) = _$TaxBreakdownImpl;

  factory _TaxBreakdown.fromJson(Map<String, dynamic> json) =
      _$TaxBreakdownImpl.fromJson;

  @override

  /// Total amount including tax
  double get total;
  @override

  /// Estimated tax component (amount of total that is tax)
  double get taxAmount;
  @override

  /// Base amount (total - taxAmount)
  double get subtotal;
  @override

  /// The VAT rate applied (typically 0.07 for Thai business)
  double get rate;
  @override

  /// Whether the calculation was tax-inclusive (most common for retail)
  bool get inclusive;
  @override
  @JsonKey(ignore: true)
  _$$TaxBreakdownImplCopyWith<_$TaxBreakdownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
