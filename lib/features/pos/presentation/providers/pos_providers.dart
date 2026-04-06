import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../app/bootstrap.dart';
import '../../data/repositories/local_pos_repository.dart';
import '../../data/repositories/mock_pos_repository.dart';
import '../../data/repositories/shared_prefs_pos_repository.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/pos_repository.dart';
import '../../../settings/presentation/providers/settings_providers.dart';
import 'package:thai_pos_demo/shared/presentation/providers/access_providers.dart';
import 'package:thai_pos_demo/shared/presentation/providers/audit_providers.dart' hide isar;
import 'package:thai_pos_demo/shared/domain/enums/audit_event_type.dart';
import 'package:thai_pos_demo/shared/domain/enums/audit_event_source.dart';

part 'pos_providers.g.dart';

@riverpod
PosRepository posRepository(PosRepositoryRef ref) {
  if (isar != null) {
    return LocalPosRepository();
  }

  if (sharedPreferences != null) {
    return SharedPrefsPosRepository();
  }

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
Future<List<Product>> inventoryProducts(InventoryProductsRef ref) {
  return ref.watch(posRepositoryProvider).getProducts();
}

@riverpod
Future<int> productCount(ProductCountRef ref) async {
  final products = await ref.watch(inventoryProductsProvider.future);
  return products.length;
}

@riverpod
Future<int> lowStockCount(LowStockCountRef ref) async {
  final threshold = await ref.watch(lowStockThresholdProvider.future);
  final products = await ref.watch(inventoryProductsProvider.future);
  return products
      .where(
        (product) =>
            product.stockQuantity > 0 && product.stockQuantity <= threshold,
      )
      .length;
}

@riverpod
class InventoryActions extends _$InventoryActions {
  @override
  FutureOr<void> build() {}

  Future<void> deductStock(Map<String, int> quantitiesByProductId) async {
    final userProfile = ref.read(userAccessProfileProvider);
    final auditService = ref.read(auditServiceProvider);

    await ref.read(posRepositoryProvider).deductStock(quantitiesByProductId);
    
    await auditService.logEvent(
      eventType: AuditEventType.stockRemoved,
      entityType: 'inventory',
      entityId: 'multiple',
      action: 'deduct_stock',
      actorId: userProfile.userId,
      actorLabel: userProfile.displayName,
      source: AuditEventSource.system,
      summary: 'Stock deducted for ${quantitiesByProductId.length} items during sale',
      payload: quantitiesByProductId,
    );
    _invalidateInventoryViews();
  }

  Future<void> restockProduct(String productId, int quantity) async {
    final userProfile = ref.read(userAccessProfileProvider);
    final auditService = ref.read(auditServiceProvider);

    await ref.read(posRepositoryProvider).restockProduct(productId, quantity);

    await auditService.logEvent(
      eventType: AuditEventType.stockAdded,
      entityType: 'product',
      entityId: productId,
      action: 'restock',
      actorId: userProfile.userId,
      actorLabel: userProfile.displayName,
      source: AuditEventSource.staff,
      summary: 'Product $productId restocked by $quantity units',
      payload: {'quantity': quantity},
    );
    _invalidateInventoryViews();
  }

  Future<void> upsertCategory(Category category) async {
    await ref.read(posRepositoryProvider).upsertCategory(category);
    ref.invalidate(categoriesProvider);
    ref.invalidate(categoryCountProvider);
    _invalidateInventoryViews();
  }

  Future<void> deleteCategory(String id) async {
    await ref.read(posRepositoryProvider).deleteCategory(id);
    ref.invalidate(categoriesProvider);
    ref.invalidate(categoryCountProvider);
    _invalidateInventoryViews();
  }

  Future<void> upsertProduct(Product product) async {
    final userProfile = ref.read(userAccessProfileProvider);
    final auditService = ref.read(auditServiceProvider);

    await ref.read(posRepositoryProvider).upsertProduct(product);

    await auditService.logEvent(
      eventType: AuditEventType.inventoryAdjusted,
      entityType: 'product',
      entityId: product.id,
      action: 'upsert',
      actorId: userProfile.userId,
      actorLabel: userProfile.displayName,
      source: AuditEventSource.staff,
      summary: 'Product ${product.name} updated/created',
      payload: product.toJson(),
    );
    _invalidateInventoryViews();
  }

  Future<void> deleteProduct(String id) async {
    final userProfile = ref.read(userAccessProfileProvider);
    final auditService = ref.read(auditServiceProvider);

    await ref.read(posRepositoryProvider).deleteProduct(id);

    await auditService.logEvent(
      eventType: AuditEventType.inventoryAdjusted,
      entityType: 'product',
      entityId: id,
      action: 'delete',
      actorId: userProfile.userId,
      actorLabel: userProfile.displayName,
      source: AuditEventSource.staff,
      summary: 'Product $id deleted',
    );
    _invalidateInventoryViews();
  }

  void _invalidateInventoryViews() {
    ref.invalidate(productsProvider);
    ref.invalidate(inventoryProductsProvider);
    ref.invalidate(productCountProvider);
    ref.invalidate(lowStockCountProvider);
  }
}
