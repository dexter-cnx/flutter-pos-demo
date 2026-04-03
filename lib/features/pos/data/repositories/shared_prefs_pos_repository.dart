import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app/bootstrap.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/pos_repository.dart';

class SharedPrefsPosRepository implements PosRepository {
  static const _categoriesKey = 'web_categories_v1';
  static const _productsKey = 'web_products_v1';

  @override
  Future<List<Category>> getCategories() async {
    final prefs = sharedPreferences;
    if (prefs == null) return _defaultCategories;

    await _ensureSeeded(prefs);
    return _readCategories(prefs);
  }

  @override
  Future<List<Product>> getProducts({String? categoryId}) async {
    final prefs = sharedPreferences;
    if (prefs == null) return _filterProducts(_defaultProducts, categoryId);

    await _ensureSeeded(prefs);
    final products = _readProducts(prefs);
    return _filterProducts(products, categoryId);
  }

  @override
  Future<void> deductStock(Map<String, int> quantitiesByProductId) async {
    final prefs = sharedPreferences;
    if (prefs == null || quantitiesByProductId.isEmpty) return;

    await _ensureSeeded(prefs);
    final products = _readProducts(prefs);
    final updated = products.map((product) {
      final deducted = quantitiesByProductId[product.id];
      if (deducted == null) return product;

      final remaining = product.stockQuantity - deducted;
      return product.copyWith(
        stockQuantity: remaining < 0 ? 0 : remaining,
        isAvailable: remaining > 0,
      );
    }).toList();

    await _saveProducts(prefs, updated);
  }

  @override
  Future<void> restockProduct(String productId, int quantity) async {
    final prefs = sharedPreferences;
    if (prefs == null || quantity <= 0) return;

    await _ensureSeeded(prefs);
    final products = _readProducts(prefs);
    final updated = products.map((product) {
      if (product.id != productId) return product;
      final nextStock = product.stockQuantity + quantity;
      return product.copyWith(
        stockQuantity: nextStock,
        isAvailable: nextStock > 0,
      );
    }).toList();

    await _saveProducts(prefs, updated);
  }

  @override
  Future<void> upsertCategory(Category category) async {
    final prefs = sharedPreferences;
    if (prefs == null) return;

    await _ensureSeeded(prefs);
    final categories = _readCategories(prefs);
    final index = categories.indexWhere((c) => c.id == category.id);

    final updated = List<Category>.from(categories);
    if (index >= 0) {
      updated[index] = category;
    } else {
      updated.add(category);
    }

    await prefs.setString(
      _categoriesKey,
      jsonEncode(_encodeCategories(updated)),
    );
  }

  @override
  Future<void> deleteCategory(String id) async {
    final prefs = sharedPreferences;
    if (prefs == null) return;

    await _ensureSeeded(prefs);
    final categories = _readCategories(prefs);
    categories.removeWhere((c) => c.id == id);

    await prefs.setString(
      _categoriesKey,
      jsonEncode(_encodeCategories(categories)),
    );
  }

  @override
  Future<void> upsertProduct(Product product) async {
    final prefs = sharedPreferences;
    if (prefs == null) return;

    await _ensureSeeded(prefs);
    final products = _readProducts(prefs);
    final index = products.indexWhere((p) => p.id == product.id);

    final updated = List<Product>.from(products);
    if (index >= 0) {
      updated[index] = product;
    } else {
      updated.add(product);
    }

    await _saveProducts(prefs, updated);
  }

  @override
  Future<void> deleteProduct(String id) async {
    final prefs = sharedPreferences;
    if (prefs == null) return;

    await _ensureSeeded(prefs);
    final products = _readProducts(prefs);
    products.removeWhere((p) => p.id == id);

    await _saveProducts(prefs, products);
  }

  Future<void> _ensureSeeded(SharedPreferences prefs) async {
    if (prefs.containsKey(_categoriesKey) && prefs.containsKey(_productsKey)) {
      return;
    }

    await prefs.setString(
      _categoriesKey,
      jsonEncode(_encodeCategories(_defaultCategories)),
    );
    await prefs.setString(
      _productsKey,
      jsonEncode(_encodeProducts(_defaultProducts)),
    );
  }

  List<Category> _readCategories(SharedPreferences prefs) {
    final raw = prefs.getString(_categoriesKey);
    if (raw == null || raw.isEmpty) return _defaultCategories;

    final decoded = (jsonDecode(raw) as List<dynamic>)
        .cast<Map<String, dynamic>>();
    return decoded.map(_decodeCategory).toList()
      ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
  }

  List<Product> _readProducts(SharedPreferences prefs) {
    final raw = prefs.getString(_productsKey);
    if (raw == null || raw.isEmpty) return _defaultProducts;

    final categoriesById = {
      for (final category in _readCategories(prefs)) category.id: category,
    };
    final decoded = (jsonDecode(raw) as List<dynamic>)
        .cast<Map<String, dynamic>>();
    final products = decoded
        .map((json) => _decodeProduct(json, categoriesById))
        .toList();

    products.sort((a, b) {
      final categoryCompare = (a.category?.sortOrder ?? 0).compareTo(
        b.category?.sortOrder ?? 0,
      );
      if (categoryCompare != 0) return categoryCompare;
      return a.name.compareTo(b.name);
    });
    return products;
  }

  Future<void> _saveProducts(
    SharedPreferences prefs,
    List<Product> products,
  ) async {
    await prefs.setString(_productsKey, jsonEncode(_encodeProducts(products)));
  }

  List<Product> _filterProducts(List<Product> products, String? categoryId) {
    if (categoryId == null) return products;
    return products
        .where((product) => product.category?.id == categoryId)
        .toList();
  }

  List<Map<String, dynamic>> _encodeCategories(List<Category> categories) {
    return categories
        .map(
          (category) => {
            'id': category.id,
            'name': category.name,
            'sortOrder': category.sortOrder,
          },
        )
        .toList();
  }

  List<Map<String, dynamic>> _encodeProducts(List<Product> products) {
    return products
        .map(
          (product) => {
            'id': product.id,
            'name': product.name,
            'price': product.price,
            'sku': product.sku,
            'stockQuantity': product.stockQuantity,
            'isAvailable': product.isAvailable,
            'imageUrl': product.imageUrl,
            'categoryId': product.category?.id,
          },
        )
        .toList();
  }

  Category _decodeCategory(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String,
      name: json['name'] as String,
      sortOrder: json['sortOrder'] as int? ?? 0,
    );
  }

  Product _decodeProduct(
    Map<String, dynamic> json,
    Map<String, Category> categoriesById,
  ) {
    final categoryId = json['categoryId'] as String?;

    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      sku: json['sku'] as String,
      stockQuantity: json['stockQuantity'] as int? ?? 0,
      isAvailable: json['isAvailable'] as bool? ?? true,
      imageUrl: json['imageUrl'] as String?,
      category: categoryId == null ? null : categoriesById[categoryId],
    );
  }

  static final _defaultCategories = <Category>[
    Category(id: '1', name: 'อาหารจานหลัก', sortOrder: 1),
    Category(id: '2', name: 'เครื่องดื่ม', sortOrder: 2),
    Category(id: '3', name: 'ของหวาน', sortOrder: 3),
  ];

  static final _defaultProducts = <Product>[
    Product(
      id: '1',
      name: 'ผัดไทย',
      price: 85,
      sku: 'MAIN-001',
      stockQuantity: 18,
      category: _defaultCategories[0],
    ),
    Product(
      id: '2',
      name: 'ส้มตำ',
      price: 60,
      sku: 'MAIN-002',
      stockQuantity: 12,
      category: _defaultCategories[0],
    ),
    Product(
      id: '3',
      name: 'ต้มยำกุ้ง',
      price: 150,
      sku: 'MAIN-003',
      stockQuantity: 8,
      category: _defaultCategories[0],
    ),
    Product(
      id: '4',
      name: 'แกงเขียวหวาน',
      price: 120,
      sku: 'MAIN-004',
      stockQuantity: 9,
      category: _defaultCategories[0],
    ),
    Product(
      id: '5',
      name: 'ข้าวผัดกะเพรา',
      price: 75,
      sku: 'MAIN-005',
      stockQuantity: 14,
      category: _defaultCategories[0],
    ),
    Product(
      id: '6',
      name: 'ชาไทย',
      price: 45,
      sku: 'DRINK-001',
      stockQuantity: 25,
      category: _defaultCategories[1],
    ),
    Product(
      id: '7',
      name: 'น้ำมะพร้าว',
      price: 50,
      sku: 'DRINK-002',
      stockQuantity: 16,
      category: _defaultCategories[1],
    ),
    Product(
      id: '8',
      name: 'ชามะนาว',
      price: 40,
      sku: 'DRINK-003',
      stockQuantity: 20,
      category: _defaultCategories[1],
    ),
    Product(
      id: '9',
      name: 'ข้าวเหนียวมะม่วง',
      price: 90,
      sku: 'DESS-001',
      stockQuantity: 7,
      category: _defaultCategories[2],
    ),
    Product(
      id: '10',
      name: 'กล้วยบวชชีน',
      price: 45,
      sku: 'DESS-002',
      stockQuantity: 11,
      category: _defaultCategories[2],
    ),
    Product(
      id: '11',
      name: 'ปอเปี๊ยะทอด',
      price: 55,
      sku: 'APP-001',
      stockQuantity: 15,
      category: _defaultCategories[0],
    ),
    Product(
      id: '12',
      name: 'สะเต๊ะไก่',
      price: 80,
      sku: 'APP-002',
      stockQuantity: 13,
      category: _defaultCategories[0],
    ),
    Product(
      id: '13',
      name: 'ข้าวผัดปู',
      price: 95,
      sku: 'MAIN-006',
      stockQuantity: 10,
      category: _defaultCategories[0],
    ),
    Product(
      id: '14',
      name: 'น้ำเก๊กฮวย',
      price: 30,
      sku: 'DRINK-004',
      stockQuantity: 30,
      category: _defaultCategories[1],
    ),
    Product(
      id: '15',
      name: 'กาแฟเย็น',
      price: 45,
      sku: 'DRINK-005',
      stockQuantity: 18,
      category: _defaultCategories[1],
    ),
  ];
}
