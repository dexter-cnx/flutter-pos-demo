import '../entities/category.dart';
import '../entities/product.dart';

abstract class PosRepository {
  Future<List<Category>> getCategories();
  Future<List<Product>> getProducts({String? categoryId});
}
