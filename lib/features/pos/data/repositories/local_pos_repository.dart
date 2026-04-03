import 'dart:async';

import 'package:isar/isar.dart';

import '../../../../app/bootstrap.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/pos_repository.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

class LocalPosRepository implements PosRepository {
  @override
  Future<List<Category>> getCategories() async {
    final database = isar;
    if (database == null) return [];

    final categories = await database.categoryModels
        .where()
        .sortBySortOrder()
        .findAll();
    return categories.map(_mapCategory).toList();
  }

  @override
  Future<List<Product>> getProducts({String? categoryId}) async {
    final database = isar;
    if (database == null) return [];

    final products = await database.productModels.where().findAll();
    await Future.wait(products.map((product) => product.category.load()));

    final filtered = categoryId == null
        ? products
        : products.where(
            (product) => product.category.value?.id.toString() == categoryId,
          );

    final sorted = filtered.toList()
      ..sort((a, b) {
        final categoryCompare = (a.category.value?.sortOrder ?? 0).compareTo(
          b.category.value?.sortOrder ?? 0,
        );
        if (categoryCompare != 0) return categoryCompare;
        return a.name.compareTo(b.name);
      });

    return sorted.map(_mapProduct).toList();
  }

  @override
  Future<void> deductStock(Map<String, int> quantitiesByProductId) async {
    final database = isar;
    if (database == null || quantitiesByProductId.isEmpty) return;

    await database.writeTxn(() async {
      for (final entry in quantitiesByProductId.entries) {
        final productId = int.tryParse(entry.key);
        if (productId == null) continue;

        final product = await database.productModels.get(productId);
        if (product == null) continue;

        final remaining = product.stockQuantity - entry.value;
        product.stockQuantity = remaining < 0 ? 0 : remaining;
        product.isAvailable = product.stockQuantity > 0;
        await database.productModels.put(product);
      }
    });
  }

  @override
  Future<void> restockProduct(String productId, int quantity) async {
    final database = isar;
    final id = int.tryParse(productId);
    if (database == null || id == null || quantity <= 0) return;

    await database.writeTxn(() async {
      final product = await database.productModels.get(id);
      if (product == null) return;

      product.stockQuantity += quantity;
      product.isAvailable = product.stockQuantity > 0;
      await database.productModels.put(product);
    });
  }

  @override
  Future<void> upsertCategory(Category category) async {
    final database = isar;
    if (database == null) return;

    final model = CategoryModel()
      ..id = int.tryParse(category.id) ?? Isar.autoIncrement
      ..name = category.name
      ..sortOrder = category.sortOrder
      ..imageUrl = category.imageUrl;

    await database.writeTxn(() => database.categoryModels.put(model));
  }

  @override
  Future<void> deleteCategory(String id) async {
    final database = isar;
    final categoryId = int.tryParse(id);
    if (database == null || categoryId == null) return;

    await database.writeTxn(() async {
      // Find products related to this category and unlink them? 
      // Or just delete if that's the intention. 
      // The current PosRepository interface doesn't specify cascading.
      await database.categoryModels.delete(categoryId);
    });
  }

  @override
  Future<void> upsertProduct(Product product) async {
    final database = isar;
    if (database == null) return;

    final model = ProductModel()
      ..id = int.tryParse(product.id) ?? Isar.autoIncrement
      ..name = product.name
      ..price = product.price
      ..sku = product.sku
      ..stockQuantity = product.stockQuantity
      ..imageUrl = product.imageUrl
      ..isAvailable = product.isAvailable;

    if (product.category != null) {
      final categoryId = int.tryParse(product.category!.id);
      if (categoryId != null) {
        final categoryModel = await database.categoryModels.get(categoryId);
        if (categoryModel != null) {
          model.category.value = categoryModel;
        }
      }
    }

    await database.writeTxn(() async {
      await database.productModels.put(model);
      await model.category.save();
    });
  }

  @override
  Future<void> deleteProduct(String id) async {
    final database = isar;
    final productId = int.tryParse(id);
    if (database == null || productId == null) return;

    await database.writeTxn(() => database.productModels.delete(productId));
  }

  Category _mapCategory(CategoryModel model) {
    return Category(
      id: model.id.toString(),
      name: model.name,
      sortOrder: model.sortOrder,
    );
  }

  Product _mapProduct(ProductModel model) {
    return Product(
      id: model.id.toString(),
      name: model.name,
      price: model.price,
      sku: model.sku,
      stockQuantity: model.stockQuantity,
      isAvailable: model.isAvailable,
      imageUrl: model.imageUrl,
      category: model.category.value == null
          ? null
          : _mapCategory(model.category.value!),
    );
  }
}
