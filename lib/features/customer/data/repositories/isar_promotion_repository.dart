import 'package:isar/isar.dart';

import '../models/promotion_model.dart';
import '../../domain/entities/promotion.dart';

class IsarPromotionRepository {
  final Isar _isar;

  IsarPromotionRepository(this._isar);

  Future<List<Promotion>> getActivePromotions() async {
    final now = DateTime.now();
    final models = await _isar.promotionModels
        .filter()
        .isActiveEqualTo(true)
        .and()
        .group((q) => q.startDateIsNull().or().startDateLessThan(now))
        .and()
        .group((q) => q.endDateIsNull().or().endDateGreaterThan(now))
        .sortBySortOrder()
        .findAll();

    return models.map(_mapToEntity).toList();
  }

  Promotion _mapToEntity(PromotionModel model) {
    return Promotion(
      id: model.id.toString(),
      name: model.name,
      type: model.type,
      discountPercent: model.discountPercent,
      discountAmount: model.discountAmount,
      minSpend: model.minSpend,
      applicableTier: model.applicableTier,
    );
  }
}
