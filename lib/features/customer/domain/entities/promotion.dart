import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotion.freezed.dart';

@freezed
class Promotion with _$Promotion {
  const factory Promotion({
    required String id,
    required String name,
    required String type,
    double? discountPercent,
    double? discountAmount,
    double? minSpend,
    String? applicableTier,
  }) = _Promotion;
}
