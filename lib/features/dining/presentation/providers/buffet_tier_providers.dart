import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app/bootstrap.dart';
import '../../domain/entities/buffet_tier.dart';
import '../../domain/repositories/buffet_tier_repository.dart';
import '../../data/repositories/isar_buffet_tier_repository.dart';

part 'buffet_tier_providers.g.dart';

@riverpod
BuffetTierRepository buffetTierRepository(BuffetTierRepositoryRef ref) {
  return IsarBuffetTierRepository(isar!);
}

@riverpod
Future<List<BuffetTier>> activeBuffetTiers(ActiveBuffetTiersRef ref) {
  final repo = ref.watch(buffetTierRepositoryProvider);
  return repo.getActiveTiers();
}

@riverpod
Future<List<BuffetTier>> allBuffetTiers(AllBuffetTiersRef ref) {
  final repo = ref.watch(buffetTierRepositoryProvider);
  return repo.getAllTiers();
}
