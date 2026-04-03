import 'package:isar/isar.dart';
import '../../../orders/data/models/order_model.dart';

part 'dining_session_model.g.dart';

@collection
class DiningSessionModel {
  Id id = Isar.autoIncrement;

  @Index()
  late int tableId;
  late String tableName;

  // === Headcount (แยก Adult/Child) ===
  int headcount = 1; // Keep for backward compatibility or simple use case
  int adultCount = 1;
  int childCount = 0;
  int elderlyCount = 0;

  @ignore
  int get totalHeadcount => adultCount + childCount + elderlyCount;

  // === Buffet Tier (nullable ถ้าสั่ง a la carte) ===
  int? buffetTierId;
  String? buffetTierName;
  double buffetAdultPrice = 0;
  double buffetChildPrice = 0;

  // === Session Timing ===
  @Index()
  bool isOpen = true;

  @Index()
  late DateTime startTime;
  DateTime? endTime;
  int? timeLimitMinutes; // จาก Tier

  late double subtotal;
  late double taxAmount;
  late double total;

  List<OrderItemModel> items = [];
}
