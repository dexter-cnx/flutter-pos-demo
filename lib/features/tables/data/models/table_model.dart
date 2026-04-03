import 'package:isar/isar.dart';

part 'table_model.g.dart';

@collection
class TableModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String name;

  String? floor;

  @Index()
  late String status; // 'available', 'occupied', 'cleaning'

  int? currentSessionId;

  late int capacity;

  @Index()
  DateTime? updatedAt;
}
