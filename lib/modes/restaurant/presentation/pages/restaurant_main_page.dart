import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/widgets/async_state_view.dart';
import '../../../../features/tables/presentation/providers/table_providers.dart';
import '../../../../features/dining/presentation/providers/dining_providers.dart';
import '../../../../features/tables/data/models/table_model.dart';
import 'package:easy_localization/easy_localization.dart';

class RestaurantMainPage extends ConsumerStatefulWidget {
  const RestaurantMainPage({super.key});

  @override
  ConsumerState<RestaurantMainPage> createState() => _RestaurantMainPageState();
}

class _RestaurantMainPageState extends ConsumerState<RestaurantMainPage> {
  @override
  void initState() {
    super.initState();
    // Clear active session when in table grid
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(activeDiningSessionIdProvider.notifier).set(null);
    });
  }

  @override
  Widget build(BuildContext context) {
    final tablesAsync = ref.watch(tablesNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('pos.nav.restaurant_tables'.tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(tablesNotifierProvider),
          ),
        ],
      ),
      body: tablesAsync.when(
        data: (tables) => GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 220,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.1,
          ),
          itemCount: tables.length,
          itemBuilder: (context, index) => _TableCard(table: tables[index]),
        ),
        loading: () => const AppLoadingState(),
        error: (error, _) => AppErrorState(
          message: error.toString(),
          onRetry: () => ref.invalidate(tablesNotifierProvider),
        ),
      ),
    );
  }
}

class _TableCard extends ConsumerWidget {
  const _TableCard({required this.table});

  final TableModel table;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    
    Color tableColor;
    IconData tableIcon;
    String statusLabel;

    switch (table.status) {
      case 'occupied':
        tableColor = colorScheme.errorContainer;
        tableIcon = Icons.people;
        statusLabel = 'pos.restaurant.table_occupied'.tr();
        break;
      case 'cleaning':
        tableColor = colorScheme.tertiaryContainer;
        tableIcon = Icons.cleaning_services;
        statusLabel = 'pos.restaurant.table_cleaning'.tr();
        break;
      default:
        tableColor = colorScheme.secondaryContainer;
        tableIcon = Icons.table_restaurant_outlined;
        statusLabel = 'pos.restaurant.table_available'.tr();
    }

    return Card(
      elevation: table.status == 'occupied' ? 4 : 1,
      color: tableColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: table.status == 'occupied' 
              ? colorScheme.error 
              : Colors.transparent,
          width: 2,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _handleTableTap(context, ref),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                table.name,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Icon(tableIcon, size: 32),
              const SizedBox(height: 8),
              Text(
                statusLabel,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.chair, size: 14),
                  const SizedBox(width: 4),
                  Text('${table.capacity}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleTableTap(BuildContext context, WidgetRef ref) {
    if (table.status == 'occupied' && table.currentSessionId != null) {
      _goToSession(context, table.currentSessionId!);
    } else if (table.status == 'cleaning') {
      ref.read(tablesNotifierProvider.notifier).updateStatus(table.id, 'available');
    } else {
      _showOpenSessionDialog(context, ref);
    }
  }

  void _goToSession(BuildContext context, int sessionId) {
    context.pushNamed(
      'restaurant_session',
      pathParameters: {'sessionId': sessionId.toString()},
    );
  }

  Future<void> _showOpenSessionDialog(BuildContext context, WidgetRef ref) async {
    int headcount = 1;
    
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text('pos.restaurant.open_table'.tr(args: [table.name])),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('pos.restaurant.enter_headcount'.tr()),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: headcount > 1 ? () => setState(() => headcount--) : null,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      '$headcount',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: headcount < table.capacity * 2 
                        ? () => setState(() => headcount++) 
                        : null,
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('common.cancel'.tr()),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('common.confirm'.tr()),
            ),
          ],
        ),
      ),
    );

    if (confirmed == true) {
      final sessionId = await ref.read(diningSessionsNotifierProvider.notifier).openSession(
        table.id,
        table.name,
        headcount,
      );
      if (context.mounted) {
        _goToSession(context, sessionId);
      }
    }
  }
}
