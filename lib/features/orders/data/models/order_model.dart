import 'package:isar/isar.dart';

part 'order_model.g.dart';

@embedded
class OrderItemModel {
  late String productName;
  late String sku;
  late int quantity;
  late double unitPrice;
  late double lineTotal;
  String? note;
}

@collection
@Name('orders')
class OrderModel {
  Id id = Isar.autoIncrement;

  @Index()
  late DateTime createdAt;

  late String paymentMethod;
  late double subtotal;
  late double taxAmount;
  late double total;
  late double receivedAmount;
  late double changeAmount;
  
  late String businessMode; // 'retail' or 'restaurant'
  
  // Restaurant specific fields
  String? tableId;
  String? tableName;
  int? headcount;

  late List<OrderItemModel> items;

  // Loyalty & Discount
  int? customerId;
  String? customerName;
  String? customerPhone;

  double discountAmount = 0;
  String? promotionId;
  String? promotionName;

  double pointsEarned = 0;
  double pointsRedeemed = 0;
}
