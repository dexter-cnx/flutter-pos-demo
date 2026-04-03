import 'package:isar/isar.dart';

part 'app_settings_model.g.dart';

@collection
@Name('app_settings')
class AppSettingsModel {
  Id id = 1;

  late String storeName;
  late String storeAddress;
  late String storeTaxId;
  late String storePhone;
  late String receiptFooter;
  late int lowStockThreshold;

  @Name('active_mode_id')
  String activeModeId = 'retail';

  @Name('is_offline_first')
  bool isOfflineFirst = true;

  @Name('language_code')
  String languageCode = 'th';

  @Name('currency_code')
  String currencyCode = 'THB';
}
