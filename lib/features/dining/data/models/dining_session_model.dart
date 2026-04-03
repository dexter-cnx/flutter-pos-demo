import 'package:isar/isar.dart';
import '../../../orders/data/models/order_model.dart';

part 'dining_session_model.g.dart';

@collection
class DiningSessionModel {
  Id id = Isar.autoIncrement;

  @Index()
  late int tableId;
  late String tableName;

  int headcount = 1;

  @Index()
  bool isOpen = true;

  @Index()
  late DateTime startTime;
  DateTime? endTime;

  late double subtotal;
  late double taxAmount;
  late double total;

  List<OrderItemModel> items = [];
}
