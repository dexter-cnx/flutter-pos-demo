import 'package:easy_localization/easy_localization.dart';
import '../../../orders/data/models/order_model.dart';
import '../../data/models/receipt_template_model.dart';
import './thai_thermal_printer.dart';

class KitchenTicketService {
  final ThaiThermalPrinter _printer;

  KitchenTicketService(this._printer);

  Future<void> printTicket({
    required OrderModel order,
    required ReceiptTemplateModel template,
    String? employeeName,
  }) async {
    // 1. Initialize Thai encoding & alignment
    // (thai_thermal_printer handles initial ESC/POS setup in each printThaiText call)

    // 2. Header
    await _printer.printThaiText(
      '🍳 KITCHEN TICKET',
      align: 1, // center
      bold: true,
    );

    if (template.showTableInfo && order.tableName != null) {
      await _printer.printThaiText(
        '${'pos.nav.restaurant_tables'.tr()}: ${order.tableName}',
        align: 0,
        bold: true,
      );
    }

    final timeStr = DateFormat('HH:mm:ss').format(order.createdAt);
    await _printer.printThaiText('เวลา: $timeStr', align: 0);
    
    if (employeeName != null) {
      await _printer.printThaiText('พนักงาน: $employeeName', align: 0);
    }

    await _printer.printThaiText('--------------------------------', align: 1);

    // 3. Items
    for (final item in order.items) {
      // Print main item
      await _printer.printThaiText(
        '${item.quantity}x ${item.productName}',
        align: 0,
        bold: true,
      );

      // Print note if exists
      if (item.note != null && item.note!.isNotEmpty) {
        await _printer.printThaiText(
          '   📝 ${item.note}',
          align: 0,
          bold: false,
        );
      }
      
      // Small spacing between items
      // await _datasource.writeBytes([0x0A]); // Optional tiny spacing
    }

    await _printer.printThaiText('--------------------------------', align: 1);

    // 4. Feed & Cut (Handled by sending feed commands manually if service doesn't have a specific method)
    // For now, let's just add a few blank lines
    await _printer.printThaiText('', align: 0);
    await _printer.printThaiText('', align: 0);
    await _printer.printThaiText('', align: 0);
  }
}
