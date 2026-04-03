import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app/bootstrap.dart';
import '../../domain/entities/floor_plan.dart';
import '../../domain/entities/layout_object.dart';
import '../../domain/repositories/floor_plan_repository.dart';
import '../../domain/repositories/layout_object_repository.dart';
import '../../data/repositories/isar_floor_plan_repository.dart';
import '../../data/repositories/isar_layout_object_repository.dart';

part 'floor_plan_providers.g.dart';

@Riverpod(keepAlive: true)
FloorPlanRepository floorPlanRepository(FloorPlanRepositoryRef ref) {
  return IsarFloorPlanRepository(isar!);
}

@Riverpod(keepAlive: true)
LayoutObjectRepository layoutObjectRepository(LayoutObjectRepositoryRef ref) {
  return IsarLayoutObjectRepository(isar!);
}

@riverpod
class FloorPlans extends _$FloorPlans {
  @override
  Future<List<FloorPlan>> build() async {
    return ref.watch(floorPlanRepositoryProvider).getAllFloorPlans();
  }

  Future<void> addFloorPlan(FloorPlan plan) async {
    await ref.read(floorPlanRepositoryProvider).saveFloorPlan(plan);
    ref.invalidateSelf();
  }

  Future<void> deleteFloorPlan(String id) async {
    await ref.read(floorPlanRepositoryProvider).deleteFloorPlan(id);
    await ref.read(layoutObjectRepositoryProvider).clearObjectsInFloorPlan(id);
    ref.invalidateSelf();
  }
}

@riverpod
class LayoutObjects extends _$LayoutObjects {
  @override
  Future<List<LayoutObject>> build(String floorPlanId) async {
    return ref.watch(layoutObjectRepositoryProvider).getObjectsByFloorPlan(floorPlanId);
  }

  Future<void> saveObject(LayoutObject obj) async {
    await ref.read(layoutObjectRepositoryProvider).saveLayoutObject(obj);
    ref.invalidateSelf();
  }

  Future<void> updateObjects(List<LayoutObject> objects) async {
    await ref.read(layoutObjectRepositoryProvider).saveMultipleLayoutObjects(objects);
    ref.invalidateSelf();
  }

  Future<void> deleteObject(String id) async {
    await ref.read(layoutObjectRepositoryProvider).deleteLayoutObject(id);
    ref.invalidateSelf();
  }
}

@riverpod
class FloorPlanViewToggle extends _$FloorPlanViewToggle {
  @override
  bool build() => true;

  void toggle() => state = !state;
}

@riverpod
class ActiveFloorPlanId extends _$ActiveFloorPlanId {
  @override
  String? build() {
    final plans = ref.watch(floorPlansProvider).valueOrNull;
    if (plans != null && plans.isNotEmpty) {
      return plans.first.id;
    }
    return null;
  }

  void set(String id) => state = id;
}
