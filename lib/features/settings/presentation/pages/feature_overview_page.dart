import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:thai_pos_demo/shared/domain/entities/app_permission.dart';
import 'package:thai_pos_demo/shared/domain/enums/job_type.dart';
import 'package:thai_pos_demo/shared/presentation/providers/access_providers.dart';
import 'package:thai_pos_demo/shared/presentation/providers/job_providers.dart';
import 'package:thai_pos_demo/shared/presentation/widgets/permission_guard.dart';
import 'package:thai_pos_demo/core/money/thai_currency_formatter.dart';
import 'package:thai_pos_demo/core/utils/thai_date_formatter.dart';
import 'package:thai_pos_demo/core/money/tax_calculator.dart';

class FeatureOverviewPage extends ConsumerWidget {
  const FeatureOverviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo.title'.tr()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _FeatureCard(
              title: 'demo.rbac_title'.tr(),
              description: 'demo.rbac_desc'.tr(),
              icon: Icons.lock_person_outlined,
              color: Colors.indigo,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Current Role: ${ref.watch(userAccessProfileProvider).role.name.toUpperCase()}'),
                    subtitle: Text('ID: ${ref.watch(userAccessProfileProvider).userId} • Name: ${ref.watch(userAccessProfileProvider).displayName}'),
                  ),
                  const SizedBox(height: 8),
                  PermissionGuard(
                    permission: AppPermission.settingsEdit,
                    fallback: Card(
                      color: Colors.red.shade50, // custom error color hint
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Admin-only action hidden/disabled for staff roles', style: TextStyle(color: Colors.red)),
                      ),
                    ),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Admin action authorized!')));
                      },
                      icon: const Icon(Icons.admin_panel_settings),
                      label: Text('demo.test_rbac_button'.tr()),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _FeatureCard(
              title: 'demo.thai_utils_title'.tr(),
              description: 'demo.thai_utils_desc'.tr(),
              icon: Icons.currency_bitcoin_outlined, // closest thing to baht in material sometimes or use custom
              color: Colors.teal,
              child: Column(
                children: [
                  _UtilRow(
                    label: 'demo.utils_money_label'.tr(),
                    value: ThaiCurrencyFormatter.formatWithSymbol(1234.50),
                    icon: Icons.money,
                  ),
                  _UtilRow(
                    label: 'demo.utils_price_label'.tr(),
                    value: '${ThaiCurrencyFormatter.format(100.0)} → ${ThaiCurrencyFormatter.format(TaxCalculator.calculateFromExclusive(100.0).total)}',
                    icon: Icons.calculate_outlined,
                  ),
                  _UtilRow(
                    label: 'demo.utils_date_label'.tr(),
                    value: ThaiDateFormatter.formatFullBE(DateTime.now()),
                    icon: Icons.calendar_today_outlined,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _FeatureCard(
              title: 'demo.audit_title'.tr(),
              description: 'demo.audit_desc'.tr(),
              icon: Icons.history_edu_outlined,
              color: Colors.blueGrey,
              child: Column(
                children: [
                  const Text('Real-time persistence via Isar Local DB'),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () => context.go('/settings/audit-log'),
                      icon: const Icon(Icons.search),
                      label: Text('receipt.view_history'.tr()), // Or settings.audit_log.tr()
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _FeatureCard(
              title: 'demo.queue_title'.tr(),
              description: 'demo.queue_desc'.tr(),
              icon: Icons.queue_play_next_outlined,
              color: Colors.deepOrange,
              child: Column(
                children: [
                  const Text('Handles operational delays (Reprints, Syncs)'),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () async {
                             final user = ref.read(userAccessProfileProvider);
                             await ref.read(jobDispatcherProvider).dispatch(
                               type: JobType.reportGenerate,
                               actorId: user.userId,
                               payload: {'reportType': 'demo_test'},
                             );
                             if (context.mounted) {
                               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Test job enqueued! Check Queue Manager.')));
                             }
                          },
                          icon: const Icon(Icons.add_task),
                          label: Text('demo.test_job_button'.tr()),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => context.go('/settings/job-queue'),
                          icon: const Icon(Icons.settings_system_daydream),
                          label: Text('settings.job_queue'.tr()),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final Widget child;

  const _FeatureCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: color.withValues(alpha: 0.1),
            child: Row(
              children: [
                Icon(icon, color: color, size: 32),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: color, fontWeight: FontWeight.bold)),
                      Text(description, style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: child,
          ),
        ],
      ),
    );
  }
}

class _UtilRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _UtilRow({required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey),
          const SizedBox(width: 12),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          const Spacer(),
          Text(value, style: const TextStyle(color: Colors.blueGrey)),
        ],
      ),
    );
  }
}
