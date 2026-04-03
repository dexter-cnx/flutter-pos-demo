import 'package:isar/isar.dart';

part 'buffet_tier_model.g.dart';

@collection
class BuffetTierModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String name;

  late double adultPrice;
  late double childPrice;
  double elderlyDiscount = 0;

  int? timeLimitMinutes;

  List<String> excludedCategoryIds = [];

  String? colorHex;

  bool isActive = true;

  @Index()
  int sortOrder = 0;
}
