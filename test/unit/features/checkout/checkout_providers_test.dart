import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thai_pos_demo/features/payment/domain/entities/payment_method.dart';
import 'package:thai_pos_demo/features/payment/domain/entities/payment_status.dart';
import 'package:thai_pos_demo/features/checkout/presentation/providers/checkout_providers.dart';

void main() {
  group('Checkout providers', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('selected payment method defaults to cash', () {
      expect(container.read(selectedPaymentMethodProvider), PaymentMethod.cash);
    });

    test('cash received defaults to zero', () {
      expect(container.read(cashReceivedProvider), 0);
    });

    test('payment simulation defaults to pending', () {
      expect(
        container.read(paymentSimulationStateProvider),
        PaymentStatus.pending,
      );
    });

    test('allows payment method updates', () {
      container.read(selectedPaymentMethodProvider.notifier).state =
          PaymentMethod.qr;

      expect(container.read(selectedPaymentMethodProvider), PaymentMethod.qr);
    });

    test('allows simulation state updates', () {
      final notifier = container.read(paymentSimulationStateProvider.notifier);
      notifier.state = PaymentStatus.processing;
      notifier.state = PaymentStatus.approved;

      expect(
        container.read(paymentSimulationStateProvider),
        PaymentStatus.approved,
      );
    });
  });
}
