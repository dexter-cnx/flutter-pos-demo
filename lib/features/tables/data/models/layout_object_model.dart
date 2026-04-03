import 'package:isar/isar.dart';

part 'layout_object_model.g.dart';

@collection
class LayoutObjectModel {
  Id id = Isar.autoIncrement;

  @Index()
  late int floorPlanId;

  late String objectType;

  late double x;
  late double y;
  late double width;
  late double height;

  double rotation = 0;
  int zIndex = 0;

  int? tableId;

  String? colorHex;
  String? label;
  String? icon;

  bool isLocked = false;
}
