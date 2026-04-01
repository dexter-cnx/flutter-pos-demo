import 'dart:async';

import 'package:isar/isar.dart';
import '../../features/auth/data/models/user_model.dart';
import '../../features/pos/data/models/category_model.dart';
import '../../features/pos/data/models/product_model.dart';

class DataSeeder {
  static Future<void> seed(Isar isar) async {
    final userCount = await isar.userModels.count();
    if (userCount == 0) {
      await isar.writeTxn(() async {
        await isar.userModels.put(
          UserModel()
            ..username = 'admin'
            ..pin = '1234'
            ..displayName = 'ผู้ดูแลระบบเดโม'
            ..role = 'admin',
        );
      });
    } else {
      await _upgradeUsers(isar);
    }

    await _seedOrUpgradeCatalog(isar);
  }

  static Future<void> _upgradeUsers(Isar isar) async {
    final admin =
        await isar.userModels.where().usernameEqualTo('admin').findFirst();
    if (admin == null || admin.displayName == 'ผู้ดูแลระบบเดโม') return;

    admin.displayName = 'ผู้ดูแลระบบเดโม';
    await isar.writeTxn(() async {
      await isar.userModels.put(admin);
    });
  }

  static Future<void> _seedOrUpgradeCatalog(Isar isar) async {
    final categorySpecs = <_CategorySeed>[
      const _CategorySeed(sortOrder: 1, name: 'อาหารจานหลัก'),
      const _CategorySeed(sortOrder: 2, name: 'เครื่องดื่ม'),
      const _CategorySeed(sortOrder: 3, name: 'ของหวาน'),
    ];

    final productSpecs = <_ProductSeed>[
      const _ProductSeed(
          name: 'ผัดไทย', price: 85.0, sku: 'MAIN-001', categorySortOrder: 1),
      const _ProductSeed(
          name: 'ส้มตำ', price: 60.0, sku: 'MAIN-002', categorySortOrder: 1),
      const _ProductSeed(
          name: 'ต้มยำกุ้ง',
          price: 150.0,
          sku: 'MAIN-003',
          categorySortOrder: 1),
      const _ProductSeed(
          name: 'แกงเขียวหวาน',
          price: 120.0,
          sku: 'MAIN-004',
          categorySortOrder: 1),
      const _ProductSeed(
          name: 'ข้าวเหนียวมะม่วง',
          price: 90.0,
          sku: 'DESS-001',
          categorySortOrder: 3),
      const _ProductSeed(
          name: 'ชาไทย', price: 45.0, sku: 'DRINK-001', categorySortOrder: 2),
      const _ProductSeed(
          name: 'น้ำมะพร้าว',
          price: 50.0,
          sku: 'DRINK-002',
          categorySortOrder: 2),
      const _ProductSeed(
          name: 'ข้าวผัดกะเพรา',
          price: 75.0,
          sku: 'MAIN-005',
          categorySortOrder: 1),
      const _ProductSeed(
          name: 'ปอเปี๊ยะทอด',
          price: 55.0,
          sku: 'APP-001',
          categorySortOrder: 1),
      const _ProductSeed(
          name: 'สะเต๊ะไก่', price: 80.0, sku: 'APP-002', categorySortOrder: 1),
      const _ProductSeed(
          name: 'ส้มตำปู', price: 65.0, sku: 'MAIN-006', categorySortOrder: 1),
      const _ProductSeed(
          name: 'หมูทอด', price: 70.0, sku: 'MAIN-007', categorySortOrder: 1),
      const _ProductSeed(
          name: 'ชามะนาว', price: 40.0, sku: 'DRINK-003', categorySortOrder: 2),
      const _ProductSeed(
          name: 'น้ำเปล่า',
          price: 15.0,
          sku: 'DRINK-004',
          categorySortOrder: 2),
      const _ProductSeed(
          name: 'กล้วยบวชชีน',
          price: 45.0,
          sku: 'DESS-002',
          categorySortOrder: 3),
    ];

    final existingCategories = await isar.categoryModels.where().findAll();
    final existingProducts = await isar.productModels.where().findAll();
    final categoriesByExistingSortOrder = {
      for (final category in existingCategories) category.sortOrder: category,
    };
    final productsBySku = {
      for (final product in existingProducts) product.sku: product,
    };

    await isar.writeTxn(() async {
      final categoriesByOrder = <int, CategoryModel>{};
      for (final spec in categorySpecs) {
        final existing = categoriesByExistingSortOrder[spec.sortOrder];
        final category = existing ?? CategoryModel();
        category.name = spec.name;
        category.sortOrder = spec.sortOrder;
        category.id = await isar.categoryModels.put(category);
        categoriesByOrder[spec.sortOrder] = category;
      }

      for (final spec in productSpecs) {
        final existing = productsBySku[spec.sku];
        final product = existing ?? ProductModel();
        product
          ..name = spec.name
          ..price = spec.price
          ..sku = spec.sku
          ..isAvailable = true;
        product.category.value = categoriesByOrder[spec.categorySortOrder];
        product.id = await isar.productModels.put(product);
        await product.category.save();
      }
    });
  }
}

class _CategorySeed {
  const _CategorySeed({
    required this.sortOrder,
    required this.name,
  });

  final int sortOrder;
  final String name;
}

class _ProductSeed {
  const _ProductSeed({
    required this.name,
    required this.price,
    required this.sku,
    required this.categorySortOrder,
  });

  final String name;
  final double price;
  final String sku;
  final int categorySortOrder;
}
