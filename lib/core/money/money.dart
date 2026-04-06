/// Basic money-related helper for the Thai POS system.
/// Focuses on consistent rounding and basic amount checks.
class Money {
  /// Round to 2 decimal places (standard for THB)
  static double round(double amount) {
    return (amount * 100).round() / 100;
  }

  /// Format as plain string for internal IDs or keys: 1234.56
  static String toFixed(double amount) {
    return amount.toStringAsFixed(2);
  }

  /// Sum helper to ensure each step is rounded
  static double sum(Iterable<double> amounts) {
    return round(amounts.fold(0.0, (prev, element) => prev + element));
  }

  /// Multiply helper with rounding
  static double multiply(double amount, double factor) {
    return round(amount * factor);
  }
}
