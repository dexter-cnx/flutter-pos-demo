import 'package:isar/isar.dart';

part 'promotion_model.g.dart';

@collection
class PromotionModel {
  Id id = Isar.autoIncrement;

  late String name;
  late String type;

  double? discountPercent;
  double? discountAmount;

  double? pointsRequired;
  double? redeemValue;

  double? minSpend;
  String? applicableTier;
  List<String> applicableDays = [];

  DateTime? startDate;
  DateTime? endDate;

  bool isActive = true;

  @Index()
  int sortOrder = 0;
}
