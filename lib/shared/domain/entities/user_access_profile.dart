import 'package:freezed_annotation/freezed_annotation.dart';
import 'app_role.dart';

part 'user_access_profile.freezed.dart';
part 'user_access_profile.g.dart';

@freezed
class UserAccessProfile with _$UserAccessProfile {
  const factory UserAccessProfile({
    @Default('anonymous') String userId,
    required AppRole role,
    @Default('Unknown User') String displayName,
    @Default(true) bool isActive,
  }) = _UserAccessProfile;

  factory UserAccessProfile.fromJson(Map<String, dynamic> json) =>
      _$UserAccessProfileFromJson(json);

  const UserAccessProfile._();

  static UserAccessProfile anonymous() =>
      const UserAccessProfile(role: AppRole.cashier, isActive: false);
}
