// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$StoreProfile {
  String get storeName => throw _privateConstructorUsedError;
  String get storeAddress => throw _privateConstructorUsedError;
  String get storeTaxId => throw _privateConstructorUsedError;
  String get storePhone => throw _privateConstructorUsedError;
  String get receiptFooter => throw _privateConstructorUsedError;
  int get lowStockThreshold => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoreProfileCopyWith<StoreProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreProfileCopyWith<$Res> {
  factory $StoreProfileCopyWith(
    StoreProfile value,
    $Res Function(StoreProfile) then,
  ) = _$StoreProfileCopyWithImpl<$Res, StoreProfile>;
  @useResult
  $Res call({
    String storeName,
    String storeAddress,
    String storeTaxId,
    String storePhone,
    String receiptFooter,
    int lowStockThreshold,
  });
}

/// @nodoc
class _$StoreProfileCopyWithImpl<$Res, $Val extends StoreProfile>
    implements $StoreProfileCopyWith<$Res> {
  _$StoreProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeName = null,
    Object? storeAddress = null,
    Object? storeTaxId = null,
    Object? storePhone = null,
    Object? receiptFooter = null,
    Object? lowStockThreshold = null,
  }) {
    return _then(
      _value.copyWith(
            storeName: null == storeName
                ? _value.storeName
                : storeName // ignore: cast_nullable_to_non_nullable
                      as String,
            storeAddress: null == storeAddress
                ? _value.storeAddress
                : storeAddress // ignore: cast_nullable_to_non_nullable
                      as String,
            storeTaxId: null == storeTaxId
                ? _value.storeTaxId
                : storeTaxId // ignore: cast_nullable_to_non_nullable
                      as String,
            storePhone: null == storePhone
                ? _value.storePhone
                : storePhone // ignore: cast_nullable_to_non_nullable
                      as String,
            receiptFooter: null == receiptFooter
                ? _value.receiptFooter
                : receiptFooter // ignore: cast_nullable_to_non_nullable
                      as String,
            lowStockThreshold: null == lowStockThreshold
                ? _value.lowStockThreshold
                : lowStockThreshold // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StoreProfileImplCopyWith<$Res>
    implements $StoreProfileCopyWith<$Res> {
  factory _$$StoreProfileImplCopyWith(
    _$StoreProfileImpl value,
    $Res Function(_$StoreProfileImpl) then,
  ) = __$$StoreProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String storeName,
    String storeAddress,
    String storeTaxId,
    String storePhone,
    String receiptFooter,
    int lowStockThreshold,
  });
}

/// @nodoc
class __$$StoreProfileImplCopyWithImpl<$Res>
    extends _$StoreProfileCopyWithImpl<$Res, _$StoreProfileImpl>
    implements _$$StoreProfileImplCopyWith<$Res> {
  __$$StoreProfileImplCopyWithImpl(
    _$StoreProfileImpl _value,
    $Res Function(_$StoreProfileImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeName = null,
    Object? storeAddress = null,
    Object? storeTaxId = null,
    Object? storePhone = null,
    Object? receiptFooter = null,
    Object? lowStockThreshold = null,
  }) {
    return _then(
      _$StoreProfileImpl(
        storeName: null == storeName
            ? _value.storeName
            : storeName // ignore: cast_nullable_to_non_nullable
                  as String,
        storeAddress: null == storeAddress
            ? _value.storeAddress
            : storeAddress // ignore: cast_nullable_to_non_nullable
                  as String,
        storeTaxId: null == storeTaxId
            ? _value.storeTaxId
            : storeTaxId // ignore: cast_nullable_to_non_nullable
                  as String,
        storePhone: null == storePhone
            ? _value.storePhone
            : storePhone // ignore: cast_nullable_to_non_nullable
                  as String,
        receiptFooter: null == receiptFooter
            ? _value.receiptFooter
            : receiptFooter // ignore: cast_nullable_to_non_nullable
                  as String,
        lowStockThreshold: null == lowStockThreshold
            ? _value.lowStockThreshold
            : lowStockThreshold // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$StoreProfileImpl implements _StoreProfile {
  const _$StoreProfileImpl({
    required this.storeName,
    required this.storeAddress,
    required this.storeTaxId,
    required this.storePhone,
    required this.receiptFooter,
    this.lowStockThreshold = 5,
  });

  @override
  final String storeName;
  @override
  final String storeAddress;
  @override
  final String storeTaxId;
  @override
  final String storePhone;
  @override
  final String receiptFooter;
  @override
  @JsonKey()
  final int lowStockThreshold;

  @override
  String toString() {
    return 'StoreProfile(storeName: $storeName, storeAddress: $storeAddress, storeTaxId: $storeTaxId, storePhone: $storePhone, receiptFooter: $receiptFooter, lowStockThreshold: $lowStockThreshold)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreProfileImpl &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.storeAddress, storeAddress) ||
                other.storeAddress == storeAddress) &&
            (identical(other.storeTaxId, storeTaxId) ||
                other.storeTaxId == storeTaxId) &&
            (identical(other.storePhone, storePhone) ||
                other.storePhone == storePhone) &&
            (identical(other.receiptFooter, receiptFooter) ||
                other.receiptFooter == receiptFooter) &&
            (identical(other.lowStockThreshold, lowStockThreshold) ||
                other.lowStockThreshold == lowStockThreshold));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    storeName,
    storeAddress,
    storeTaxId,
    storePhone,
    receiptFooter,
    lowStockThreshold,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreProfileImplCopyWith<_$StoreProfileImpl> get copyWith =>
      __$$StoreProfileImplCopyWithImpl<_$StoreProfileImpl>(this, _$identity);
}

abstract class _StoreProfile implements StoreProfile {
  const factory _StoreProfile({
    required final String storeName,
    required final String storeAddress,
    required final String storeTaxId,
    required final String storePhone,
    required final String receiptFooter,
    final int lowStockThreshold,
  }) = _$StoreProfileImpl;

  @override
  String get storeName;
  @override
  String get storeAddress;
  @override
  String get storeTaxId;
  @override
  String get storePhone;
  @override
  String get receiptFooter;
  @override
  int get lowStockThreshold;
  @override
  @JsonKey(ignore: true)
  _$$StoreProfileImplCopyWith<_$StoreProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
