/// Receipt lifecycle states
enum ReceiptLifecycle {
  notGenerated,
  generated,
  printed,
  reprinted,
}

/// Validator for receipt lifecycle transitions
class ReceiptLifecycleValidator {
  /// Validates if a transition from [from] to [to] is legal
  static bool canTransition(ReceiptLifecycle from, ReceiptLifecycle to) {
    switch (from) {
      case ReceiptLifecycle.notGenerated:
        return to == ReceiptLifecycle.generated;
      case ReceiptLifecycle.generated:
        return to == ReceiptLifecycle.printed ||
            to == ReceiptLifecycle.reprinted;
      case ReceiptLifecycle.printed:
        return to == ReceiptLifecycle.reprinted;
      case ReceiptLifecycle.reprinted:
        return false; // Reprinted receipts cannot transition further
    }
  }

  /// Gets the next valid states from a given state
  static List<ReceiptLifecycle> getNextValidStates(ReceiptLifecycle state) {
    switch (state) {
      case ReceiptLifecycle.notGenerated:
        return [ReceiptLifecycle.generated];
      case ReceiptLifecycle.generated:
        return [ReceiptLifecycle.printed, ReceiptLifecycle.reprinted];
      case ReceiptLifecycle.printed:
        return [ReceiptLifecycle.reprinted];
      case ReceiptLifecycle.reprinted:
        return [];
    }
  }
}