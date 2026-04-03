import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/widgets/async_state_view.dart';
import '../../../../features/tables/presentation/providers/table_providers.dart';
import '../../../../features/dining/presentation/providers/dining_providers.dart';
import '../../../../features/tables/data/models/table_model.dart';
import '../../../../features/dining/presentation/widgets/open_table_dialog.dart';
import '../../../../features/tables/presentation/widgets/floor_plan_canvas.dart';
import '../../../../features/tables/presentation/providers/floor_plan_providers.dart';
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
    final isFloorPlanView = ref.watch(floorPlanViewToggleProvider);
    final activeFloorId = ref.watch(activeFloorPlanIdProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('pos.nav.restaurant_tables'.tr()),
        actions: [
          IconButton(
            icon: Icon(isFloorPlanView ? Icons.grid_view : Icons.map),
            onPressed: () => ref.read(floorPlanViewToggleProvider.notifier).toggle(),
            tooltip: isFloorPlanView ? 'Switch to Grid View' : 'Switch to Floor Plan View',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(tablesNotifierProvider),
          ),
        ],
      ),
      body: isFloorPlanView && activeFloorId != null
          ? FloorPlanCanvas(floorPlanId: activeFloorId)
          : tablesAsync.when(
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
    final config = await showDialog<SessionConfig>(
      context: context,
      builder: (context) => OpenTableDialog(
        tableName: table.name,
        capacity: table.capacity,
      ),
    );

    if (config != null) {
      final sessionId = await ref.read(diningSessionsNotifierProvider.notifier).openSession(
        table.id,
        table.name,
        config,
      );
      if (context.mounted) {
        _goToSession(context, sessionId);
      }
    }
  }
}
