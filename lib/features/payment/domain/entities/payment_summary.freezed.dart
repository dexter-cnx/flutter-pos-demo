// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentSummary _$PaymentSummaryFromJson(Map<String, dynamic> json) {
  return _PaymentSummary.fromJson(json);
}

/// @nodoc
mixin _$PaymentSummary {
  String get id => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  double get receivedAmount => throw _privateConstructorUsedError;
  double get changeAmount => throw _privateConstructorUsedError;
  PaymentMethod get method => throw _privateConstructorUsedError;
  PaymentStatus get status => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentSummaryCopyWith<PaymentSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentSummaryCopyWith<$Res> {
  factory $PaymentSummaryCopyWith(
          PaymentSummary value, $Res Function(PaymentSummary) then) =
      _$PaymentSummaryCopyWithImpl<$Res, PaymentSummary>;
  @useResult
  $Res call(
      {String id,
      String orderId,
      double totalAmount,
      double receivedAmount,
      double changeAmount,
      PaymentMethod method,
      PaymentStatus status,
      DateTime timestamp});
}

/// @nodoc
class _$PaymentSummaryCopyWithImpl<$Res, $Val extends PaymentSummary>
    implements $PaymentSummaryCopyWith<$Res> {
  _$PaymentSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? totalAmount = null,
    Object? receivedAmount = null,
    Object? changeAmount = null,
    Object? method = null,
    Object? status = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      receivedAmount: null == receivedAmount
          ? _value.receivedAmount
          : receivedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      changeAmount: null == changeAmount
          ? _value.changeAmount
          : changeAmount // ignore: cast_nullable_to_non_nullable
              as double,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PaymentStatus,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentSummaryImplCopyWith<$Res>
    implements $PaymentSummaryCopyWith<$Res> {
  factory _$$PaymentSummaryImplCopyWith(_$PaymentSummaryImpl value,
          $Res Function(_$PaymentSummaryImpl) then) =
      __$$PaymentSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String orderId,
      double totalAmount,
      double receivedAmount,
      double changeAmount,
      PaymentMethod method,
      PaymentStatus status,
      DateTime timestamp});
}

/// @nodoc
class __$$PaymentSummaryImplCopyWithImpl<$Res>
    extends _$PaymentSummaryCopyWithImpl<$Res, _$PaymentSummaryImpl>
    implements _$$PaymentSummaryImplCopyWith<$Res> {
  __$$PaymentSummaryImplCopyWithImpl(
      _$PaymentSummaryImpl _value, $Res Function(_$PaymentSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? totalAmount = null,
    Object? receivedAmount = null,
    Object? changeAmount = null,
    Object? method = null,
    Object? status = null,
    Object? timestamp = null,
  }) {
    return _then(_$PaymentSummaryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      receivedAmount: null == receivedAmount
          ? _value.receivedAmount
          : receivedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      changeAmount: null == changeAmount
          ? _value.changeAmount
          : changeAmount // ignore: cast_nullable_to_non_nullable
              as double,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PaymentStatus,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentSummaryImpl implements _PaymentSummary {
  const _$PaymentSummaryImpl(
      {required this.id,
      required this.orderId,
      required this.totalAmount,
      required this.receivedAmount,
      required this.changeAmount,
      required this.method,
      required this.status,
      required this.timestamp});

  factory _$PaymentSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentSummaryImplFromJson(json);

  @override
  final String id;
  @override
  final String orderId;
  @override
  final double totalAmount;
  @override
  final double receivedAmount;
  @override
  final double changeAmount;
  @override
  final PaymentMethod method;
  @override
  final PaymentStatus status;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'PaymentSummary(id: $id, orderId: $orderId, totalAmount: $totalAmount, receivedAmount: $receivedAmount, changeAmount: $changeAmount, method: $method, status: $status, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentSummaryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.receivedAmount, receivedAmount) ||
                other.receivedAmount == receivedAmount) &&
            (identical(other.changeAmount, changeAmount) ||
                other.changeAmount == changeAmount) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, orderId, totalAmount,
      receivedAmount, changeAmount, method, status, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentSummaryImplCopyWith<_$PaymentSummaryImpl> get copyWith =>
      __$$PaymentSummaryImplCopyWithImpl<_$PaymentSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentSummaryImplToJson(
      this,
    );
  }
}

abstract class _PaymentSummary implements PaymentSummary {
  const factory _PaymentSummary(
      {required final String id,
      required final String orderId,
      required final double totalAmount,
      required final double receivedAmount,
      required final double changeAmount,
      required final PaymentMethod method,
      required final PaymentStatus status,
      required final DateTime timestamp}) = _$PaymentSummaryImpl;

  factory _PaymentSummary.fromJson(Map<String, dynamic> json) =
      _$PaymentSummaryImpl.fromJson;

  @override
  String get id;
  @override
  String get orderId;
  @override
  double get totalAmount;
  @override
  double get receivedAmount;
  @override
  double get changeAmount;
  @override
  PaymentMethod get method;
  @override
  PaymentStatus get status;
  @override
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$PaymentSummaryImplCopyWith<_$PaymentSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
