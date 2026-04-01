import 'package:isar/isar.dart';

part 'user_model.g.dart';

@collection
@Name('users')
class UserModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String username;

  late String pin;

  late String displayName;

  late String role; // 'admin' or 'staff'
}
