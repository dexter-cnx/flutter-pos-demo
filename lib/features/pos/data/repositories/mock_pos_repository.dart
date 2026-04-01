import 'dart:async';

import '../../domain/entities/category.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/pos_repository.dart';

class MockPosRepository implements PosRepository {
  final List<Category> _categories = [
    const Category(id: '1', name: 'อาหารจานหลัก', sortOrder: 1),
    const Category(id: '2', name: 'เครื่องดื่ม', sortOrder: 2),
    const Category(id: '3', name: 'ของหวาน', sortOrder: 3),
  ];

  late final List<Product> _products;

  MockPosRepository() {
    _products = [
      Product(
        id: '1',
        name: 'ผัดไทย',
        price: 85.0,
        sku: 'MAIN-001',
        stockQuantity: 18,
        category: _categories[0],
      ),
      Product(
        id: '2',
        name: 'ส้มตำ',
        price: 60.0,
        sku: 'MAIN-002',
        stockQuantity: 12,
        category: _categories[0],
      ),
      Product(
        id: '3',
        name: 'ต้มยำกุ้ง',
        price: 150.0,
        sku: 'MAIN-003',
        stockQuantity: 8,
        category: _categories[0],
      ),
      Product(
        id: '4',
        name: 'แกงเขียวหวาน',
        price: 120.0,
        sku: 'MAIN-004',
        stockQuantity: 9,
        category: _categories[0],
      ),
      Product(
        id: '5',
        name: 'ข้าวผัดกะเพรา',
        price: 75.0,
        sku: 'MAIN-005',
        stockQuantity: 14,
        category: _categories[0],
      ),
      Product(
        id: '6',
        name: 'ชาไทย',
        price: 45.0,
        sku: 'DRINK-001',
        stockQuantity: 25,
        category: _categories[1],
      ),
      Product(
        id: '7',
        name: 'น้ำมะพร้าว',
        price: 50.0,
        sku: 'DRINK-002',
        stockQuantity: 16,
        category: _categories[1],
      ),
      Product(
        id: '8',
        name: 'ชามะนาว',
        price: 40.0,
        sku: 'DRINK-003',
        stockQuantity: 20,
        category: _categories[1],
      ),
      Product(
        id: '9',
        name: 'ข้าวเหนียวมะม่วง',
        price: 90.0,
        sku: 'DESS-001',
        stockQuantity: 7,
        category: _categories[2],
      ),
      Product(
        id: '10',
        name: 'กล้วยบวชชีน',
        price: 45.0,
        sku: 'DESS-002',
        stockQuantity: 11,
        category: _categories[2],
      ),
      Product(
        id: '11',
        name: 'ปอเปี๊ยะทอด',
        price: 55.0,
        sku: 'APP-001',
        stockQuantity: 15,
        category: _categories[0],
      ),
      Product(
        id: '12',
        name: 'สะเต๊ะไก่',
        price: 80.0,
        sku: 'APP-002',
        stockQuantity: 13,
        category: _categories[0],
      ),
      Product(
        id: '13',
        name: 'ข้าวผัดปู',
        price: 95.0,
        sku: 'MAIN-006',
        stockQuantity: 10,
        category: _categories[0],
      ),
      Product(
        id: '14',
        name: 'น้ำเก๊กฮวย',
        price: 30.0,
        sku: 'DRINK-004',
        stockQuantity: 30,
        category: _categories[1],
      ),
      Product(
        id: '15',
        name: 'กาแฟเย็น',
        price: 45.0,
        sku: 'DRINK-005',
        stockQuantity: 18,
        category: _categories[1],
      ),
    ];
  }

  @override
  Future<List<Category>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _categories;
  }

  @override
  Future<List<Product>> getProducts({String? categoryId}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (categoryId != null) {
      return _products
          .where((product) => product.category?.id == categoryId)
          .toList();
    }
    return _products;
  }

  @override
  Future<void> deductStock(Map<String, int> quantitiesByProductId) async {}

  @override
  Future<void> restockProduct(String productId, int quantity) async {}
}
