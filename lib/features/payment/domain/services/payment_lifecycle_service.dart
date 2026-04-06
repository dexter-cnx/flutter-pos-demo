import '../../../../shared/domain/value_objects/payment_lifecycle.dart';

/// Service for managing payment lifecycle transitions
class PaymentLifecycleService {
  /// Transitions a payment from [from] to [to] state
  /// Throws an exception if the transition is not valid
  static void transition(
    PaymentLifecycle from,
    PaymentLifecycle to,
  ) {
    if (!PaymentLifecycleValidator.canTransition(from, to)) {
      throw StateError(
        'Invalid payment lifecycle transition: $from -> $to',
      );
    }
  }

  /// Gets the next valid states from a given state
  static List<PaymentLifecycle> getNextValidStates(PaymentLifecycle state) {
    return PaymentLifecycleValidator.getNextValidStates(state);
  }
}