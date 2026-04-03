# Architecture 01: Buffet Tier System & Headcount Pricing

> **Priority:** 🔴 High  
> **Modules:** `features/dining`, `modes/restaurant`, `app/mode`

---

## 1. Current State

### ✅ Implemented
- `DiningSessionModel` — Stores `headcount` (single), `tableId`, `items`, `total`.
- `RestaurantPricingEngine` — Supports `headcount * buffetPrice` via metadata.
- `FeatureCapability.buffetPricing` & `FeatureCapability.headcountPricing` — Boilerplate ready.
- `OrderModel` — Basic `headcount` support.

### ❌ Missing
- **Buffet Tier Model**: No Silver/Gold/Platinum tiers.
- **Demographics**: No Adult / Child differentiation.
- **UX**: No tier selection during table opening.
- **Buffet Timer**: Tracking session duration.
- **Menu Visibility**: Hiding categories based on tier.

---

## 2. Technical Design: Data Layer

### 2.1 BuffetTierModel (Isar Collection)

```dart
@collection
class BuffetTierModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String name;            // 'Silver', 'Gold', 'Platinum'

  late double adultPrice;      // Per-adult price
  late double childPrice;      // Per-child price
  double elderlyDiscount = 0;  // Discount multiplier (0.0 - 1.0)

  int? timeLimitMinutes;       // Limit (null = unlimited)

  /// Categories excluded from this tier
  List<String> excludedCategoryIds = [];

  /// hex code for UI accent
  String? colorHex;

  bool isActive = true;

  @Index()
  int sortOrder = 0;
}
```

### 2.2 DiningSessionModel (Evolution)

```dart
@collection
class DiningSessionModel {
  Id id = Isar.autoIncrement;

  @Index()
  late int tableId;
  late String tableName;

  // === Demographic Headcount ===
  int adultCount = 1;
  int childCount = 0;
  int elderlyCount = 0;

  int get totalHeadcount => adultCount + childCount + elderlyCount;

  // === Buffet Context ===
  int? buffetTierId;
  String? buffetTierName;
  double buffetAdultPrice = 0;
  double buffetChildPrice = 0;

  // === Session Context ===
  @Index()
  bool isOpen = true;
  @Index()
  late DateTime startTime;
  DateTime? endTime;
  int? timeLimitMinutes;  // Synchronized from Tier

  // === Financial Context ===
  late double subtotal;
  late double taxAmount;
  late double total;

  List<OrderItemModel> items = [];
}
```

---

## 3. Domain Layer & Logic

### 3.1 Entity: BuffetTier

```dart
// lib/features/dining/domain/entities/buffet_tier.dart
@freezed
class BuffetTier with _$BuffetTier {
  const factory BuffetTier({
    required String id,
    required String name,
    required double adultPrice,
    required double childPrice,
    @Default(0) double elderlyDiscount,
    int? timeLimitMinutes,
    @Default([]) List<String> excludedCategoryIds,
    String? colorHex,
  }) = _BuffetTier;
}
```

### 3.2 Pricing Engine Logic

```dart
class RestaurantPricingEngine implements OrderPricingEngine {
  const RestaurantPricingEngine();

  @override
  double calculateSubtotal(List<dynamic> items, {Map<String, dynamic>? metadata}) {
    // 1) A la carte subtotal
    double itemsTotal = items.fold(0.0, (sum, item) =>
        sum + (item.product.price * item.quantity));

    // 2) Buffet subtotal (Demographic calculation)
    final adultCount = (metadata?['adultCount'] as int?) ?? 0;
    final childCount = (metadata?['childCount'] as int?) ?? 0;
    final elderlyCount = (metadata?['elderlyCount'] as int?) ?? 0;
    final adultPrice = (metadata?['buffetAdultPrice'] as num?)?.toDouble() ?? 0;
    final childPrice = (metadata?['buffetChildPrice'] as num?)?.toDouble() ?? 0;
    final elderlyDiscount = (metadata?['elderlyDiscount'] as num?)?.toDouble() ?? 0;

    final buffetTotal =
        (adultCount * adultPrice) +
        (childCount * childPrice) +
        (elderlyCount * adultPrice * (1 - elderlyDiscount));

    return itemsTotal + buffetTotal;
  }
}
```

---

## 4. Proposed UI/UX Implementation

### 4.1 Table Opening Interaction

1. User taps table → Dialog appears.
2. Select **Service Type**: [A la Carte] or [Buffet].
3. If **Buffet**: Tier selection grid (Silver/Gold/Platinum) appears.
4. Input **Demographics**: Counters for Adults, Children, Elders.
5. Calculated total preview updates live.

### 4.2 Buffet Session Monitoring

*   **Table Badge**: Shows "Buffet" icon + Tier name.
*   **Active Timer**: Countdown displayed on table card (Green → Orange → Red).

---

## 5. Development Roadmap: Files Affected

### Create
- `lib/features/dining/data/models/buffet_tier_model.dart` (Isar)
- `lib/features/dining/domain/entities/buffet_tier.dart` (Entity)
- `lib/features/dining/domain/repositories/buffet_tier_repository.dart`
- `lib/features/dining/presentation/providers/buffet_tier_providers.dart`
- `lib/features/dining/presentation/widgets/buffet_timer_badge.dart`

### Modify
- `dining_session_model.dart`: Add demographic fields.
- `restaurant_pricing_test.dart`: Extend for tier calculations.
- `data_seeder.dart`: Inject default tiers.
- `bootstrap.dart`: Register new Isar schema.

---

## 6. Verification Criteria

- [x] `BuffetTierModel` schema registered during bootstrap.
- [x] Open Table Dialog allows selecting tiers and demographics.
- [x] Subtotal correctly accounts for Adult/Child/Elderly pricing.
- [x] Timer correctly counts down on table cards.
- [x] Unit tests for pricing logic pass 100%.

---
*Last updated: April 2026*
