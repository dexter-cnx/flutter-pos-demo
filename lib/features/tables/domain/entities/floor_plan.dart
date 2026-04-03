import 'package:freezed_annotation/freezed_annotation.dart';

part 'floor_plan.freezed.dart';

@freezed
class FloorPlan with _$FloorPlan {
  const factory FloorPlan({
    required String id,
    required String name,
    @Default(0) int sortOrder,
    @Default(false) bool isDefault,
    @Default(1200) double canvasWidth,
    @Default(800) double canvasHeight,
    @Default('#F5F5F5') String bgColorHex,
  }) = _FloorPlan;
}
