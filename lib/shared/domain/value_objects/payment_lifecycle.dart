/// Payment lifecycle states
enum PaymentLifecycle {
  pending,
  authorized,
  paid,
  failed,
  cancelled,
  refunded,
}

/// Validator for payment lifecycle transitions
class PaymentLifecycleValidator {
  /// Validates if a transition from [from] to [to] is legal
  static bool canTransition(PaymentLifecycle from, PaymentLifecycle to) {
    switch (from) {
      case PaymentLifecycle.pending:
        return to == PaymentLifecycle.authorized ||
            to == PaymentLifecycle.failed ||
            to == PaymentLifecycle.cancelled;
      case PaymentLifecycle.authorized:
        return to == PaymentLifecycle.paid ||
            to == PaymentLifecycle.failed ||
            to == PaymentLifecycle.cancelled;
      case PaymentLifecycle.paid:
        return to == PaymentLifecycle.refunded;
      case PaymentLifecycle.failed:
        return false; // Failed payments cannot transition further
      case PaymentLifecycle.cancelled:
        return false; // Cancelled payments cannot transition further;
      case PaymentLifecycle.refunded:
        return false; // Refunded payments cannot transition further
    }
  }

  /// Gets the next valid states from a given state
  static List<PaymentLifecycle> getNextValidStates(PaymentLifecycle state) {
    switch (state) {
      case PaymentLifecycle.pending:
        return [PaymentLifecycle.authorized, PaymentLifecycle.failed, PaymentLifecycle.cancelled];
      case PaymentLifecycle.authorized:
        return [PaymentLifecycle.paid, PaymentLifecycle.failed, PaymentLifecycle.cancelled];
      case PaymentLifecycle.paid:
        return [PaymentLifecycle.refunded];
      case PaymentLifecycle.failed:
        return [];
      case PaymentLifecycle.cancelled:
        return [];
      case PaymentLifecycle.refunded:
        return [];
    }
  }
}