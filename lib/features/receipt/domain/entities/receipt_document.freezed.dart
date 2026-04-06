// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReceiptLine _$ReceiptLineFromJson(Map<String, dynamic> json) {
  return _ReceiptLine.fromJson(json);
}

/// @nodoc
mixin _$ReceiptLine {
  String get name => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get unitPrice => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceiptLineCopyWith<ReceiptLine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptLineCopyWith<$Res> {
  factory $ReceiptLineCopyWith(
          ReceiptLine value, $Res Function(ReceiptLine) then) =
      _$ReceiptLineCopyWithImpl<$Res, ReceiptLine>;
  @useResult
  $Res call(
      {String name,
      int quantity,
      double unitPrice,
      double totalPrice,
      String? note});
}

/// @nodoc
class _$ReceiptLineCopyWithImpl<$Res, $Val extends ReceiptLine>
    implements $ReceiptLineCopyWith<$Res> {
  _$ReceiptLineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReceiptLineImplCopyWith<$Res>
    implements $ReceiptLineCopyWith<$Res> {
  factory _$$ReceiptLineImplCopyWith(
          _$ReceiptLineImpl value, $Res Function(_$ReceiptLineImpl) then) =
      __$$ReceiptLineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int quantity,
      double unitPrice,
      double totalPrice,
      String? note});
}

/// @nodoc
class __$$ReceiptLineImplCopyWithImpl<$Res>
    extends _$ReceiptLineCopyWithImpl<$Res, _$ReceiptLineImpl>
    implements _$$ReceiptLineImplCopyWith<$Res> {
  __$$ReceiptLineImplCopyWithImpl(
      _$ReceiptLineImpl _value, $Res Function(_$ReceiptLineImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? note = freezed,
  }) {
    return _then(_$ReceiptLineImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReceiptLineImpl implements _ReceiptLine {
  const _$ReceiptLineImpl(
      {required this.name,
      required this.quantity,
      required this.unitPrice,
      required this.totalPrice,
      this.note});

  factory _$ReceiptLineImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceiptLineImplFromJson(json);

  @override
  final String name;
  @override
  final int quantity;
  @override
  final double unitPrice;
  @override
  final double totalPrice;
  @override
  final String? note;

  @override
  String toString() {
    return 'ReceiptLine(name: $name, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptLineImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, quantity, unitPrice, totalPrice, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptLineImplCopyWith<_$ReceiptLineImpl> get copyWith =>
      __$$ReceiptLineImplCopyWithImpl<_$ReceiptLineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceiptLineImplToJson(
      this,
    );
  }
}

abstract class _ReceiptLine implements ReceiptLine {
  const factory _ReceiptLine(
      {required final String name,
      required final int quantity,
      required final double unitPrice,
      required final double totalPrice,
      final String? note}) = _$ReceiptLineImpl;

  factory _ReceiptLine.fromJson(Map<String, dynamic> json) =
      _$ReceiptLineImpl.fromJson;

  @override
  String get name;
  @override
  int get quantity;
  @override
  double get unitPrice;
  @override
  double get totalPrice;
  @override
  String? get note;
  @override
  @JsonKey(ignore: true)
  _$$ReceiptLineImplCopyWith<_$ReceiptLineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReceiptDocument _$ReceiptDocumentFromJson(Map<String, dynamic> json) {
  return _ReceiptDocument.fromJson(json);
}

/// @nodoc
mixin _$ReceiptDocument {
  String get storeName => throw _privateConstructorUsedError;
  String? get storeAddress => throw _privateConstructorUsedError;
  String? get storePhone => throw _privateConstructorUsedError;
  String? get storeTaxId => throw _privateConstructorUsedError;
  String get transactionId => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  List<ReceiptLine> get lines => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  double get taxAmount => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  TaxBreakdown? get taxBreakdown => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  double get receivedAmount => throw _privateConstructorUsedError;
  double get changeAmount => throw _privateConstructorUsedError;
  String? get footerNote => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceiptDocumentCopyWith<ReceiptDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptDocumentCopyWith<$Res> {
  factory $ReceiptDocumentCopyWith(
          ReceiptDocument value, $Res Function(ReceiptDocument) then) =
      _$ReceiptDocumentCopyWithImpl<$Res, ReceiptDocument>;
  @useResult
  $Res call(
      {String storeName,
      String? storeAddress,
      String? storePhone,
      String? storeTaxId,
      String transactionId,
      DateTime timestamp,
      List<ReceiptLine> lines,
      double subtotal,
      double taxAmount,
      double total,
      TaxBreakdown? taxBreakdown,
      String paymentMethod,
      double receivedAmount,
      double changeAmount,
      String? footerNote});

  $TaxBreakdownCopyWith<$Res>? get taxBreakdown;
}

/// @nodoc
class _$ReceiptDocumentCopyWithImpl<$Res, $Val extends ReceiptDocument>
    implements $ReceiptDocumentCopyWith<$Res> {
  _$ReceiptDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeName = null,
    Object? storeAddress = freezed,
    Object? storePhone = freezed,
    Object? storeTaxId = freezed,
    Object? transactionId = null,
    Object? timestamp = null,
    Object? lines = null,
    Object? subtotal = null,
    Object? taxAmount = null,
    Object? total = null,
    Object? taxBreakdown = freezed,
    Object? paymentMethod = null,
    Object? receivedAmount = null,
    Object? changeAmount = null,
    Object? footerNote = freezed,
  }) {
    return _then(_value.copyWith(
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      storeAddress: freezed == storeAddress
          ? _value.storeAddress
          : storeAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      storePhone: freezed == storePhone
          ? _value.storePhone
          : storePhone // ignore: cast_nullable_to_non_nullable
              as String?,
      storeTaxId: freezed == storeTaxId
          ? _value.storeTaxId
          : storeTaxId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lines: null == lines
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<ReceiptLine>,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      taxBreakdown: freezed == taxBreakdown
          ? _value.taxBreakdown
          : taxBreakdown // ignore: cast_nullable_to_non_nullable
              as TaxBreakdown?,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      receivedAmount: null == receivedAmount
          ? _value.receivedAmount
          : receivedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      changeAmount: null == changeAmount
          ? _value.changeAmount
          : changeAmount // ignore: cast_nullable_to_non_nullable
              as double,
      footerNote: freezed == footerNote
          ? _value.footerNote
          : footerNote // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TaxBreakdownCopyWith<$Res>? get taxBreakdown {
    if (_value.taxBreakdown == null) {
      return null;
    }

    return $TaxBreakdownCopyWith<$Res>(_value.taxBreakdown!, (value) {
      return _then(_value.copyWith(taxBreakdown: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReceiptDocumentImplCopyWith<$Res>
    implements $ReceiptDocumentCopyWith<$Res> {
  factory _$$ReceiptDocumentImplCopyWith(_$ReceiptDocumentImpl value,
          $Res Function(_$ReceiptDocumentImpl) then) =
      __$$ReceiptDocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String storeName,
      String? storeAddress,
      String? storePhone,
      String? storeTaxId,
      String transactionId,
      DateTime timestamp,
      List<ReceiptLine> lines,
      double subtotal,
      double taxAmount,
      double total,
      TaxBreakdown? taxBreakdown,
      String paymentMethod,
      double receivedAmount,
      double changeAmount,
      String? footerNote});

  @override
  $TaxBreakdownCopyWith<$Res>? get taxBreakdown;
}

/// @nodoc
class __$$ReceiptDocumentImplCopyWithImpl<$Res>
    extends _$ReceiptDocumentCopyWithImpl<$Res, _$ReceiptDocumentImpl>
    implements _$$ReceiptDocumentImplCopyWith<$Res> {
  __$$ReceiptDocumentImplCopyWithImpl(
      _$ReceiptDocumentImpl _value, $Res Function(_$ReceiptDocumentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeName = null,
    Object? storeAddress = freezed,
    Object? storePhone = freezed,
    Object? storeTaxId = freezed,
    Object? transactionId = null,
    Object? timestamp = null,
    Object? lines = null,
    Object? subtotal = null,
    Object? taxAmount = null,
    Object? total = null,
    Object? taxBreakdown = freezed,
    Object? paymentMethod = null,
    Object? receivedAmount = null,
    Object? changeAmount = null,
    Object? footerNote = freezed,
  }) {
    return _then(_$ReceiptDocumentImpl(
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      storeAddress: freezed == storeAddress
          ? _value.storeAddress
          : storeAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      storePhone: freezed == storePhone
          ? _value.storePhone
          : storePhone // ignore: cast_nullable_to_non_nullable
              as String?,
      storeTaxId: freezed == storeTaxId
          ? _value.storeTaxId
          : storeTaxId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lines: null == lines
          ? _value._lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<ReceiptLine>,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      taxBreakdown: freezed == taxBreakdown
          ? _value.taxBreakdown
          : taxBreakdown // ignore: cast_nullable_to_non_nullable
              as TaxBreakdown?,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      receivedAmount: null == receivedAmount
          ? _value.receivedAmount
          : receivedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      changeAmount: null == changeAmount
          ? _value.changeAmount
          : changeAmount // ignore: cast_nullable_to_non_nullable
              as double,
      footerNote: freezed == footerNote
          ? _value.footerNote
          : footerNote // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReceiptDocumentImpl implements _ReceiptDocument {
  const _$ReceiptDocumentImpl(
      {required this.storeName,
      this.storeAddress,
      this.storePhone,
      this.storeTaxId,
      required this.transactionId,
      required this.timestamp,
      required final List<ReceiptLine> lines,
      required this.subtotal,
      required this.taxAmount,
      required this.total,
      this.taxBreakdown,
      required this.paymentMethod,
      required this.receivedAmount,
      required this.changeAmount,
      this.footerNote})
      : _lines = lines;

  factory _$ReceiptDocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceiptDocumentImplFromJson(json);

  @override
  final String storeName;
  @override
  final String? storeAddress;
  @override
  final String? storePhone;
  @override
  final String? storeTaxId;
  @override
  final String transactionId;
  @override
  final DateTime timestamp;
  final List<ReceiptLine> _lines;
  @override
  List<ReceiptLine> get lines {
    if (_lines is EqualUnmodifiableListView) return _lines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lines);
  }

  @override
  final double subtotal;
  @override
  final double taxAmount;
  @override
  final double total;
  @override
  final TaxBreakdown? taxBreakdown;
  @override
  final String paymentMethod;
  @override
  final double receivedAmount;
  @override
  final double changeAmount;
  @override
  final String? footerNote;

  @override
  String toString() {
    return 'ReceiptDocument(storeName: $storeName, storeAddress: $storeAddress, storePhone: $storePhone, storeTaxId: $storeTaxId, transactionId: $transactionId, timestamp: $timestamp, lines: $lines, subtotal: $subtotal, taxAmount: $taxAmount, total: $total, taxBreakdown: $taxBreakdown, paymentMethod: $paymentMethod, receivedAmount: $receivedAmount, changeAmount: $changeAmount, footerNote: $footerNote)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptDocumentImpl &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.storeAddress, storeAddress) ||
                other.storeAddress == storeAddress) &&
            (identical(other.storePhone, storePhone) ||
                other.storePhone == storePhone) &&
            (identical(other.storeTaxId, storeTaxId) ||
                other.storeTaxId == storeTaxId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other._lines, _lines) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.taxBreakdown, taxBreakdown) ||
                other.taxBreakdown == taxBreakdown) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.receivedAmount, receivedAmount) ||
                other.receivedAmount == receivedAmount) &&
            (identical(other.changeAmount, changeAmount) ||
                other.changeAmount == changeAmount) &&
            (identical(other.footerNote, footerNote) ||
                other.footerNote == footerNote));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      storeName,
      storeAddress,
      storePhone,
      storeTaxId,
      transactionId,
      timestamp,
      const DeepCollectionEquality().hash(_lines),
      subtotal,
      taxAmount,
      total,
      taxBreakdown,
      paymentMethod,
      receivedAmount,
      changeAmount,
      footerNote);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptDocumentImplCopyWith<_$ReceiptDocumentImpl> get copyWith =>
      __$$ReceiptDocumentImplCopyWithImpl<_$ReceiptDocumentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceiptDocumentImplToJson(
      this,
    );
  }
}

abstract class _ReceiptDocument implements ReceiptDocument {
  const factory _ReceiptDocument(
      {required final String storeName,
      final String? storeAddress,
      final String? storePhone,
      final String? storeTaxId,
      required final String transactionId,
      required final DateTime timestamp,
      required final List<ReceiptLine> lines,
      required final double subtotal,
      required final double taxAmount,
      required final double total,
      final TaxBreakdown? taxBreakdown,
      required final String paymentMethod,
      required final double receivedAmount,
      required final double changeAmount,
      final String? footerNote}) = _$ReceiptDocumentImpl;

  factory _ReceiptDocument.fromJson(Map<String, dynamic> json) =
      _$ReceiptDocumentImpl.fromJson;

  @override
  String get storeName;
  @override
  String? get storeAddress;
  @override
  String? get storePhone;
  @override
  String? get storeTaxId;
  @override
  String get transactionId;
  @override
  DateTime get timestamp;
  @override
  List<ReceiptLine> get lines;
  @override
  double get subtotal;
  @override
  double get taxAmount;
  @override
  double get total;
  @override
  TaxBreakdown? get taxBreakdown;
  @override
  String get paymentMethod;
  @override
  double get receivedAmount;
  @override
  double get changeAmount;
  @override
  String? get footerNote;
  @override
  @JsonKey(ignore: true)
  _$$ReceiptDocumentImplCopyWith<_$ReceiptDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
