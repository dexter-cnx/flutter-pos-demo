import 'package:isar/isar.dart';

import '../../domain/entities/buffet_tier.dart';
import '../../domain/repositories/buffet_tier_repository.dart';
import '../models/buffet_tier_model.dart';

class IsarBuffetTierRepository implements BuffetTierRepository {
  final Isar _isar;

  IsarBuffetTierRepository(this._isar);

  @override
  Future<List<BuffetTier>> getAllTiers() async {
    final models = await _isar.buffetTierModels.where().sortBySortOrder().findAll();
    return models.map(_mapToEntity).toList();
  }

  @override
  Future<List<BuffetTier>> getActiveTiers() async {
    final models = await _isar.buffetTierModels
        .filter()
        .isActiveEqualTo(true)
        .sortBySortOrder()
        .findAll();
    return models.map(_mapToEntity).toList();
  }

  @override
  Future<BuffetTier?> getTierById(String id) async {
    int parsedId = int.tryParse(id) ?? -1;
    final model = await _isar.buffetTierModels.get(parsedId);
    return model != null ? _mapToEntity(model) : null;
  }

  @override
  Future<void> saveTier(BuffetTier tier) async {
    int? parsedId = int.tryParse(tier.id);
    
    final model = BuffetTierModel()
      ..name = tier.name
      ..adultPrice = tier.adultPrice
      ..childPrice = tier.childPrice
      ..elderlyDiscount = tier.elderlyDiscount
      ..timeLimitMinutes = tier.timeLimitMinutes
      ..excludedCategoryIds = List.from(tier.excludedCategoryIds)
      ..colorHex = tier.colorHex
      ..isActive = tier.isActive
      ..sortOrder = tier.sortOrder;

    if (parsedId != null && parsedId > 0) {
      model.id = parsedId;
    }

    await _isar.writeTxn(() async {
      await _isar.buffetTierModels.put(model);
    });
  }

  @override
  Future<void> deleteTier(String id) async {
    int parsedId = int.tryParse(id) ?? -1;
    if (parsedId > 0) {
      await _isar.writeTxn(() async {
        await _isar.buffetTierModels.delete(parsedId);
      });
    }
  }

  BuffetTier _mapToEntity(BuffetTierModel model) {
    return BuffetTier(
      id: model.id.toString(),
      name: model.name,
      adultPrice: model.adultPrice,
      childPrice: model.childPrice,
      elderlyDiscount: model.elderlyDiscount,
      timeLimitMinutes: model.timeLimitMinutes,
      excludedCategoryIds: List.from(model.excludedCategoryIds),
      colorHex: model.colorHex,
      isActive: model.isActive,
      sortOrder: model.sortOrder,
    );
  }
}
