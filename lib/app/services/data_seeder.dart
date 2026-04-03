import 'dart:async';

import 'package:isar/isar.dart';

import '../../features/auth/data/models/user_model.dart';
import '../../features/pos/data/models/category_model.dart';
import '../../features/pos/data/models/product_model.dart';
import '../../features/settings/data/models/app_settings_model.dart';
import '../../features/tables/data/models/table_model.dart';

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
    await _seedSettings(isar);
    await _seedTables(isar);
  }

  static Future<void> _seedTables(Isar isar) async {
    final count = await isar.tableModels.count();
    if (count > 0) return;

    await isar.writeTxn(() async {
      final tables = [
        TableModel()
          ..name = 'Table 1'
          ..capacity = 2
          ..status = 'available',
        TableModel()
          ..name = 'Table 2'
          ..capacity = 2
          ..status = 'available',
        TableModel()
          ..name = 'Table 3'
          ..capacity = 4
          ..status = 'available',
        TableModel()
          ..name = 'Table 4'
          ..capacity = 4
          ..status = 'available',
        TableModel()
          ..name = 'Table 5'
          ..capacity = 6
          ..status = 'available',
        TableModel()
          ..name = 'VIP 1'
          ..capacity = 8
          ..status = 'available'
          ..floor = '2nd Floor',
      ];
      await isar.tableModels.putAll(tables);
    });
  }

  static Future<void> _upgradeUsers(Isar isar) async {
    final admin = await isar.userModels
        .where()
        .usernameEqualTo('admin')
        .findFirst();
    if (admin == null || admin.displayName == 'ผู้ดูแลระบบเดโม') return;

    admin.displayName = 'ผู้ดูแลระบบเดโม';
    await isar.writeTxn(() async {
      await isar.userModels.put(admin);
    });
  }

  static Future<void> _seedOrUpgradeCatalog(Isar isar) async {
    const categorySpecs = <_CategorySeed>[
      _CategorySeed(sortOrder: 1, name: 'อาหารจานหลัก'),
      _CategorySeed(sortOrder: 2, name: 'เครื่องดื่ม'),
      _CategorySeed(sortOrder: 3, name: 'ของหวาน'),
    ];

    const productSpecs = <_ProductSeed>[
      _ProductSeed(
        name: 'ผัดไทย',
        price: 85,
        sku: 'MAIN-001',
        categorySortOrder: 1,
        stockQuantity: 18,
      ),
      _ProductSeed(
        name: 'ส้มตำ',
        price: 60,
        sku: 'MAIN-002',
        categorySortOrder: 1,
        stockQuantity: 12,
      ),
      _ProductSeed(
        name: 'ต้มยำกุ้ง',
        price: 150,
        sku: 'MAIN-003',
        categorySortOrder: 1,
        stockQuantity: 8,
      ),
      _ProductSeed(
        name: 'แกงเขียวหวาน',
        price: 120,
        sku: 'MAIN-004',
        categorySortOrder: 1,
        stockQuantity: 9,
      ),
      _ProductSeed(
        name: 'ข้าวผัดกะเพรา',
        price: 75,
        sku: 'MAIN-005',
        categorySortOrder: 1,
        stockQuantity: 14,
      ),
      _ProductSeed(
        name: 'ส้มตำปู',
        price: 65,
        sku: 'MAIN-006',
        categorySortOrder: 1,
        stockQuantity: 10,
      ),
      _ProductSeed(
        name: 'หมูทอด',
        price: 70,
        sku: 'MAIN-007',
        categorySortOrder: 1,
        stockQuantity: 11,
      ),
      _ProductSeed(
        name: 'ปอเปี๊ยะทอด',
        price: 55,
        sku: 'APP-001',
        categorySortOrder: 1,
        stockQuantity: 15,
      ),
      _ProductSeed(
        name: 'สะเต๊ะไก่',
        price: 80,
        sku: 'APP-002',
        categorySortOrder: 1,
        stockQuantity: 13,
      ),
      _ProductSeed(
        name: 'ชาไทย',
        price: 45,
        sku: 'DRINK-001',
        categorySortOrder: 2,
        stockQuantity: 25,
      ),
      _ProductSeed(
        name: 'น้ำมะพร้าว',
        price: 50,
        sku: 'DRINK-002',
        categorySortOrder: 2,
        stockQuantity: 16,
      ),
      _ProductSeed(
        name: 'ชามะนาว',
        price: 40,
        sku: 'DRINK-003',
        categorySortOrder: 2,
        stockQuantity: 20,
      ),
      _ProductSeed(
        name: 'น้ำเปล่า',
        price: 15,
        sku: 'DRINK-004',
        categorySortOrder: 2,
        stockQuantity: 30,
      ),
      _ProductSeed(
        name: 'ข้าวเหนียวมะม่วง',
        price: 90,
        sku: 'DESS-001',
        categorySortOrder: 3,
        stockQuantity: 7,
      ),
      _ProductSeed(
        name: 'กล้วยบวชชีน',
        price: 45,
        sku: 'DESS-002',
        categorySortOrder: 3,
        stockQuantity: 11,
      ),
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
          ..stockQuantity = spec.stockQuantity
          ..isAvailable = spec.stockQuantity > 0;
        product.category.value = categoriesByOrder[spec.categorySortOrder];
        product.id = await isar.productModels.put(product);
        await product.category.save();
      }
    });
  }

  static Future<void> _seedSettings(Isar isar) async {
    final existing = await isar.appSettingsModels.get(1);
    if (existing != null) return;

    await isar.writeTxn(() async {
      await isar.appSettingsModels.put(
        AppSettingsModel()
          ..id = 1
          ..storeName = 'Flutter POS Demo'
          ..storeAddress = '99 ถนนโชตนา อำเภอเมือง จังหวัดเชียงใหม่ 50000'
          ..storeTaxId = '0105559999999'
          ..storePhone = '02-333-4444'
          ..receiptFooter = 'ขอบคุณที่อุดหนุน แล้วพบกันใหม่'
          ..lowStockThreshold = 5,
      );
    });
  }
}

class _CategorySeed {
  const _CategorySeed({required this.sortOrder, required this.name});

  final int sortOrder;
  final String name;
}

class _ProductSeed {
  const _ProductSeed({
    required this.name,
    required this.price,
    required this.sku,
    required this.categorySortOrder,
    required this.stockQuantity,
  });

  final String name;
  final double price;
  final String sku;
  final int categorySortOrder;
  final int stockQuantity;
}
