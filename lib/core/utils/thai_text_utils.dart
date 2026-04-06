/// Utility for Thai-specific text operations:
/// - Thai numeral conversion (๐, ๑, ...)
/// - Text splitting for receipts
/// - Thai font spacing corrections if needed
class ThaiTextUtils {
  /// Arabic numerals to Thai numerals
  /// 0123456789 -> ๐๑๒๓๔๕๖๗๘๙
  static String toThaiNumerals(String text) {
    const thaiDigits = '๐๑๒๓๔๕๖๗๘๙';
    const arabicDigits = '0123456789';
    var result = text;
    for (var i = 0; i < 10; i++) {
        result = result.replaceAll(arabicDigits[i], thaiDigits[i]);
    }
    return result;
  }

  /// Clean Thai input for database/search:
  /// Remove leading/trailing spaces, extra symbols, etc.
  static String cleanThai(String text) {
    return text.trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  /// Receipt title styling:
  /// Adds ============ surrounding the text for receipt-friendly aesthetics.
  static String formatForReceiptTitle(String title, {int totalWidth = 32}) {
     if (title.length >= totalWidth) return title;
     final dashLen = (totalWidth - title.length - 2) ~/ 2;
     final dashes = '=' * dashLen;
     return '$dashes $title $dashes';
  }

  /// Short receipt footer line
  static String receiptFooterLine({int totalWidth = 32}) => '-' * totalWidth;
}
