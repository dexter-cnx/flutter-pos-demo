import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_profile.freezed.dart';
part 'app_profile.g.dart';

@freezed
class AppProfile with _$AppProfile {
  const factory AppProfile({
    required String activeModeId, // e.g., 'retail', 'restaurant'
    @Default(true) bool isOfflineFirst,
    @Default('th') String languageCode,
    @Default('THB') String currencyCode,
  }) = _AppProfile;

  factory AppProfile.fromJson(Map<String, dynamic> json) =>
      _$AppProfileFromJson(json);
}
