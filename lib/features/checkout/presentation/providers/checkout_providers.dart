import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../features/payment/domain/entities/payment_method.dart';
import '../../../../features/payment/domain/entities/payment_status.dart';

final selectedPaymentMethodProvider = StateProvider<PaymentMethod>(
  (ref) => PaymentMethod.cash,
);

final cashReceivedProvider = StateProvider<double>((ref) => 0);

final paymentSimulationStateProvider = StateProvider<PaymentStatus>(
  (ref) => PaymentStatus.pending,
);
