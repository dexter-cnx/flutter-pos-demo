import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/mock_pos_repository.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/pos_repository.dart';

part 'pos_providers.g.dart';

@riverpod
PosRepository posRepository(PosRepositoryRef ref) {
  // For now, always use Mock. Later can switch based on kIsWeb or config.
  return MockPosRepository();
}

@riverpod
Future<List<Category>> categories(CategoriesRef ref) {
  return ref.watch(posRepositoryProvider).getCategories();
}

@riverpod
Future<int> categoryCount(CategoryCountRef ref) async {
  final categories = await ref.watch(posRepositoryProvider).getCategories();
  return categories.length;
}

@riverpod
class SelectedCategoryId extends _$SelectedCategoryId {
  @override
  String? build() => null;

  void select(String? id) => state = id;
}

@riverpod
Future<List<Product>> products(ProductsRef ref) {
  final categoryId = ref.watch(selectedCategoryIdProvider);
  return ref.watch(posRepositoryProvider).getProducts(categoryId: categoryId);
}

@riverpod
Future<int> productCount(ProductCountRef ref) async {
  final products = await ref.watch(posRepositoryProvider).getProducts();
  return products.length;
}
