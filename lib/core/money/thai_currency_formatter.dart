import 'package:intl/intl.dart';

/// Centralized utility for Thai Baht formatting in POS screens, receipts, and reports.
/// Using '\u0E3F' as THB symbol.
class ThaiCurrencyFormatter {
  /// Thai Baht symbol icon
  static const String thbSymbol = '\u0E3F';

  /// Standard currency formatter for screen and report displays.
  /// Example: 1,234.56
  static String format(double amount) {
    final formatter = NumberFormat("#,##0.00", "en_US");
    return formatter.format(amount);
  }

  /// Currency formatter WITH Thai Baht symbol prefix.
  /// Example: ฿1,234.56
  static String formatWithSymbol(double amount) {
    return '$thbSymbol${format(amount)}';
  }

  /// Compact currency format for high-density tables or small widgets.
  /// Grouping: true, Decimals: 0 if zero, 2 if not zero.
  static String formatCompact(double amount) {
    if (amount % 1 == 0) {
      return NumberFormat("#,##0", "en_US").format(amount);
    }
    return format(amount);
  }

  /// Receipt-friendly alignment helper (pads currency values for mono-space printing).
  /// Max total width defines the right-align padding.
  static String formatForReceipt(double amount, {int width = 12}) {
    final valueStr = format(amount);
    return valueStr.padLeft(width);
  }
}
