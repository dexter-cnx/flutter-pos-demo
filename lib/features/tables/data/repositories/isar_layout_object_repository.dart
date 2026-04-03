import 'package:isar/isar.dart';

import '../../data/models/layout_object_model.dart';
import '../../domain/entities/layout_object.dart';
import '../../domain/repositories/layout_object_repository.dart';

class IsarLayoutObjectRepository implements LayoutObjectRepository {
  final Isar _isar;

  IsarLayoutObjectRepository(this._isar);

  @override
  Future<List<LayoutObject>> getObjectsByFloorPlan(String floorPlanId) async {
    int parsedId = int.tryParse(floorPlanId) ?? -1;
    final models = await _isar.layoutObjectModels
        .filter()
        .floorPlanIdEqualTo(parsedId)
        .findAll();
    return models.map(_mapToEntity).toList();
  }

  @override
  Future<void> saveLayoutObject(LayoutObject object) async {
    final model = _mapToModel(object);
    await _isar.writeTxn(() async {
      await _isar.layoutObjectModels.put(model);
    });
  }

  @override
  Future<void> saveMultipleLayoutObjects(List<LayoutObject> objects) async {
    final models = objects.map(_mapToModel).toList();
    await _isar.writeTxn(() async {
      await _isar.layoutObjectModels.putAll(models);
    });
  }

  @override
  Future<void> deleteLayoutObject(String id) async {
    int parsedId = int.tryParse(id) ?? -1;
    if (parsedId > 0) {
      await _isar.writeTxn(() async {
        await _isar.layoutObjectModels.delete(parsedId);
      });
    }
  }

  @override
  Future<void> clearObjectsInFloorPlan(String floorPlanId) async {
    int parsedId = int.tryParse(floorPlanId) ?? -1;
    if (parsedId > 0) {
      await _isar.writeTxn(() async {
        await _isar.layoutObjectModels
            .filter()
            .floorPlanIdEqualTo(parsedId)
            .deleteAll();
      });
    }
  }

  LayoutObject _mapToEntity(LayoutObjectModel model) {
    return LayoutObject(
      id: model.id.toString(),
      floorPlanId: model.floorPlanId.toString(),
      objectType: model.objectType,
      x: model.x,
      y: model.y,
      width: model.width,
      height: model.height,
      rotation: model.rotation,
      zIndex: model.zIndex,
      tableId: model.tableId?.toString(),
      colorHex: model.colorHex,
      label: model.label,
      icon: model.icon,
      isLocked: model.isLocked,
    );
  }

  LayoutObjectModel _mapToModel(LayoutObject entity) {
    int? parsedId = int.tryParse(entity.id);
    
    final model = LayoutObjectModel()
      ..floorPlanId = int.tryParse(entity.floorPlanId) ?? 0
      ..objectType = entity.objectType
      ..x = entity.x
      ..y = entity.y
      ..width = entity.width
      ..height = entity.height
      ..rotation = entity.rotation
      ..zIndex = entity.zIndex
      ..tableId = entity.tableId != null ? int.tryParse(entity.tableId!) : null
      ..colorHex = entity.colorHex
      ..label = entity.label
      ..icon = entity.icon
      ..isLocked = entity.isLocked;

    if (parsedId != null && parsedId > 0) {
      model.id = parsedId;
    }

    return model;
  }
}
