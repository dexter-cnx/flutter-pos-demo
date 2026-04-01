import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_profile.freezed.dart';

@freezed
class StoreProfile with _$StoreProfile {
  const factory StoreProfile({
    required String storeName,
    required String storeAddress,
    required String storeTaxId,
    required String storePhone,
    required String receiptFooter,
    @Default(5) int lowStockThreshold,
  }) = _StoreProfile;
}
