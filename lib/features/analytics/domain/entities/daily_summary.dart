import 'package:freezed_annotation/freezed_annotation.dart';

import 'top_product.dart';

part 'daily_summary.freezed.dart';

@freezed
class DailySummary with _$DailySummary {
  const factory DailySummary({
    required double totalRevenue,
    required int orderCount,
    required int customerCount,
    required List<TopProduct> topProducts,
    required Map<int, double> hourlyRevenue,
    required Map<String, double> paymentBreakdown,
    double? previousDayRevenue,
  }) = _DailySummary;
}
