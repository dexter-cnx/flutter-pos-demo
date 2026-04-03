import 'dart:async';

import '../entities/category.dart';
import '../entities/product.dart';

abstract class PosRepository {
  Future<List<Category>> getCategories();
  Future<List<Product>> getProducts({String? categoryId});
  Future<void> deductStock(Map<String, int> quantitiesByProductId);
  Future<void> restockProduct(String productId, int quantity);

  // Management methods
  Future<void> upsertCategory(Category category);
  Future<void> deleteCategory(String id);
  Future<void> upsertProduct(Product product);
  Future<void> deleteProduct(String id);
}
