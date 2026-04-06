/// Utility to mask sensitive data for logs, audit trails, and customer-facing reports/receipts.
/// This improves privacy and data safety in the Thai POS system.
class MaskingUtils {
  /// Mask phone number: 081-234-5678 -> 081-xxx-5678
  static String maskPhone(String phone) {
    if (phone.trim().isEmpty) return '';
    final digits = phone.replaceAll(RegExp(r'\D'), '');
    if (digits.length < 10) return phone;
    return '${digits.substring(0, 3)}-xxx-${digits.substring(6)}';
  }

  /// Mask reference IDs (e.g., payment references, transaction IDs):
  /// T-123456-ABC -> T-xx-ABC
  static String maskReference(String ref) {
    if (ref.length < 6) return ref;
    return '${ref.substring(0, 2)}xx${ref.substring(ref.length - 3)}';
  }

  /// Mask customer name for privacy on printed queue tickets:
  /// Somchai Jaidee -> S***i Jaidee or S. Jaidee
  static String maskNameShort(String name) {
    if (name.trim().isEmpty) return '';
    final parts = name.trim().split(' ');
    if (parts.length > 1) {
      return '${parts[0][0]}. ${parts[1]}';
    }
    return '${name[0]}***${name[name.length - 1]}';
  }

  /// Generic mask (replace all but last 4 digits/chars)
  static String maskGeneric(String val, {int visibleLast = 4}) {
      if (val.length <= visibleLast) return val;
      final hidden = val.substring(0, val.length - visibleLast);
      final masked = '*' * hidden.length;
      return masked + val.substring(val.length - visibleLast);
  }
}
