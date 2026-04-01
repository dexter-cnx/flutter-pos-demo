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
}
