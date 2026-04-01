import 'package:flutter_riverpod/flutter_riverpod.dart';

enum PaymentMethod { cash, qr, card }

final selectedPaymentMethodProvider =
    StateProvider<PaymentMethod>((ref) => PaymentMethod.cash);

final cashReceivedProvider = StateProvider<double>((ref) => 0);
