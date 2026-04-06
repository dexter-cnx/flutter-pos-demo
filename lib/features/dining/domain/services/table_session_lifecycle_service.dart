import '../../../../shared/domain/value_objects/table_session_lifecycle.dart';

/// Service for managing table session lifecycle transitions
class TableSessionLifecycleService {
  /// Transitions a table session from [from] to [to] state
  /// Throws an exception if the transition is not valid
  static void transition(
    TableSessionLifecycle from,
    TableSessionLifecycle to,
  ) {
    if (!TableSessionLifecycleValidator.canTransition(from, to)) {
      throw StateError(
        'Invalid table session lifecycle transition: $from -> $to',
      );
    }
  }

  /// Gets the next valid states from a given state
  static List<TableSessionLifecycle> getNextValidStates(
      TableSessionLifecycle state) {
    return TableSessionLifecycleValidator.getNextValidStates(state);
  }
}