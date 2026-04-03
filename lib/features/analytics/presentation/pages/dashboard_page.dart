import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';
import '../../../../app/layout/responsive_layout.dart';
import '../../../../app/widgets/async_state_view.dart';
import '../providers/analytics_providers.dart';
import '../widgets/revenue_summary_cards.dart';
import '../widgets/hourly_bar_chart.dart';
import '../widgets/payment_pie_chart.dart';
import '../widgets/top_products_list.dart';
import '../../domain/services/report_exporter.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final summaryAsync = ref.watch(todaySummaryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('dashboard.title'.tr()),
        actions: [
          IconButton(
            tooltip: 'common.refresh'.tr(),
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => ref.invalidate(todaySummaryProvider),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final responsive = ResponsiveLayout.fromConstraints(constraints);
          
          return summaryAsync.when(
            data: (summary) {
              final now = DateTime.now();
              final dateStr = DateFormat('dd/MM/yyyy').format(now);

              return RefreshIndicator(
                onRefresh: () async => ref.invalidate(todaySummaryProvider),
                child: ListView(
                  padding: const EdgeInsets.all(24),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'dashboard.today'.tr(args: [dateStr]),
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        OutlinedButton.icon(
                          onPressed: () async {
                            final pdfBytes = await ReportExporter.generateDailyPDF(summary);
                            await Printing.sharePdf(
                              bytes: pdfBytes,
                              filename: 'Daily_Report_${dateStr.replaceAll('/', '_')}.pdf',
                            );
                          },
                          icon: const Icon(Icons.picture_as_pdf_outlined),
                          label: Text('dashboard.export_pdf'.tr()),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // KPI Cards
                    RevenueSummaryCards(summary: summary),
                    const SizedBox(height: 24),
                    
                    if (responsive.isSplitView) ...[
                      // Desktop/Tablet Row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 400,
                              child: HourlyBarChart(summary: summary),
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 380,
                                  child: PaymentPieChart(summary: summary),
                                ),
                                const SizedBox(height: 24),
                                SizedBox(
                                  height: 400,
                                  child: TopProductsList(summary: summary),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ] else ...[
                      // Mobile Column
                      SizedBox(
                        height: 300,
                        child: HourlyBarChart(summary: summary),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 300,
                        child: PaymentPieChart(summary: summary),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 400,
                        child: TopProductsList(summary: summary),
                      ),
                    ],
                  ],
                ),
              );
            },
            loading: () => const AppLoadingState(),
            error: (err, st) => AppErrorState(
              message: err.toString(),
              onRetry: () => ref.invalidate(todaySummaryProvider),
            ),
          );
        },
      ),
    );
  }
}
