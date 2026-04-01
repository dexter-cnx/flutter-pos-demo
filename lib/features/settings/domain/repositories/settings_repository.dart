import '../entities/store_profile.dart';

abstract class SettingsRepository {
  Future<StoreProfile> getStoreProfile();
  Future<void> saveStoreProfile(StoreProfile profile);
}
