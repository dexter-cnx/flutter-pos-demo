import '../../../../app/bootstrap.dart';
import '../../domain/entities/store_profile.dart';
import '../../domain/repositories/settings_repository.dart';
import '../models/app_settings_model.dart';

class LocalSettingsRepository implements SettingsRepository {
  static const _storeNameKey = 'web_store_name_v1';
  static const _storeAddressKey = 'web_store_address_v1';
  static const _storeTaxIdKey = 'web_store_tax_id_v1';
  static const _storePhoneKey = 'web_store_phone_v1';
  static const _receiptFooterKey = 'web_receipt_footer_v1';
  static const _lowStockThresholdKey = 'web_low_stock_threshold_v1';

  @override
  Future<StoreProfile> getStoreProfile() async {
    final database = isar;
    if (database == null) {
      final prefs = sharedPreferences;
      if (prefs != null) {
        return StoreProfile(
          storeName:
              prefs.getString(_storeNameKey) ?? _fallbackProfile.storeName,
          storeAddress: prefs.getString(_storeAddressKey) ??
              _fallbackProfile.storeAddress,
          storeTaxId:
              prefs.getString(_storeTaxIdKey) ?? _fallbackProfile.storeTaxId,
          storePhone:
              prefs.getString(_storePhoneKey) ?? _fallbackProfile.storePhone,
          receiptFooter: prefs.getString(_receiptFooterKey) ??
              _fallbackProfile.receiptFooter,
          lowStockThreshold: prefs.getInt(_lowStockThresholdKey) ??
              _fallbackProfile.lowStockThreshold,
        );
      }
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
    if (database == null) {
      final prefs = sharedPreferences;
      if (prefs == null) return;
      await prefs.setString(_storeNameKey, profile.storeName);
      await prefs.setString(_storeAddressKey, profile.storeAddress);
      await prefs.setString(_storeTaxIdKey, profile.storeTaxId);
      await prefs.setString(_storePhoneKey, profile.storePhone);
      await prefs.setString(_receiptFooterKey, profile.receiptFooter);
      await prefs.setInt(_lowStockThresholdKey, profile.lowStockThreshold);
      return;
    }

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
    storeName: 'Flutter POS Demo',
    storeAddress: '99 ถนนโชตนา อำเภอเมือง จังหวัดเชียงใหม่ 50000',
    storeTaxId: '0105559999999',
    storePhone: '02-333-4444',
    receiptFooter: 'ขอบคุณที่อุดหนุน แล้วพบกันใหม่',
    lowStockThreshold: 5,
  );
}
