import 'package:flutter/material.dart';
import '../../domain/entities/layout_object.dart';

class DraggableLayoutObject extends StatelessWidget {
  final LayoutObject object;
  final bool isEditMode;
  final ValueChanged<LayoutObject>? onUpdate;

  const DraggableLayoutObject({
    super.key,
    required this.object,
    this.isEditMode = false,
    this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = _buildVisual();

    if (isEditMode && !object.isLocked) {
      child = GestureDetector(
        onPanUpdate: (details) {
          if (onUpdate != null) {
            onUpdate!(object.copyWith(
              x: object.x + details.delta.dx,
              y: object.y + details.delta.dy,
            ));
          }
        },
        child: child,
      );
    }

    return Positioned(
      left: object.x,
      top: object.y,
      width: object.width,
      height: object.height,
      child: Transform.rotate(
        angle: object.rotation * 3.14159 / 180,
        child: child,
      ),
    );
  }

  Widget _buildVisual() {
    final color = _parseColor(object.colorHex) ?? Colors.blueAccent;

    switch (object.objectType) {
      case 'table':
        return Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black26),
          ),
          child: Center(
            child: Text(
              object.label ?? 'T${object.tableId ?? ''}',
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        );
      case 'wall':
        return Container(
          color: color,
        );
      case 'window':
        return Container(
          decoration: BoxDecoration(
            color: Colors.lightBlue.withValues(alpha: 0.3),
            border: Border.all(color: Colors.blue, width: 2),
          ),
        );
      case 'door':
        return Container(
          decoration: BoxDecoration(
            color: Colors.brown.shade300,
            border: Border.all(color: Colors.brown.shade800),
          ),
          child: const Center(child: Icon(Icons.meeting_room, color: Colors.white)),
        );
      case 'plant':
        return const Center(child: Icon(Icons.nature, size: 32, color: Colors.green));
      default:
        return Container(color: Colors.red);
    }
  }

  Color? _parseColor(String? hexString) {
    if (hexString == null || hexString.isEmpty) return null;
    try {
      final hex = hexString.replaceAll('#', '');
      if (hex.length == 6) {
        return Color(int.parse('FF$hex', radix: 16));
      }
      return null;
    } catch (_) {
      return null;
    }
  }
}
