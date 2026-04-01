import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thai_pos_demo/features/pos/domain/entities/category.dart';
import 'package:thai_pos_demo/features/pos/domain/entities/product.dart';
import 'package:thai_pos_demo/features/pos/domain/repositories/pos_repository.dart';
import 'package:thai_pos_demo/features/pos/presentation/providers/pos_providers.dart';
import 'package:thai_pos_demo/features/settings/presentation/providers/settings_providers.dart';

class _FakePosRepository implements PosRepository {
  _FakePosRepository({
    required this.categories,
    required this.products,
  });

  final List<Category> categories;
  final List<Product> products;
  Map<String, int>? lastDeducted;
  _RestockCall? lastRestocked;

  @override
  Future<List<Category>> getCategories() async => categories;

  @override
  Future<List<Product>> getProducts({String? categoryId}) async {
    if (categoryId == null) return products;
    return products
        .where((product) => product.category?.id == categoryId)
        .toList();
  }

  @override
  Future<void> deductStock(Map<String, int> quantitiesByProductId) async {
    lastDeducted = quantitiesByProductId;
  }

  @override
  Future<void> restockProduct(String productId, int quantity) async {
    lastRestocked = _RestockCall(productId: productId, quantity: quantity);
  }
}

class _RestockCall {
  const _RestockCall({
    required this.productId,
    required this.quantity,
  });

  final String productId;
  final int quantity;
}

void main() {
  group('Pos providers', () {
    late ProviderContainer container;
    late _FakePosRepository repository;
    final mains = const Category(id: 'c1', name: 'Mains', sortOrder: 1);
    final drinks = const Category(id: 'c2', name: 'Drinks', sortOrder: 2);

    setUp(() {
      repository = _FakePosRepository(
        categories: [mains, drinks],
        products: [
          Product(
            id: 'p1',
            name: 'Pad Thai',
            price: 85,
            sku: 'MAIN-001',
            stockQuantity: 8,
            category: mains,
          ),
          Product(
            id: 'p2',
            name: 'Thai Tea',
            price: 45,
            sku: 'DRINK-001',
            stockQuantity: 3,
            category: drinks,
          ),
        ],
      );

      container = ProviderContainer(
        overrides: [
          posRepositoryProvider.overrideWith((ref) => repository),
          lowStockThresholdProvider.overrideWith((ref) async => 5),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('loads categories', () async {
      final categories = await container.read(categoriesProvider.future);
      expect(categories, hasLength(2));
      expect(categories.first.name, 'Mains');
    });

    test('filters products by selected category', () async {
      container.read(selectedCategoryIdProvider.notifier).select('c2');

      final products = await container.read(productsProvider.future);
      expect(products, hasLength(1));
      expect(products.first.name, 'Thai Tea');
    });

    test('counts low stock items using threshold provider', () async {
      final count = await container.read(lowStockCountProvider.future);
      expect(count, 1);
    });

    test('inventory actions delegate to repository and invalidate state',
        () async {
      final notifier = container.read(inventoryActionsProvider.notifier);

      await notifier.deductStock({'p1': 2});
      await notifier.restockProduct('p2', 4);

      expect(repository.lastDeducted, {'p1': 2});
      expect(repository.lastRestocked?.productId, 'p2');
      expect(repository.lastRestocked?.quantity, 4);
      expect(container.read(inventoryActionsProvider), isA<AsyncData<void>>());
    });
  });
}
