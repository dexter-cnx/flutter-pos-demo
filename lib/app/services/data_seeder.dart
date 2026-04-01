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
            ..displayName = 'Demo Admin'
            ..role = 'admin',
        );
      });
    }

    final productCount = await isar.productModels.count();
    if (productCount == 0) {
      await isar.writeTxn(() async {
        final mainCategory = CategoryModel()
          ..name = 'Main Dishes'
          ..sortOrder = 1;
        final drinkCategory = CategoryModel()
          ..name = 'Drinks'
          ..sortOrder = 2;
        final dessertCategory = CategoryModel()
          ..name = 'Desserts'
          ..sortOrder = 3;

        await isar.categoryModels.putAll([
          mainCategory,
          drinkCategory,
          dessertCategory,
        ]);

        final products = [
          ProductModel()
            ..name = 'Pad Thai'
            ..price = 85.0
            ..sku = 'MAIN-001'
            ..isAvailable = true
            ..category.value = mainCategory,
          ProductModel()
            ..name = 'Som Tum'
            ..price = 60.0
            ..sku = 'MAIN-002'
            ..isAvailable = true
            ..category.value = mainCategory,
          ProductModel()
            ..name = 'Tom Yum Goong'
            ..price = 150.0
            ..sku = 'MAIN-003'
            ..isAvailable = true
            ..category.value = mainCategory,
          ProductModel()
            ..name = 'Green Curry'
            ..price = 120.0
            ..sku = 'MAIN-004'
            ..isAvailable = true
            ..category.value = mainCategory,
          ProductModel()
            ..name = 'Mango Sticky Rice'
            ..price = 90.0
            ..sku = 'DESS-001'
            ..isAvailable = true
            ..category.value = dessertCategory,
          ProductModel()
            ..name = 'Thai Milk Tea'
            ..price = 45.0
            ..sku = 'DRINK-001'
            ..isAvailable = true
            ..category.value = drinkCategory,
          ProductModel()
            ..name = 'Coconut Water'
            ..price = 50.0
            ..sku = 'DRINK-002'
            ..isAvailable = true
            ..category.value = drinkCategory,
          // Adding more to reach 15...
          ProductModel()
            ..name = 'Basil Fried Rice'
            ..price = 75.0
            ..sku = 'MAIN-005'
            ..isAvailable = true
            ..category.value = mainCategory,
          ProductModel()
            ..name = 'Spring Rolls'
            ..price = 55.0
            ..sku = 'APP-001'
            ..isAvailable = true
            ..category.value = mainCategory,
          ProductModel()
            ..name = 'Satay Chicken'
            ..price = 80.0
            ..sku = 'APP-002'
            ..isAvailable = true
            ..category.value = mainCategory,
          ProductModel()
            ..name = 'Papaya Salad (Crab)'
            ..price = 65.0
            ..sku = 'MAIN-006'
            ..isAvailable = true
            ..category.value = mainCategory,
          ProductModel()
            ..name = 'Fried Pork'
            ..price = 70.0
            ..sku = 'MAIN-007'
            ..isAvailable = true
            ..category.value = mainCategory,
          ProductModel()
            ..name = 'Lemon Tea'
            ..price = 40.0
            ..sku = 'DRINK-003'
            ..isAvailable = true
            ..category.value = drinkCategory,
          ProductModel()
            ..name = 'Water'
            ..price = 15.0
            ..sku = 'DRINK-004'
            ..isAvailable = true
            ..category.value = drinkCategory,
          ProductModel()
            ..name = 'Banana in Coconut Milk'
            ..price = 45.0
            ..sku = 'DESS-002'
            ..isAvailable = true
            ..category.value = dessertCategory,
        ];

        for (var p in products) {
          await isar.productModels.put(p);
          await p.category.save();
        }
      });
    }
  }
}
