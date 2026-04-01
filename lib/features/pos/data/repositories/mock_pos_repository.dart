import '../../domain/entities/category.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/pos_repository.dart';

class MockPosRepository implements PosRepository {
  final List<Category> _categories = [
    const Category(id: '1', name: 'Main Dishes', sortOrder: 1),
    const Category(id: '2', name: 'Drinks', sortOrder: 2),
    const Category(id: '3', name: 'Desserts', sortOrder: 3),
  ];

  late final List<Product> _products;

  MockPosRepository() {
    _products = [
      Product(
        id: '1',
        name: 'Pad Thai',
        price: 85.0,
        sku: 'MAIN-001',
        category: _categories[0],
      ),
      Product(
        id: '2',
        name: 'Som Tum',
        price: 60.0,
        sku: 'MAIN-002',
        category: _categories[0],
      ),
      Product(
        id: '3',
        name: 'Tom Yum Goong',
        price: 150.0,
        sku: 'MAIN-003',
        category: _categories[0],
      ),
      Product(
        id: '4',
        name: 'Green Curry',
        price: 120.0,
        sku: 'MAIN-004',
        category: _categories[0],
      ),
      Product(
        id: '5',
        name: 'Basil Fried Rice',
        price: 75.0,
        sku: 'MAIN-005',
        category: _categories[0],
      ),
      Product(
        id: '6',
        name: 'Thai Milk Tea',
        price: 45.0,
        sku: 'DRINK-001',
        category: _categories[1],
      ),
      Product(
        id: '7',
        name: 'Coconut Water',
        price: 50.0,
        sku: 'DRINK-002',
        category: _categories[1],
      ),
      Product(
        id: '8',
        name: 'Lemon Tea',
        price: 40.0,
        sku: 'DRINK-003',
        category: _categories[1],
      ),
      Product(
        id: '9',
        name: 'Mango Sticky Rice',
        price: 90.0,
        sku: 'DESS-001',
        category: _categories[2],
      ),
      Product(
        id: '10',
        name: 'Banana in Coconut Milk',
        price: 45.0,
        sku: 'DESS-002',
        category: _categories[2],
      ),
      Product(
        id: '11',
        name: 'Spring Rolls',
        price: 55.0,
        sku: 'APP-001',
        category: _categories[0],
      ),
      Product(
        id: '12',
        name: 'Chicken Satay',
        price: 80.0,
        sku: 'APP-002',
        category: _categories[0],
      ),
      Product(
        id: '13',
        name: 'Fried Rice w/ Crab',
        price: 95.0,
        sku: 'MAIN-006',
        category: _categories[0],
      ),
      Product(
        id: '14',
        name: 'Chrysanthemum Juice',
        price: 30.0,
        sku: 'DRINK-004',
        category: _categories[1],
      ),
      Product(
        id: '15',
        name: 'Iced Coffee',
        price: 45.0,
        sku: 'DRINK-005',
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
      return _products.where((p) => p.category?.id == categoryId).toList();
    }
    return _products;
  }
}
