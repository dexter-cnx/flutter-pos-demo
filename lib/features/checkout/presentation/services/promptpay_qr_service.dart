class PromptPayQrData {
  const PromptPayQrData({
    required this.payload,
    required this.receiverLabel,
    required this.reference,
  });

  final String payload;
  final String receiverLabel;
  final String reference;
}

class PromptPayQrService {
  const PromptPayQrService._();

  static PromptPayQrData build({
    required String storeName,
    required String taxId,
    required String phone,
    required double amount,
  }) {
    final sanitizedTaxId = _digitsOnly(taxId);
    final sanitizedPhone = _digitsOnly(phone);
    final receiver = _resolveReceiverId(
      taxId: sanitizedTaxId,
      phone: sanitizedPhone,
    );
    final merchantAccountInfo = _field(
      '29',
      _field('00', 'A000000677010111') +
          _field(receiver.isPhone ? '01' : '02', receiver.value),
    );
    final normalizedAmount = amount <= 0 ? '' : amount.toStringAsFixed(2);
    final payload = StringBuffer()
      ..write(_field('00', '01'))
      ..write(_field('01', normalizedAmount.isEmpty ? '11' : '12'))
      ..write(merchantAccountInfo)
      ..write(_field('52', '0000'))
      ..write(_field('53', '764'));

    if (normalizedAmount.isNotEmpty) {
      payload.write(_field('54', normalizedAmount));
    }

    payload
      ..write(_field('58', 'TH'))
      ..write(_field('59', _merchantName(storeName)))
      ..write(_field('60', 'BANGKOK'))
      ..write('6304');

    final crc = _crc16Ccitt(payload.toString());
    final finalPayload = '${payload.toString()}$crc';

    return PromptPayQrData(
      payload: finalPayload,
      receiverLabel: receiver.label,
      reference: _buildReference(finalPayload),
    );
  }

  static _ReceiverId _resolveReceiverId({
    required String taxId,
    required String phone,
  }) {
    if (taxId.length == 13) {
      return _ReceiverId(
        value: taxId,
        label: 'Tax ID $taxId',
        isPhone: false,
      );
    }

    if (phone.length == 10 && phone.startsWith('0')) {
      final normalized = '0066${phone.substring(1)}';
      return _ReceiverId(
        value: normalized,
        label: phone,
        isPhone: true,
      );
    }

    const fallbackPhone = '0812345678';
    return const _ReceiverId(
      value: '0066812345678',
      label: fallbackPhone,
      isPhone: true,
    );
  }

  static String _merchantName(String storeName) {
    final sanitized =
        storeName.toUpperCase().replaceAll(RegExp(r'[^A-Z0-9 ]'), '').trim();
    if (sanitized.isEmpty) return 'THAI POS DEMO';
    return sanitized.length > 25 ? sanitized.substring(0, 25) : sanitized;
  }

  static String _buildReference(String payload) {
    final checksum = payload.codeUnits.fold<int>(
      0,
      (sum, code) => (sum + code) % 1000000,
    );
    return checksum.toString().padLeft(6, '0');
  }

  static String _digitsOnly(String value) =>
      value.replaceAll(RegExp(r'\D'), '');

  static String _field(String id, String value) {
    final length = value.length.toString().padLeft(2, '0');
    return '$id$length$value';
  }

  static String _crc16Ccitt(String payload) {
    const polynomial = 0x1021;
    var crc = 0xFFFF;

    for (final codeUnit in payload.codeUnits) {
      crc ^= codeUnit << 8;
      for (var i = 0; i < 8; i++) {
        if ((crc & 0x8000) != 0) {
          crc = ((crc << 1) ^ polynomial) & 0xFFFF;
        } else {
          crc = (crc << 1) & 0xFFFF;
        }
      }
    }

    return crc.toRadixString(16).toUpperCase().padLeft(4, '0');
  }
}

class _ReceiverId {
  const _ReceiverId({
    required this.value,
    required this.label,
    required this.isPhone,
  });

  final String value;
  final String label;
  final bool isPhone;
}
