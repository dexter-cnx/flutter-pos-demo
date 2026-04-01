import 'package:flutter_test/flutter_test.dart';
import 'package:thai_pos_demo/features/checkout/presentation/services/promptpay_qr_service.dart';

void main() {
  group('PromptPayQrService', () {
    test('builds qr payload using tax id when available', () {
      final result = PromptPayQrService.build(
        storeName: 'Thai POS Demo',
        taxId: '0105559999999',
        phone: '0812345678',
        amount: 224.70,
      );

      expect(result.payload, startsWith('000201'));
      expect(result.payload, contains('A000000677010111'));
      expect(result.payload, contains('5406224.70'));
      expect(result.payload, matches(RegExp(r'6304[0-9A-F]{4}$')));
      expect(result.receiverLabel, 'Tax ID 0105559999999');
      expect(result.reference, hasLength(6));
    });

    test('falls back to normalized phone number when tax id is invalid', () {
      final result = PromptPayQrService.build(
        storeName: 'Thai POS Demo',
        taxId: 'invalid',
        phone: '081-234-5678',
        amount: 80,
      );

      expect(result.payload, contains('01130066812345678'));
      expect(result.receiverLabel, '0812345678');
      expect(result.payload, contains('540580.00'));
    });

    test('uses default receiver and omits amount when amount is zero', () {
      final result = PromptPayQrService.build(
        storeName: '***',
        taxId: '',
        phone: '',
        amount: 0,
      );

      expect(result.payload, isNot(contains('54')));
      expect(result.receiverLabel, '0812345678');
      expect(result.payload, contains('5913THAI POS DEMO'));
    });

    test('sanitizes merchant name and limits its length', () {
      final result = PromptPayQrService.build(
        storeName: 'My Super! Long Store Name ### 2026',
        taxId: '0105559999999',
        phone: '0812345678',
        amount: 10,
      );

      expect(result.payload, contains('MY SUPER LONG STORE NAME'));
      expect(result.payload, isNot(contains('#')));
    });
  });
}
