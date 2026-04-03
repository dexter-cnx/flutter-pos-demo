import 'package:flutter/material.dart';

import '../../domain/entities/daily_summary.dart';

class TopProductsList extends StatelessWidget {
  final DailySummary summary;

  const TopProductsList({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    if (summary.topProducts.isEmpty) {
      return const Card(child: Center(child: Text('ไม่มีข้อมูล')));
    }

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('🏆 สินค้าขายดี Top 5', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: summary.topProducts.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  final product = summary.topProducts[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.shade100,
                      child: Text('${index + 1}'),
                    ),
                    title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${product.quantity} รายการ'),
                    trailing: Text('฿${product.revenue.toStringAsFixed(2)}', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
