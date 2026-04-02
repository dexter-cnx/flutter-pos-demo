import 'package:flutter_riverpod/flutter_riverpod.dart';

enum PaymentMethod { cash, qr, card }

enum PaymentSimulationState { idle, processing, approved }

final selectedPaymentMethodProvider = StateProvider<PaymentMethod>(
  (ref) => PaymentMethod.cash,
);

final cashReceivedProvider = StateProvider<double>((ref) => 0);

final paymentSimulationStateProvider = StateProvider<PaymentSimulationState>(
  (ref) => PaymentSimulationState.idle,
);
