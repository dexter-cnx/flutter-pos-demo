import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_product.freezed.dart';

@freezed
class TopProduct with _$TopProduct {
  const factory TopProduct({
    required String name,
    required int quantity,
    required double revenue,
  }) = _TopProduct;
}
