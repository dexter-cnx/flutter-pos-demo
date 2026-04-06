import '../../../../shared/domain/value_objects/receipt_lifecycle.dart';

/// Service for managing receipt lifecycle transitions
class ReceiptLifecycleService {
  /// Transitions a receipt from [from] to [to] state
  /// Throws an exception if the transition is not valid
  static void transition(
    ReceiptLifecycle from,
    ReceiptLifecycle to,
  ) {
    if (!ReceiptLifecycleValidator.canTransition(from, to)) {
      throw StateError(
        'Invalid receipt lifecycle transition: $from -> $to',
      );
    }
  }

  /// Gets the next valid states from a given state
  static List<ReceiptLifecycle> getNextValidStates(ReceiptLifecycle state) {
    return ReceiptLifecycleValidator.getNextValidStates(state);
  }
}