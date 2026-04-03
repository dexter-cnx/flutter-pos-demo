# Architecture 02: Visual Floor Plan Designer

> **Priority:** 🟡 Medium  
> **Modules:** `features/tables`, `modes/restaurant`

---

## 1. Current State

### ✅ Implemented
- `TableModel` — Basic `name`, `status`, `capacity`, `floor`.
- `RestaurantMainPage` — Static grid of table cards.
- **Workflow**: `available` → `occupied` → `billing` → `cleaning` → `available`.

### ❌ Missing
- **Spatial Accuracy**: Grid view doesn't reflect actual shop layout.
- **Decorative Objects**: No walls, windows, plants, or paths.
- **Interactive Editor**: No drag-and-drop tool for layout design.
- **Multi-floor Support**: No floor switching within a single shop.

---

## 2. Technical Design: Data Layer

### 2.1 FloorPlanModel (Isar Collection)

```dart
@collection
class FloorPlanModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String name;           // 'Floor 1', 'Garden', 'Rooftop'

  int sortOrder = 0;
  bool isDefault = false;

  /// Virtual canvas boundaries
  double canvasWidth = 1200;
  double canvasHeight = 800;

  /// Background styling (hex)
  String bgColorHex = '#F5F5F5';
}
```

### 2.2 LayoutObjectModel (Isar Collection)

```dart
@collection
class LayoutObjectModel {
  Id id = Isar.autoIncrement;

  @Index()
  late int floorPlanId;

  /// 'table', 'wall', 'window', 'plant', 'door', 'label'
  late String objectType;

  /// Geometric properties
  late double x;
  late double y;
  late double width;
  late double height;
  double rotation = 0;

  /// Z-ordering for layered rendering
  int zIndex = 0;

  /// Foreign key for 'table' type
  int? tableId;

  /// Aesthetic properties
  String? colorHex;
  String? label;
  String? icon;       // Material icons mapped to strings

  bool isLocked = false;
}
```

---

## 3. Presentation Architecture

### 3.1 Floor Plan Canvas Component

*   **InteractiveViewer**: Provides Zoom & Pan capabilities.
*   **CustomPainter / Stack**: Renders all `LayoutObjects` spatially.
*   **GestureDetector**: Handles selection and scaling in Editor mode.

### 3.2 Visual Logic

1.  **Rendering Engine**: Efficiently draws tables as interactive cards and decorations as static path-based widgets.
2.  **State Management**: Real-time updates of table colors (Status) reflected instantly on the canvas.
3.  **Editor State (Admin)**: Allows adding, moving, and deleting layout objects with Isar persistence.

---

## 4. Proposed Feature Set

### 4.1 Shop Layout Editor
*   **Component Palette**: Drag tables or walls from a sidebar onto the canvas.
*   **Object Properties**: Resize, rotate, and label objects.
*   **Table Linking**: Bind a visual table object to a functional `TableModel`.

### 4.2 Interactive Floor Plan Viewer
*   **Intuitive Navigation**: Swipe between floors via tabs at the bottom.
*   **Quick Actions**: Tap a table on the map to open the check, view bill, or start a session.
*   **Status Indicators**: Tables change colors (Green/Red/Orange) based on occupancy.

---

## 5. Implementation Roadmap

### Create
- `features/tables/data/models/floor_plan_model.dart`
- `features/tables/data/models/layout_object_model.dart`
- `features/tables/presentation/widgets/floor_plan_canvas.dart`
- `features/tables/presentation/widgets/draggable_object.dart`
- `features/tables/presentation/pages/floor_plan_editor_page.dart`

### Modify
- `table_model.dart`: Link to `floorPlanId`.
- `restaurant_main_page.dart`: Add "Map View" toggle.
- `data_seeder.dart`: Generate default floor plans.
- `feature_capability.dart`: Add `visualFloorPlan` capability.

---

## 6. Verification Criteria

- [x] Multi-floor support with persistent canvas positions.
- [x] Drag-and-drop functionality in the Editor mode.
- [x] Real-time table status updates reflected on the canvas.
- [x] Zoom and Pan support for large restaurant layouts.
- [x] User can toggle between legacy Grid View and new Map View.

---
*Last updated: April 2026*
