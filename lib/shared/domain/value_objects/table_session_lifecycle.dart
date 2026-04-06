/// Restaurant table session lifecycle states
enum TableSessionLifecycle {
  open,
  active,
  checkoutPending,
  closed,
  cancelled,
}

/// Validator for table session lifecycle transitions
class TableSessionLifecycleValidator {
  /// Validates if a transition from [from] to [to] is legal
  static bool canTransition(TableSessionLifecycle from, TableSessionLifecycle to) {
    switch (from) {
      case TableSessionLifecycle.open:
        return to == TableSessionLifecycle.active ||
            to == TableSessionLifecycle.cancelled;
      case TableSessionLifecycle.active:
        return to == TableSessionLifecycle.checkoutPending ||
            to == TableSessionLifecycle.cancelled;
      case TableSessionLifecycle.checkoutPending:
        return to == TableSessionLifecycle.closed;
      case TableSessionLifecycle.closed:
        return false; // Closed sessions cannot transition further
      case TableSessionLifecycle.cancelled:
        return false; // Cancelled sessions cannot transition further
    }
  }

  /// Gets the next valid states from a given state
  static List<TableSessionLifecycle> getNextValidStates(TableSessionLifecycle state) {
    switch (state) {
      case TableSessionLifecycle.open:
        return [TableSessionLifecycle.active, TableSessionLifecycle.cancelled];
      case TableSessionLifecycle.active:
        return [TableSessionLifecycle.checkoutPending, TableSessionLifecycle.cancelled];
      case TableSessionLifecycle.checkoutPending:
        return [TableSessionLifecycle.closed];
      case TableSessionLifecycle.closed:
        return [];
      case TableSessionLifecycle.cancelled:
        return [];
    }
  }
}