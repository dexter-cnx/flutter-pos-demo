# Architecture 03: Loyalty & CRM System

> **Priority:** 🟡 Medium  
> **Modules:** `features/customer` (New)

---

## 1. Current State

### ✅ Implemented
- `OrderModel` — Basic sales recording in Isar.
- `CheckoutPage` — Multi-payment support (Cash / QR / Card).

### ❌ Missing
- **Customer Profiles**: No registry for members or repeat buyers.
- **Points Ledger**: No tracking for loyalty point earnings.
- **Promotion Engine**: No logic for discounts, coupons, or tiered offers.
- **Discovery**: No phone-based lookup during the sale.
- **Purchase History**: No linkage between orders and specific customers.

---

## 2. Technical Design: Data Layer

### 2.1 CustomerModel (Isar Collection)

```dart
@collection
class CustomerModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String phone;           // Unique identifier (Primary Key)

  late String name;
  String? email;
  String? note;                // Allergies, seat preferences, etc.

  // === Loyalty Metrics ===
  double points = 0;           
  double totalSpent = 0;       // Lifetime value (LTV)
  int visitCount = 0;          

  // === Membership Tier ===
  String memberTier = 'regular'; // 'regular', 'silver', 'gold', 'vip'

  @Index()
  DateTime createdAt = DateTime.now();
  DateTime? lastVisitAt;

  bool isActive = true;
}
```

### 2.2 PromotionModel (Isar Collection)

```dart
@collection
class PromotionModel {
  Id id = Isar.autoIncrement;

  late String name;            // e.g., '10% Member Early Bird'
  late String type;            // 'percentage', 'fixed', 'points_redeem'

  double? discountPercent;     // 0.10 for 10%
  double? discountAmount;      
  double? pointsRequired;     

  // === Eligibility Rules ===
  double? minSpend;            
  String? applicableTier;      // null = all tiers
  List<String> applicableDays = []; 
  
  DateTime? startDate;
  DateTime? endDate;

  bool isActive = true;

  @Index()
  int sortOrder = 0;
}
```

---

## 3. Domain Logic: Points & Tiers

### 3.1 Points Engine
*   **Accrual Rate**: 1 Point per ฿25 spent (configurable).
*   **Redemption**: Points can be traded for fixed currency discounts.

### 3.2 Tier Progression
| Tier | Threshold (LTV) | Default Benefit |
|------|-----------------|-----------------|
| Regular | ฿0+ | 0% Discount |
| Silver | ฿5,000+ | 5% Discount |
| Gold | ฿20,000+ | 10% Discount |
| VIP | ฿50,000+ | 15% Discount |

---

## 4. UI/UX Workflow

### 4.1 Lookup & Checkout Integration
1.  **Search Widget**: On top of the Checkout sidebar, a search field appears.
2.  **Autocomplete**: Typing a partial phone number or name displays matches.
3.  **Member Context**: Upon selection, the member's tier, points, and available discounts are fetched.
4.  **Application**: User taps "Apply Tier Discount" to adjust the subtotal instantly.
5.  **Post-Sale**: Loyalty points are awarded automatically upon transaction success.

### 4.2 Membership Management
*   **List View**: Searchable directory of all customers with quick stats.
*   **Detail View**: Full purchase history and manual point adjustment (Admin only).

---

## 5. Implementation Roadmap

### Create
- `features/customer/data/models/customer_model.dart`
- `features/customer/domain/services/points_calculator.dart`
- `features/customer/presentation/pages/customer_list_page.dart`
- `features/customer/presentation/widgets/customer_search_widget.dart`

### Modify
- `order_model.dart`: Link to `customerId` and track `pointsEarned`.
- `checkout_page.dart`: Embed Customer Search and Promotion logic.
- `bootstrap.dart`: Register Customer/Promotion schemas.
- `data_seeder.dart`: Inject sample members.

---

## 6. Verification Criteria

- [x] Create/Update customer profiles with unique phone validation.
- [x] Instant lookup during checkout (Phone/Name).
- [x] Tier-based discounts apply correctly to order subtotal.
- [x] Points are accrued and recorded in the order history.
- [x] Automatic tier progression as lifetime spend crosses thresholds.
- [x] Performance: High-speed search even with 1,000+ members.

---
*Last updated: April 2026*
