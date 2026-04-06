import 'package:thai_pos_demo/shared/domain/value_objects/tax_breakdown.dart';

/// Centralized calculator for VAT and tax-related POS operations.
/// 
/// For Thai business:
/// Most B2C retail/restaurant prices are Tax-Inclusive (7%).
/// Some B2B services/wholesale might use Tax-Exclusive.
class TaxCalculator {
  /// Default Thai VAT rate (7%)
  static const double defaultVatRate = 0.07;

  /// Calculate tax components from a gross total (inclusive of tax).
  /// Formula: Subtotal = Total / (1 + Rate)
  ///          Tax = Total - Subtotal
  static TaxBreakdown calculateFromInclusive(double total, {double rate = defaultVatRate}) {
    if (total == 0) return TaxBreakdown.empty();
    
    // Subtotal = Total / 1.07
    final subtotal = total / (1 + rate);
    final taxAmount = total - subtotal;
    
    return TaxBreakdown(
      total: _round(total),
      taxAmount: _round(taxAmount),
      subtotal: _round(subtotal),
      rate: rate,
      inclusive: true,
    );
  }

  /// Calculate total from a subtotal (exclusive of tax).
  /// Formula: Tax = Subtotal * Rate
  ///          Total = Subtotal + Tax
  static TaxBreakdown calculateFromExclusive(double subtotal, {double rate = defaultVatRate}) {
    if (subtotal == 0) return TaxBreakdown.empty();
    
    final taxAmount = subtotal * rate;
    final total = subtotal + taxAmount;
    
    return TaxBreakdown(
      total: _round(total),
      taxAmount: _round(taxAmount),
      subtotal: _round(subtotal),
      rate: rate,
      inclusive: false,
    );
  }

  /// Standard monetary rounding for Thai Baht (2 decimal places)
  static double _round(double val) {
    return (val * 100).round() / 100;
  }
}
