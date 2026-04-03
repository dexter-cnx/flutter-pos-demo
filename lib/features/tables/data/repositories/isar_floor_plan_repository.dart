import 'package:isar/isar.dart';

import '../../data/models/floor_plan_model.dart';
import '../../domain/entities/floor_plan.dart';
import '../../domain/repositories/floor_plan_repository.dart';

class IsarFloorPlanRepository implements FloorPlanRepository {
  final Isar _isar;

  IsarFloorPlanRepository(this._isar);

  @override
  Future<List<FloorPlan>> getAllFloorPlans() async {
    final models = await _isar.floorPlanModels.where().sortBySortOrder().findAll();
    return models.map(_mapToEntity).toList();
  }

  @override
  Future<FloorPlan?> getFloorPlanById(String id) async {
    int parsedId = int.tryParse(id) ?? -1;
    final model = await _isar.floorPlanModels.get(parsedId);
    return model != null ? _mapToEntity(model) : null;
  }

  @override
  Future<void> saveFloorPlan(FloorPlan floorPlan) async {
    int? parsedId = int.tryParse(floorPlan.id);

    final model = FloorPlanModel()
      ..name = floorPlan.name
      ..sortOrder = floorPlan.sortOrder
      ..isDefault = floorPlan.isDefault
      ..canvasWidth = floorPlan.canvasWidth
      ..canvasHeight = floorPlan.canvasHeight
      ..bgColorHex = floorPlan.bgColorHex;

    if (parsedId != null && parsedId > 0) {
      model.id = parsedId;
    }

    await _isar.writeTxn(() async {
      await _isar.floorPlanModels.put(model);
    });
  }

  @override
  Future<void> deleteFloorPlan(String id) async {
    int parsedId = int.tryParse(id) ?? -1;
    if (parsedId > 0) {
      await _isar.writeTxn(() async {
        await _isar.floorPlanModels.delete(parsedId);
      });
    }
  }

  FloorPlan _mapToEntity(FloorPlanModel model) {
    return FloorPlan(
      id: model.id.toString(),
      name: model.name,
      sortOrder: model.sortOrder,
      isDefault: model.isDefault,
      canvasWidth: model.canvasWidth,
      canvasHeight: model.canvasHeight,
      bgColorHex: model.bgColorHex,
    );
  }
}
