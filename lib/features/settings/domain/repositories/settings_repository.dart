import '../../../../shared/domain/entities/app_profile.dart';
import '../entities/store_profile.dart';

abstract class SettingsRepository {
  Future<StoreProfile> getStoreProfile();
  Future<void> saveStoreProfile(StoreProfile profile);

  Future<AppProfile> getAppProfile();
  Future<void> saveAppProfile(AppProfile profile);
}
