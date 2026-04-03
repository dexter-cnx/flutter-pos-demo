import 'package:thai_pos_demo/features/printer/data/datasources/bluetooth_printer_datasource.dart';

class ThaiThermalPrinter {
  final BluetoothPrinterDatasource _datasource;

  ThaiThermalPrinter(this._datasource);

  /// พิมพ์ข้อความภาษาไทยด้วย Encoding TIS-620
  Future<void> printThaiText(String text, {
    int fontSize = 1,
    bool bold = false,
    int align = 0, // 0: left, 1: center, 2: right
  }) async {
    // 1. Set Thai encoding (Code Page TIS-620)
    // ESC t n (n = 21 for TIS-620 in many standard printers)
    await _datasource.writeBytes([0x1B, 0x74, 0x15]);

    // 2. Set alignment
    await _datasource.writeBytes([0x1B, 0x61, align]);

    // 3. Set bold
    if (bold) {
      await _datasource.writeBytes([0x1B, 0x45, 0x01]);
    }

    // 4. Print text
    final encoded = _encodeThaiText(text);
    await _datasource.writeBytes(encoded);
    await _datasource.writeBytes([0x0A]); // New line

    // 5. Reset bold
    if (bold) {
      await _datasource.writeBytes([0x1B, 0x45, 0x00]);
    }
  }

  List<int> _encodeThaiText(String text) {
    // Convert UTF-8 Thai characters to TIS-620 byte sequence
    // Thai Unicode range: 0x0E01 (ก) to 0x0E5B (๚)
    // TIS-620 mapping: Unicode - 0x0E00 + 0xA0
    
    final bytes = <int>[];
    for (int i = 0; i < text.length; i++) {
        int char = text.codeUnitAt(i);
        if (char >= 0x0E01 && char <= 0x0E5B) {
            // Thai character
            bytes.add(char - 0x0E00 + 0xA0);
        } else if (char < 128) {
            // ASCII
            bytes.add(char);
        } else {
            // Other characters
            bytes.add(0x3F); // '?' for unknown
        }
    }
    return bytes;
  }
}
