import 'dart:async';

import 'package:isar/isar.dart';

import '../../features/auth/data/models/user_model.dart';
import '../../features/pos/data/models/category_model.dart';
import '../../features/pos/data/models/product_model.dart';
import '../../features/settings/data/models/app_settings_model.dart';
import '../../features/tables/data/models/table_model.dart';
import '../../features/tables/data/models/floor_plan_model.dart';
import '../../features/tables/data/models/layout_object_model.dart';
import '../../features/customer/data/models/customer_model.dart';
import '../../features/customer/data/models/promotion_model.dart';
import '../../features/dining/data/models/buffet_tier_model.dart';
import '../../features/printer/data/models/receipt_template_model.dart';

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

        final customerCount = await isar.customerModels.count();
        if (customerCount == 0) {
          await isar.customerModels.putAll([
            CustomerModel()
              ..name = 'สมชาย ใจดี'
              ..phone = '0812345678'
              ..points = 1250
              ..totalSpent = 25000
              ..memberTier = 'gold'
              ..visitCount = 15,
            CustomerModel()
              ..name = 'สมหญิง รักษ์'
              ..phone = '0898765432'
              ..points = 340
              ..totalSpent = 8500
              ..memberTier = 'silver'
              ..visitCount = 5,
          ]);

          await isar.promotionModels.putAll([
            PromotionModel()
              ..name = 'ส่วนลดสมาชิก Gold 10%'
              ..type = 'percentage'
              ..discountPercent = 0.10
              ..applicableTier = 'gold',
            PromotionModel()
              ..name = 'ลด 50 บาท (ขั้นต่ำ 500)'
              ..type = 'fixed'
              ..discountAmount = 50
              ..minSpend = 500,
          ]);
        }
      });
    } else {
      await _upgradeUsers(isar);
    }

    await _seedOrUpgradeCatalog(isar);
    await _seedSettings(isar);
    await _seedTables(isar);
    await _seedBuffetTiers(isar);
    await _seedReceiptTemplates(isar);
  }

  static Future<void> _seedReceiptTemplates(Isar isar) async {
    final count = await isar.receiptTemplateModels.count();
    if (count > 0) return;

    await isar.writeTxn(() async {
      final templates = [
        ReceiptTemplateModel()
          ..name = 'Default Receipt'
          ..type = 'receipt'
          ..storeName = 'Flutter POS Demo'
          ..storeAddress = '99 ถนนโชตนา อำเภอเมือง จังหวัดเชียงใหม่ 50000'
          ..storePhone = '02-333-4444'
          ..taxId = '0105559999999'
          ..showItemSku = true
          ..showTaxBreakdown = true
          ..showPaymentMethod = true
          ..footerText = 'ขอบคุณที่อุดหนุน'
          ..footerText2 = 'www.example.com'
          ..paperWidth = 80
          ..isDefault = true,
        ReceiptTemplateModel()
          ..name = 'Kitchen Order'
          ..type = 'kitchen_ticket'
          ..showTableInfo = true
          ..showItemSku = false
          ..paperWidth = 58
          ..isDefault = false,
      ];
      await isar.receiptTemplateModels.putAll(templates);
    });
  }

  static Future<void> _seedBuffetTiers(Isar isar) async {
    final count = await isar.buffetTierModels.count();
    if (count > 0) return;

    await isar.writeTxn(() async {
      final tiers = [
        BuffetTierModel()
          ..name = 'Silver Tier'
          ..adultPrice = 399.0
          ..childPrice = 199.0
          ..elderlyDiscount = 0.1
          ..timeLimitMinutes = 90
          ..colorHex = '#C0C0C0'
          ..sortOrder = 1,
        BuffetTierModel()
          ..name = 'Gold Tier'
          ..adultPrice = 599.0
          ..childPrice = 299.0
          ..elderlyDiscount = 0.2
          ..timeLimitMinutes = 120
          ..colorHex = '#FFD700'
          ..sortOrder = 2,
        BuffetTierModel()
          ..name = 'Platinum Tier'
          ..adultPrice = 899.0
          ..childPrice = 449.0
          ..elderlyDiscount = 0.3
          ..timeLimitMinutes = 120
          ..colorHex = '#E5E4E2'
          ..sortOrder = 3,
      ];
      await isar.buffetTierModels.putAll(tiers);
    });
  }

  static Future<void> _seedTables(Isar isar) async {
    final floorPlanCount = await isar.floorPlanModels.count();
    if (floorPlanCount == 0) {
      await isar.writeTxn(() async {
        final defaultFloor = FloorPlanModel()
          ..name = 'ชั้น 1 (Main)'
          ..isDefault = true
          ..canvasWidth = 1200
          ..canvasHeight = 800;
        final fpId = await isar.floorPlanModels.put(defaultFloor);

        final tables = [
          TableModel()..name = 'T01'..capacity = 2..status = 'available'..floorPlanId = fpId..shape = 'square',
          TableModel()..name = 'T02'..capacity = 4..status = 'available'..floorPlanId = fpId..shape = 'square',
          TableModel()..name = 'T03'..capacity = 4..status = 'available'..floorPlanId = fpId..shape = 'round',
          TableModel()..name = 'T04'..capacity = 6..status = 'available'..floorPlanId = fpId..shape = 'long',
          TableModel()..name = 'V01'..capacity = 8..status = 'available'..floorPlanId = fpId..shape = 'square',
        ];
        await isar.tableModels.putAll(tables);

        final objects = [
          LayoutObjectModel()..floorPlanId = fpId..objectType = 'table'..tableId = 1..x = 100..y = 100..width = 100..height = 100,
          LayoutObjectModel()..floorPlanId = fpId..objectType = 'table'..tableId = 2..x = 300..y = 100..width = 120..height = 120,
          LayoutObjectModel()..floorPlanId = fpId..objectType = 'table'..tableId = 3..x = 100..y = 300..width = 120..height = 120,
          LayoutObjectModel()..floorPlanId = fpId..objectType = 'table'..tableId = 4..x = 500..y = 300..width = 160..height = 100,
          LayoutObjectModel()..floorPlanId = fpId..objectType = 'table'..tableId = 5..x = 100..y = 500..width = 160..height = 160,
          LayoutObjectModel()..floorPlanId = fpId..objectType = 'wall'..x = 50..y = 50..width = 800..height = 20..colorHex = '#555555',
          LayoutObjectModel()..floorPlanId = fpId..objectType = 'door'..x = 400..y = 40..width = 100..height = 40..rotation = 0,
        ];
        await isar.layoutObjectModels.putAll(objects);
      });
    }
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
