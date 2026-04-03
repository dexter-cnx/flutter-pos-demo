import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';

import '../../domain/entities/printer_device.dart';
import '../../domain/repositories/printer_repository.dart';
import '../datasources/bluetooth_printer_datasource.dart';
import '../datasources/printer_prefs_datasource.dart';

class PrinterRepositoryImpl implements PrinterRepository {
  PrinterRepositoryImpl({
    required BluetoothPrinterDatasource bluetoothDatasource,
    required PrinterPrefsDatasource prefsDatasource,
  })  : _bt = bluetoothDatasource,
        _prefs = prefsDatasource;

  final BluetoothPrinterDatasource _bt;
  final PrinterPrefsDatasource _prefs;

  PrinterDevice? _connectedDevice;

  @override
  Future<List<PrinterDevice>> getPairedPrinters() async {
    final devices = await _bt.getPairedDevices();
    final defaultDevice = await _prefs.loadDefaultPrinter();
    return devices.map((d) {
      final isDefault = d.address == defaultDevice?.address;
      final isConnected = d.address == _connectedDevice?.address;
      return d.copyWith(isDefault: isDefault, isConnected: isConnected);
    }).toList();
  }

  @override
  Future<void> connect(String address) async {
    final success = await _bt.connect(address);
    if (!success) {
      throw Exception('Failed to connect to printer at $address');
    }
    // Update connected device reference
    final devices = await _bt.getPairedDevices();
    _connectedDevice = devices.where((d) => d.address == address).firstOrNull;
  }

  @override
  Future<void> disconnect() async {
    await _bt.disconnect();
    _connectedDevice = null;
  }

  @override
  Future<void> testPrint() async {
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);
    final bytes = <int>[
      ...generator.text(
        'Test Print',
        styles: const PosStyles(bold: true, align: PosAlign.center),
      ),
      ...generator.text('Printer is working!', styles: const PosStyles(align: PosAlign.center)),
      ...generator.feed(3),
      ...generator.cut(),
    ];
    await printBytes(bytes);
  }

  @override
  Future<void> printBytes(List<int> bytes) async {
    final connected = await _bt.isConnected;
    if (!connected) {
      throw Exception('No printer connected');
    }
    final success = await _bt.writeBytes(bytes);
    if (!success) {
      throw Exception('Failed to send data to printer');
    }
  }

  @override
  Future<void> saveDefaultPrinter({
    required String address,
    required String name,
  }) async {
    await _prefs.saveDefaultPrinter(address: address, name: name);
  }

  @override
  Future<PrinterDevice?> loadDefaultPrinter() async {
    return _prefs.loadDefaultPrinter();
  }
}
