import '../entities/floor_plan.dart';

abstract class FloorPlanRepository {
  Future<List<FloorPlan>> getAllFloorPlans();
  Future<FloorPlan?> getFloorPlanById(String id);
  Future<void> saveFloorPlan(FloorPlan floorPlan);
  Future<void> deleteFloorPlan(String id);
}
