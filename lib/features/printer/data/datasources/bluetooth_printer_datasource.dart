import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

import '../../domain/entities/printer_device.dart';

/// Wraps [PrintBluetoothThermal] to expose only clean app-facing models.
/// No other layer should import the plugin directly.
class BluetoothPrinterDatasource {
  /// Returns all paired Bluetooth devices.
  Future<List<PrinterDevice>> getPairedDevices() async {
    try {
      final devices = await PrintBluetoothThermal.pairedBluetooths;
      return devices
          .map(
            (d) => PrinterDevice(
              address: d.macAdress, // note: typo is in the plugin
              name: d.name,
            ),
          )
          .toList();
    } catch (_) {
      return [];
    }
  }

  /// Connects to the device with the given [address].
  /// Returns true if connected successfully.
  Future<bool> connect(String address) async {
    return PrintBluetoothThermal.connect(macPrinterAddress: address);
  }

  /// Disconnects the current connection.
  Future<bool> disconnect() async {
    return PrintBluetoothThermal.disconnect;
  }

  /// Returns true if a device is currently connected.
  Future<bool> get isConnected async {
    return PrintBluetoothThermal.connectionStatus;
  }

  /// Writes raw ESC/POS [bytes] to the connected printer.
  Future<bool> writeBytes(List<int> bytes) async {
    return PrintBluetoothThermal.writeBytes(bytes);
  }
}
