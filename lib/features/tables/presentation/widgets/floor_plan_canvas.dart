import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/floor_plan_providers.dart';
import 'draggable_object.dart';

class FloorPlanCanvas extends ConsumerStatefulWidget {
  final String floorPlanId;
  final bool isEditMode;

  const FloorPlanCanvas({
    super.key,
    required this.floorPlanId,
    this.isEditMode = false,
  });

  @override
  ConsumerState<FloorPlanCanvas> createState() => _FloorPlanCanvasState();
}

class _FloorPlanCanvasState extends ConsumerState<FloorPlanCanvas> {
  final TransformationController _transformationController = TransformationController();

  @override
  Widget build(BuildContext context) {
    final floorPlansAsync = ref.watch(floorPlansProvider);
    final objectsAsync = ref.watch(layoutObjectsProvider(widget.floorPlanId));

    return floorPlansAsync.when(
      data: (plans) {
        final plan = plans.firstWhere((p) => p.id == widget.floorPlanId);
        
        return InteractiveViewer(
          transformationController: _transformationController,
          constrained: false,
          minScale: 0.1,
          maxScale: 3.0,
          boundaryMargin: const EdgeInsets.all(double.infinity),
          child: Container(
            width: plan.canvasWidth,
            height: plan.canvasHeight,
            decoration: BoxDecoration(
              color: _parseColor(plan.bgColorHex),
              border: Border.all(color: Colors.grey.withValues(alpha: 0.5)),
            ),
            child: objectsAsync.when(
              data: (objects) {
                return Stack(
                  children: objects.map((obj) => DraggableLayoutObject(
                    key: ValueKey(obj.id),
                    object: obj,
                    isEditMode: widget.isEditMode,
                    onUpdate: (newObj) {
                      if (widget.isEditMode) {
                        ref.read(layoutObjectsProvider(widget.floorPlanId).notifier).saveObject(newObj);
                      }
                    },
                  )).toList(),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, st) => Text('Error loading layout: $err'),
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, st) => Text('Error loading floor plan: $err'),
    );
  }

  Color _parseColor(String? hexString) {
    if (hexString == null || hexString.isEmpty) return Colors.grey.shade200;
    try {
      final hex = hexString.replaceAll('#', '');
      return Color(int.parse('FF$hex', radix: 16));
    } catch (_) {
      return Colors.grey.shade200;
    }
  }
}
