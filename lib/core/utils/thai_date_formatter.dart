import 'package:intl/intl.dart';

/// Centralized utility for Thai datetime formatting, especially for Buddhist years and Thai labels.
/// For Thai POS, Buddhist calendar (BE) is standard for reports and receipts (Gregorian year + 543).
class ThaiDateFormatter {
  /// Simple ISO timestamp
  static String formatISO(DateTime date) => date.toIso8601String();

  /// Short local format: 06/04/2026 (Gregorian)
  static String formatShort(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  /// Short Buddhist format: 06/04/2569 (BE)
  /// Used in official Thai documents and receipts.
  static String formatShortBE(DateTime date) {
    final yearBE = date.year + 543;
    final dayMonth = DateFormat('dd/MM').format(date);
    return '$dayMonth/$yearBE';
  }

  /// Compact Buddhist format: 06/04/69 (last 2 digits)
  static String formatShortBECompact(DateTime date) {
    final yearShortBE = (date.year + 543) % 100;
    final dayMonth = DateFormat('dd/MM').format(date);
    return '$dayMonth/$yearShortBE';
  }

  /// Receipt layout: 06 พ.ค. 2569 08:30 (Thai months + BE year)
  /// locale: 'th' is used for Thai month names
  static String formatFullBE(DateTime date, {bool includeTime = true}) {
    final yearBE = date.year + 543;
    final dayMonth = DateFormat('dd MMM', 'th').format(date);
    final time = includeTime ? ' ${DateFormat('HH:mm').format(date)}' : '';
    return '$dayMonth $yearBE$time';
  }

  /// Time-only for orders and history: 08:30
  static String formatTime(DateTime date) {
    return DateFormat('HH:mm').format(date);
  }
}
