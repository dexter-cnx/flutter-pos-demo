import 'package:freezed_annotation/freezed_annotation.dart';

part 'buffet_tier.freezed.dart';

@freezed
class BuffetTier with _$BuffetTier {
  const factory BuffetTier({
    required String id,
    required String name,
    required double adultPrice,
    required double childPrice,
    @Default(0) double elderlyDiscount,
    int? timeLimitMinutes,
    @Default([]) List<String> excludedCategoryIds,
    String? colorHex,
    @Default(true) bool isActive,
    @Default(0) int sortOrder,
  }) = _BuffetTier;
}
