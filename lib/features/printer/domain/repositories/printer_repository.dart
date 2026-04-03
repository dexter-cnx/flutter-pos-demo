import '../entities/printer_device.dart';

/// Abstract contract for all printer operations.
/// The data layer implements this; widgets and use-cases must not bypass it.
abstract class PrinterRepository {
  /// Returns all Bluetooth-paired devices on the current device.
  Future<List<PrinterDevice>> getPairedPrinters();

  /// Connects to the printer identified by [address].
  Future<void> connect(String address);

  /// Disconnects the currently active printer connection.
  Future<void> disconnect();

  /// Sends a short test print to verify the connection is working.
  Future<void> testPrint();

  /// Writes raw ESC/POS [bytes] to the connected printer.
  Future<void> printBytes(List<int> bytes);

  /// Persists [address] and [name] as the default printer preference.
  Future<void> saveDefaultPrinter({
    required String address,
    required String name,
  });

  /// Loads the previously saved default printer, or null if none.
  Future<PrinterDevice?> loadDefaultPrinter();
}
