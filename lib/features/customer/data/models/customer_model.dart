import 'package:isar/isar.dart';

part 'customer_model.g.dart';

@collection
class CustomerModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String phone;

  late String name;
  String? email;
  String? note;

  double points = 0;
  double totalSpent = 0;
  int visitCount = 0;

  String memberTier = 'regular';

  @Index()
  DateTime createdAt = DateTime.now();
  DateTime? lastVisitAt;

  bool isActive = true;
}
