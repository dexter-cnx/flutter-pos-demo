import 'package:isar/isar.dart';
import 'category_model.dart';

part 'product_model.g.dart';

@collection
@Name('products')
class ProductModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String name;

  late double price;

  String? imageUrl;

  late String sku;

  final category = IsarLink<CategoryModel>();

  late bool isAvailable;
}
