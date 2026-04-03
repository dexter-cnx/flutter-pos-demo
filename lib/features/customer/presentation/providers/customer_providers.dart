import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app/bootstrap.dart';
import '../../domain/entities/customer.dart';
import '../../domain/entities/promotion.dart';
import '../../data/repositories/isar_customer_repository.dart';
import '../../data/repositories/isar_promotion_repository.dart';

part 'customer_providers.g.dart';

@Riverpod(keepAlive: true)
IsarCustomerRepository customerRepository(CustomerRepositoryRef ref) {
  return IsarCustomerRepository(isar!);
}

@riverpod
Future<List<Customer>> customerSearch(CustomerSearchRef ref, String query) {
  if (query.isEmpty) return Future.value([]);
  return ref.watch(customerRepositoryProvider).searchCustomers(query);
}

@Riverpod(keepAlive: true)
IsarPromotionRepository promotionRepository(PromotionRepositoryRef ref) {
  return IsarPromotionRepository(isar!);
}

@riverpod
Future<List<Promotion>> activePromotions(ActivePromotionsRef ref) {
  return ref.watch(promotionRepositoryProvider).getActivePromotions();
}
