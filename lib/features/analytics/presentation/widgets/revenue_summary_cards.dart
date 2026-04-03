import 'package:flutter/material.dart';

import '../../domain/entities/daily_summary.dart';

class RevenueSummaryCards extends StatelessWidget {
  final DailySummary summary;

  const RevenueSummaryCards({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildCard(
          context,
          title: 'ยอดขายวันนี้',
          value: '฿ ${summary.totalRevenue.toStringAsFixed(2)}',
          icon: Icons.attach_money,
          color: Colors.green,
          trend: summary.previousDayRevenue != null && summary.previousDayRevenue! > 0
              ? '${((summary.totalRevenue - summary.previousDayRevenue!) / summary.previousDayRevenue! * 100).toStringAsFixed(1)}%'
              : null,
          isTrendUp: summary.previousDayRevenue != null && summary.totalRevenue >= summary.previousDayRevenue!,
        ),
        _buildCard(
          context,
          title: 'จำนวนบิล',
          value: '${summary.orderCount} บิล',
          icon: Icons.receipt_long,
          color: Colors.blue,
        ),
        _buildCard(
          context,
          title: 'ลูกค้า',
          value: '${summary.customerCount} คน',
          icon: Icons.people,
          color: Colors.orange,
        ),
      ],
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required MaterialColor color,
    String? trend,
    bool isTrendUp = true,
  }) {
    return Expanded(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: color, size: 24),
                  const SizedBox(width: 8),
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
              const SizedBox(height: 16),
              Text(value, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
              if (trend != null) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      isTrendUp ? Icons.arrow_upward : Icons.arrow_downward,
                      color: isTrendUp ? Colors.green : Colors.red,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$trend จากเมื่อวาน',
                      style: TextStyle(color: isTrendUp ? Colors.green : Colors.red, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
