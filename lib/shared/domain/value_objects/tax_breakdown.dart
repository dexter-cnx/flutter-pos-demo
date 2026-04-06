import 'package:freezed_annotation/freezed_annotation.dart';

part 'tax_breakdown.freezed.dart';
part 'tax_breakdown.g.dart';

/// Value object representing a detailed tax breakdown for a POS transaction.
/// This structure provides clear separation between base price and calculated VAT.
@freezed
class TaxBreakdown with _$TaxBreakdown {
  const factory TaxBreakdown({
    /// Total amount including tax
    required double total,
    
    /// Estimated tax component (amount of total that is tax)
    required double taxAmount,
    
    /// Base amount (total - taxAmount)
    required double subtotal,
    
    /// The VAT rate applied (typically 0.07 for Thai business)
    @Default(0.07) double rate,
    
    /// Whether the calculation was tax-inclusive (most common for retail)
    @Default(true) bool inclusive,
  }) = _TaxBreakdown;

  factory TaxBreakdown.fromJson(Map<String, dynamic> json) =>
      _$TaxBreakdownFromJson(json);

  /// Empty state for empty cart
  factory TaxBreakdown.empty() => const TaxBreakdown(
        total: 0.0,
        taxAmount: 0.0,
        subtotal: 0.0,
        rate: 0.07,
      );
}
