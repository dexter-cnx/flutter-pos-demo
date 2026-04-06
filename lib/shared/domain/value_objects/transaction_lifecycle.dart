/// Transaction lifecycle states
enum TransactionLifecycle {
  draft,
  pendingPayment,
  paid,
  completed,
  voided,
  refunded,
}

/// Validator for transaction lifecycle transitions
class TransactionLifecycleValidator {
  /// Validates if a transition from [from] to [to] is legal
  static bool canTransition(TransactionLifecycle from, TransactionLifecycle to) {
    switch (from) {
      case TransactionLifecycle.draft:
        return to == TransactionLifecycle.pendingPayment;
      case TransactionLifecycle.pendingPayment:
        return to == TransactionLifecycle.paid ||
            to == TransactionLifecycle.voided;
      case TransactionLifecycle.paid:
        return to == TransactionLifecycle.completed ||
            to == TransactionLifecycle.refunded;
      case TransactionLifecycle.completed:
        return to == TransactionLifecycle.voided;
      case TransactionLifecycle.voided:
        return false; // Voided transactions cannot transition further
      case TransactionLifecycle.refunded:
        return false; // Refunded transactions cannot transition further
    }
  }

  /// Gets the next valid states from a given state
  static List<TransactionLifecycle> getNextValidStates(
      TransactionLifecycle state) {
    switch (state) {
      case TransactionLifecycle.draft:
        return [TransactionLifecycle.pendingPayment];
      case TransactionLifecycle.pendingPayment:
        return [TransactionLifecycle.paid, TransactionLifecycle.voided];
      case TransactionLifecycle.paid:
        return [TransactionLifecycle.completed, TransactionLifecycle.refunded];
      case TransactionLifecycle.completed:
        return [TransactionLifecycle.voided];
      case TransactionLifecycle.voided:
        return [];
      case TransactionLifecycle.refunded:
        return [];
    }
  }
}