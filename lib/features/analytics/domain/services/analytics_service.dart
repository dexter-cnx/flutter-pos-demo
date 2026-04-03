import 'package:isar/isar.dart';

import '../../../orders/data/models/order_model.dart';
import '../entities/daily_summary.dart';
import '../entities/daily_data_point.dart';
import '../entities/top_product.dart';

class AnalyticsService {
  final Isar _isar;

  AnalyticsService(this._isar);

  Future<DailySummary> getTodaySummary() async {
    final today = DateTime.now();
    final startOfDay = DateTime(today.year, today.month, today.day);

    final orders = await _isar.orderModels
        .filter()
        .createdAtGreaterThan(startOfDay)
        .findAll();

    return DailySummary(
      totalRevenue: orders.fold<double>(0.0, (sum, o) => sum + o.total),
      orderCount: orders.length,
      customerCount: _uniqueCustomers(orders),
      topProducts: _calculateTopProducts(orders),
      hourlyRevenue: _calculateHourlyRevenue(orders),
      paymentBreakdown: _calculatePaymentBreakdown(orders),
      previousDayRevenue: await _getPreviousDayRevenue(),
    );
  }

  Future<double> _getPreviousDayRevenue() async {
    final today = DateTime.now();
    final startOfYesterday = DateTime(today.year, today.month, today.day - 1);
    final endOfYesterday = DateTime(today.year, today.month, today.day);

    final orders = await _isar.orderModels
        .filter()
        .createdAtBetween(startOfYesterday, endOfYesterday)
        .findAll();

    return orders.fold<double>(0.0, (sum, o) => sum + o.total);
  }

  int _uniqueCustomers(List<OrderModel> orders) {
    int total = 0;
    for (var element in orders) {
      if (element.headcount != null && element.headcount! > 0) {
        total += element.headcount!;
      } else {
        total += 1;
      }
    }
    return total;
  }

  List<TopProduct> _calculateTopProducts(List<OrderModel> orders) {
    final Map<String, _ProductStat> stats = {};

    for (final order in orders) {
      for (final item in order.items) {
        if (!stats.containsKey(item.sku)) {
          stats[item.sku] = _ProductStat(item.productName, 0, 0);
        }
        stats[item.sku]!.quantity += item.quantity;
        stats[item.sku]!.revenue += item.lineTotal;
      }
    }

    final sorted = stats.values.toList()
      ..sort((a, b) => b.revenue.compareTo(a.revenue));

    return sorted.take(5).map((e) => TopProduct(name: e.name, quantity: e.quantity, revenue: e.revenue)).toList();
  }

  Map<int, double> _calculateHourlyRevenue(List<OrderModel> orders) {
    final Map<int, double> hourly = {
      for (var i = 0; i < 24; i++) i: 0.0
    };

    for (final order in orders) {
      final hour = order.createdAt.hour;
      hourly[hour] = hourly[hour]! + order.total;
    }

    return hourly;
  }

  Map<String, double> _calculatePaymentBreakdown(List<OrderModel> orders) {
    final Map<String, double> breakdown = {};

    for (final order in orders) {
      final method = order.paymentMethod;
      breakdown[method] = (breakdown[method] ?? 0.0) + order.total;
    }

    return breakdown;
  }

  Future<List<DailyDataPoint>> getRevenueByDateRange(DateTime start, DateTime end) async {
    final orders = await _isar.orderModels
        .filter()
        .createdAtBetween(start, end)
        .findAll();

    final Map<DateTime, _DailyStat> dailyStats = {};

    for (final order in orders) {
      final date = DateTime(order.createdAt.year, order.createdAt.month, order.createdAt.day);
      if (!dailyStats.containsKey(date)) {
        dailyStats[date] = _DailyStat(0, 0);
      }
      dailyStats[date]!.revenue += order.total;
      dailyStats[date]!.orderCount += 1;
    }

    List<DailyDataPoint> points = [];
    var currentDate = start;
    while (currentDate.isBefore(end)) {
      final dateOnly = DateTime(currentDate.year, currentDate.month, currentDate.day);
      final stat = dailyStats[dateOnly] ?? _DailyStat(0, 0);
      points.add(DailyDataPoint(
        date: dateOnly,
        revenue: stat.revenue,
        orderCount: stat.orderCount,
      ));
      currentDate = currentDate.add(const Duration(days: 1));
    }

    return points;
  }
}

class _ProductStat {
  final String name;
  int quantity;
  double revenue;
  _ProductStat(this.name, this.quantity, this.revenue);
}

class _DailyStat {
  double revenue;
  int orderCount;
  _DailyStat(this.revenue, this.orderCount);
}
