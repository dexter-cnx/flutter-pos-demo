import 'dart:typed_data';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../entities/daily_summary.dart';
import '../entities/daily_data_point.dart';

class ReportExporter {
  static Future<Uint8List> generateDailyPDF(DailySummary summary) async {
    final pdf = pw.Document();
    final font = await PdfGoogleFonts.kanitRegular(); // Use Kanit for Thai support
    final fontBold = await PdfGoogleFonts.kanitMedium();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        theme: pw.ThemeData.withFont(
          base: font,
          bold: fontBold,
        ),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Header(level: 0, text: 'Daily Sales Report (รายงานยอดขายประจำวัน)'),
              pw.SizedBox(height: 10),
              pw.Text('Total Revenue (ยอดขายรวม): ฿${summary.totalRevenue.toStringAsFixed(2)}'),
              pw.Text('Orders (ออเดอร์): ${summary.orderCount}'),
              pw.Text('Customers (ลูกค้า): ${summary.customerCount}'),
              pw.SizedBox(height: 20),
              pw.Header(level: 1, text: 'Top Products (สินค้าขายดี)'),
              pw.TableHelper.fromTextArray(
                context: context,
                data: [
                  ['Product (สินค้า)', 'Qty (จำนวน)', 'Revenue (รวม)'],
                  ...summary.topProducts.map((p) => [
                        p.name,
                        p.quantity.toString(),
                        '฿${p.revenue.toStringAsFixed(2)}',
                      ])
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Header(level: 1, text: 'Payment Methods (ช่องทางชำระเงิน)'),
              pw.TableHelper.fromTextArray(
                context: context,
                data: [
                  ['Method (วิธี)', 'Amount (ยอดรวม)'],
                  ...summary.paymentBreakdown.entries.map((e) => [
                        e.key,
                        '฿${e.value.toStringAsFixed(2)}',
                      ])
                ],
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  static String generateCSV(List<DailyDataPoint> data) {
    final buffer = StringBuffer('Date,Revenue,Orders\n');
    for (final d in data) {
      buffer.writeln('${d.date.toIso8601String()},${d.revenue},${d.orderCount}');
    }
    return buffer.toString();
  }
}
