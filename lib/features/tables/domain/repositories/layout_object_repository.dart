import '../entities/layout_object.dart';

abstract class LayoutObjectRepository {
  Future<List<LayoutObject>> getObjectsByFloorPlan(String floorPlanId);
  Future<void> saveLayoutObject(LayoutObject object);
  Future<void> saveMultipleLayoutObjects(List<LayoutObject> objects);
  Future<void> deleteLayoutObject(String id);
  Future<void> clearObjectsInFloorPlan(String floorPlanId);
}
