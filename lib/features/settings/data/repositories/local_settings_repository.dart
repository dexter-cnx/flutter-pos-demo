import '../../../../app/bootstrap.dart';
import '../../domain/entities/store_profile.dart';
import '../../domain/repositories/settings_repository.dart';
import '../models/app_settings_model.dart';

class LocalSettingsRepository implements SettingsRepository {
  @override
  Future<StoreProfile> getStoreProfile() async {
    final database = isar;
    if (database == null) {
      return _fallbackProfile;
    }

    final settings = await database.appSettingsModels.get(1);
    if (settings == null) {
      return _fallbackProfile;
    }

    return _map(settings);
  }

  @override
  Future<void> saveStoreProfile(StoreProfile profile) async {
    final database = isar;
    if (database == null) return;

    await database.writeTxn(() async {
      final settings =
          await database.appSettingsModels.get(1) ?? AppSettingsModel();
      settings
        ..id = 1
        ..storeName = profile.storeName
        ..storeAddress = profile.storeAddress
        ..storeTaxId = profile.storeTaxId
        ..storePhone = profile.storePhone
        ..receiptFooter = profile.receiptFooter
        ..lowStockThreshold = profile.lowStockThreshold;
      await database.appSettingsModels.put(settings);
    });
  }

  StoreProfile _map(AppSettingsModel model) {
    return StoreProfile(
      storeName: model.storeName,
      storeAddress: model.storeAddress,
      storeTaxId: model.storeTaxId,
      storePhone: model.storePhone,
      receiptFooter: model.receiptFooter,
      lowStockThreshold: model.lowStockThreshold,
    );
  }

  static const _fallbackProfile = StoreProfile(
    storeName: 'Thai POS Demo',
    storeAddress: '99 ถนนสุขุมวิท กรุงเทพฯ 10110',
    storeTaxId: '0105559999999',
    storePhone: '02-123-4567',
    receiptFooter: 'ขอบคุณที่อุดหนุน แล้วพบกันใหม่',
    lowStockThreshold: 5,
  );
}
