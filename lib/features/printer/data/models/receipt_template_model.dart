import 'package:isar/isar.dart';

part 'receipt_template_model.g.dart';

@collection
class ReceiptTemplateModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String name;            // 'Default', 'Buffet', 'Kitchen'

  late String type;            // 'receipt', 'kitchen_ticket'

  // === Header ===
  String? storeName;
  String? storeAddress;
  String? storePhone;
  String? taxId;               // เลขประจำตัวผู้เสียภาษี
  String? logoPath;            // path ของรูป Logo

  // === Content Options ===
  bool showItemSku = false;
  bool showTaxBreakdown = true;
  bool showPaymentMethod = true;
  bool showCustomerInfo = false;
  bool showTableInfo = true;    // สำหรับ Restaurant
  bool showQrCode = false;      // QR สำหรับ PromptPay / Link

  // === Footer ===
  String? footerText;          // 'ขอบคุณที่ใช้บริการ'
  String? footerText2;         // 'www.myrestaurant.com'

  // === Paper & Font ===
  int paperWidth = 58;         // 58mm or 80mm
  String fontFamily = 'monospace';
  int fontSize = 12;

  bool isDefault = false;
}
