import '../entities/buffet_tier.dart';

abstract class BuffetTierRepository {
  Future<List<BuffetTier>> getAllTiers();
  Future<List<BuffetTier>> getActiveTiers();
  Future<BuffetTier?> getTierById(String id);
  Future<void> saveTier(BuffetTier tier);
  Future<void> deleteTier(String id);
}
