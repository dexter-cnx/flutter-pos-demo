import 'package:freezed_annotation/freezed_annotation.dart';
import 'category.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    required double price,
    required String sku,
    @Default(true) bool isAvailable,
    String? imageUrl,
    Category? category,
  }) = _Product;
}
