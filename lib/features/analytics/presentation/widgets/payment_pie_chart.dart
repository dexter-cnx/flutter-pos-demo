import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../domain/entities/daily_summary.dart';

class PaymentPieChart extends StatelessWidget {
  final DailySummary summary;

  const PaymentPieChart({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    if (summary.paymentBreakdown.isEmpty || summary.totalRevenue == 0) {
      return _buildEmptyBox();
    }

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('สัดส่วนช่องทางชำระเงิน', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Expanded(
              child: PieChart(
                PieChartData(
                  sectionsSpace: 2,
                  centerSpaceRadius: 40,
                  sections: _buildSections(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyBox() {
    return const Card(
      child: Center(child: Text('ไม่มีข้อมูล')),
    );
  }

  List<PieChartSectionData> _buildSections() {
    final colors = [Colors.blue, Colors.orange, Colors.green, Colors.red];
    int index = 0;
    
    return summary.paymentBreakdown.entries.map((e) {
      final isNotEmpty = e.value > 0;
      final percent = isNotEmpty ? (e.value / summary.totalRevenue * 100) : 0.0;
      final color = colors[index % colors.length];
      index++;
      
      return PieChartSectionData(
        color: color,
        value: e.value,
        title: '${e.key}\n${percent.toStringAsFixed(1)}%',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
      );
    }).toList();
  }
}
