import 'package:isar/isar.dart';

part 'table_model.g.dart';

@collection
class TableModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String name;

  String? floor; // Legacy string-based or unassigned
  int? floorPlanId; // Link to FloorPlanModel

  @Index()
  late String status; // 'available', 'occupied', 'cleaning'

  int? currentSessionId;

  late int capacity;

  // === Visual Position ===
  String shape = 'square'; // 'square', 'round', 'long'

  @Index()
  DateTime? updatedAt;
}
