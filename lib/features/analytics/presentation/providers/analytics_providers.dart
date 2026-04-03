import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app/bootstrap.dart';
import '../../domain/services/analytics_service.dart';
import '../../domain/entities/daily_summary.dart';
import '../../domain/entities/daily_data_point.dart';

part 'analytics_providers.g.dart';

@Riverpod(keepAlive: true)
AnalyticsService analyticsService(AnalyticsServiceRef ref) {
  return AnalyticsService(isar!);
}

@riverpod
Future<DailySummary> todaySummary(TodaySummaryRef ref) {
  return ref.watch(analyticsServiceProvider).getTodaySummary();
}

@riverpod
Future<List<DailyDataPoint>> revenueByDateRange(
  RevenueByDateRangeRef ref, {
  required DateTime start,
  required DateTime end,
}) {
  return ref.watch(analyticsServiceProvider).getRevenueByDateRange(start, end);
}
