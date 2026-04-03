/// Represents a Bluetooth-paired printer device discovered by the app.
class PrinterDevice {
  const PrinterDevice({
    required this.address,
    required this.name,
    this.isConnected = false,
    this.isDefault = false,
  });

  final String address;
  final String name;
  final bool isConnected;
  final bool isDefault;

  PrinterDevice copyWith({
    bool? isConnected,
    bool? isDefault,
  }) {
    return PrinterDevice(
      address: address,
      name: name,
      isConnected: isConnected ?? this.isConnected,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is PrinterDevice && other.address == address;

  @override
  int get hashCode => address.hashCode;
}
