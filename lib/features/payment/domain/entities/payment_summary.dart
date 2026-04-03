import 'package:freezed_annotation/freezed_annotation.dart';
import 'payment_method.dart';
import 'payment_status.dart';

part 'payment_summary.freezed.dart';
part 'payment_summary.g.dart';

@freezed
class PaymentSummary with _$PaymentSummary {
  const factory PaymentSummary({
    required String id,
    required String orderId,
    required double totalAmount,
    required double receivedAmount,
    required double changeAmount,
    required PaymentMethod method,
    required PaymentStatus status,
    required DateTime timestamp,
  }) = _PaymentSummary;

  factory PaymentSummary.fromJson(Map<String, dynamic> json) =>
      _$PaymentSummaryFromJson(json);
}
