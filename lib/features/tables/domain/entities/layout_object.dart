import 'package:freezed_annotation/freezed_annotation.dart';

part 'layout_object.freezed.dart';

@freezed
class LayoutObject with _$LayoutObject {
  const factory LayoutObject({
    required String id,
    required String floorPlanId,
    required String objectType,
    required double x,
    required double y,
    required double width,
    required double height,
    @Default(0) double rotation,
    @Default(0) int zIndex,
    String? tableId,
    String? colorHex,
    String? label,
    String? icon,
    @Default(false) bool isLocked,
  }) = _LayoutObject;
}
