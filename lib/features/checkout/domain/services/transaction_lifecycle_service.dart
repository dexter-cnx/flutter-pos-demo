import '../../../../shared/domain/value_objects/transaction_lifecycle.dart';

/// Service for managing transaction lifecycle transitions
class TransactionLifecycleService {
  /// Transitions a transaction from [from] to [to] state
  /// Throws an exception if the transition is not valid
  static void transition(
    TransactionLifecycle from,
    TransactionLifecycle to,
  ) {
    if (!TransactionLifecycleValidator.canTransition(from, to)) {
      throw StateError(
        'Invalid transaction lifecycle transition: $from -> $to',
      );
    }
  }

  /// Gets the next valid states from a given state
  static List<TransactionLifecycle> getNextValidStates(
      TransactionLifecycle state) {
    return TransactionLifecycleValidator.getNextValidStates(state);
  }
}