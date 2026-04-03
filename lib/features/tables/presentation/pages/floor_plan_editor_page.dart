import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../features/tables/presentation/providers/floor_plan_providers.dart';
import '../../../../features/tables/presentation/widgets/floor_plan_canvas.dart';
import '../../../../features/tables/domain/entities/layout_object.dart';
import '../../../../features/tables/domain/entities/floor_plan.dart';

class FloorPlanEditorPage extends ConsumerWidget {
  const FloorPlanEditorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFloorId = ref.watch(activeFloorPlanIdProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Floor Plan Editor'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add Floor Plan',
            onPressed: () {
              _showAddFloorPlanDialog(context, ref);
            },
          ),
          if (activeFloorId != null)
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: 'Delete current plan',
              onPressed: () {
                ref.read(floorPlansProvider.notifier).deleteFloorPlan(activeFloorId);
              },
            ),
        ],
      ),
      body: Row(
        children: [
          // Sidebar with draggable objects
          Container(
            width: 200,
            color: Colors.grey.shade100,
            child: ListView(
              children: [
                _buildSidebarItem(context, ref, activeFloorId, 'Table', Icons.table_restaurant, 'table'),
                _buildSidebarItem(context, ref, activeFloorId, 'Wall', Icons.square, 'wall'),
                _buildSidebarItem(context, ref, activeFloorId, 'Window', Icons.window, 'window'),
                _buildSidebarItem(context, ref, activeFloorId, 'Door', Icons.meeting_room, 'door'),
                _buildSidebarItem(context, ref, activeFloorId, 'Plant', Icons.nature, 'plant'),
              ],
            ),
          ),
          // Main Canvas
          Expanded(
            child: activeFloorId != null
                ? FloorPlanCanvas(floorPlanId: activeFloorId, isEditMode: true)
                : const Center(child: Text('No Floor Plan Selected')),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(BuildContext context, WidgetRef ref, String? activeFloorId, String label, IconData icon, String type) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () {
        if (activeFloorId != null) {
          final newObj = LayoutObject(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            floorPlanId: activeFloorId,
            objectType: type,
            x: 50,
            y: 50,
            width: 100,
            height: 100,
            rotation: 0,
            tableId: type == 'table' ? 'T${DateTime.now().millisecondsSinceEpoch % 1000}' : null,
          );
          ref.read(layoutObjectsProvider(activeFloorId).notifier).saveObject(newObj);
        }
      },
      subtitle: const Text('Tap to add'),
    );
  }

  void _showAddFloorPlanDialog(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Floor Plan'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Plan Name'),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                final newPlan = FloorPlan(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  name: controller.text,
                  canvasWidth: 800,
                  canvasHeight: 600,
                );
                ref.read(floorPlansProvider.notifier).addFloorPlan(newPlan);
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
