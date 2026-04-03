import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_data_point.freezed.dart';

@freezed
class DailyDataPoint with _$DailyDataPoint {
  const factory DailyDataPoint({
    required DateTime date,
    required double revenue,
    required int orderCount,
  }) = _DailyDataPoint;
}
