import 'package:flutter/rendering.dart';

class ResponsiveLayout {
  const ResponsiveLayout._({
    required this.width,
    required this.height,
  });

  factory ResponsiveLayout.fromConstraints(BoxConstraints constraints) {
    final width = constraints.maxWidth.isFinite ? constraints.maxWidth : 1.0;
    final height = constraints.maxHeight.isFinite ? constraints.maxHeight : 1.0;

    return ResponsiveLayout._(
      width: width <= 0 ? 1.0 : width,
      height: height <= 0 ? 1.0 : height,
    );
  }

  final double width;
  final double height;

  double get widthRatio => width / height;
  double get heightRatio => height / width;

  bool get isSplitView => widthRatio >= 1.18;
  bool get isBalanced => widthRatio >= 1.0;
  bool get isCompactForm => widthRatio < 0.95;
  bool get isCompactHeight => heightRatio <= 0.62;

  int get contentGridCount {
    if (widthRatio >= 1.95) return 4;
    if (widthRatio >= 1.45) return 3;
    if (widthRatio >= 0.95) return 2;
    return 1;
  }

  int get inventoryGridCount {
    if (widthRatio >= 1.55) return 3;
    if (widthRatio >= 0.95) return 2;
    return 1;
  }

  int get settingsColumnCount {
    if (widthRatio >= 1.8) return 3;
    if (widthRatio >= 1.1) return 2;
    return 1;
  }
}
