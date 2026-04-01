import 'package:isar/isar.dart';

part 'category_model.g.dart';

@collection
@Name('categories')
class CategoryModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String name;

  late int sortOrder;
}
