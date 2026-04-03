import 'package:isar/isar.dart';

part 'floor_plan_model.g.dart';

@collection
class FloorPlanModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String name;

  int sortOrder = 0;
  bool isDefault = false;

  double canvasWidth = 1200;
  double canvasHeight = 800;
  String bgColorHex = '#F5F5F5';
}
