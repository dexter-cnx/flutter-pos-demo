import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/printer_device.dart';

/// Persists and loads the user's default printer using shared_preferences.
class PrinterPrefsDatasource {
  static const _keyAddress = 'printer_default_address';
  static const _keyName = 'printer_default_name';

  Future<void> saveDefaultPrinter({
    required String address,
    required String name,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyAddress, address);
    await prefs.setString(_keyName, name);
  }

  Future<PrinterDevice?> loadDefaultPrinter() async {
    final prefs = await SharedPreferences.getInstance();
    final address = prefs.getString(_keyAddress);
    final name = prefs.getString(_keyName);
    if (address == null || name == null) return null;
    return PrinterDevice(address: address, name: name, isDefault: true);
  }

  Future<void> clearDefaultPrinter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyAddress);
    await prefs.remove(_keyName);
  }
}
