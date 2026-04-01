import 'dart:async';

import '../entities/category.dart';
import '../entities/product.dart';

abstract class PosRepository {
  Future<List<Category>> getCategories();
  Future<List<Product>> getProducts({String? categoryId});
  Future<void> deductStock(Map<String, int> quantitiesByProductId);
  Future<void> restockProduct(String productId, int quantity);
}
