# Flutter POS Multi-Mode Blueprint
## `flutter-pos-demo` → รองรับ `retail` / `restaurant` / future modes

> เอกสารนี้เป็น **repo blueprint** สำหรับพัฒนา `flutter-pos-demo` ให้รองรับ business mode หลายแบบใน repo เดียว  
> โดยเริ่มจาก `retail mode` และ `restaurant mode` และเปิดทางให้เพิ่ม mode อื่นในอนาคต เช่น cafe, clinic counter, warehouse counter

---

## 1. เป้าหมาย

### สิ่งที่ blueprint นี้ต้องการแก้
ปัจจุบัน POS มักเริ่มจาก flow เดียว แล้วเมื่อเพิ่ม use case ใหม่ เช่น ร้านอาหารหรือบุฟเฟต์ จะเริ่มเกิดปัญหา:

- business rules ปนใน UI
- checkout เต็มไปด้วย `if/else`
- data model โตแบบควบคุมยาก
- route และ navigation แตกแขนง
- reusable feature ลดลง
- เพิ่ม business mode ใหม่ทีหลังยาก

### เป้าหมายของโครงนี้
ทำให้แอปสามารถ:

1. ใช้ **shared POS core** ร่วมกัน
2. สลับ **business mode** ได้
3. แยก **feature capabilities** ตาม mode
4. แยก **pricing / receipt / workflow policies** ตาม mode
5. เพิ่ม mode ใหม่ได้โดย **เพิ่ม definition + modules** แทนการแก้ทั้งแอป

---

## 2. ฐานคิดจาก repo ที่ใช้อ้างอิง

### `flutter-pos-demo`
repo นี้ตั้งต้นเป็น Flutter POS demo แบบ offline-first สำหรับร้านค้าไทย โดยระบุ stack และข้อบังคับหลักไว้ชัดเจน เช่น:

- Flutter + Riverpod + go_router
- Clean Architecture
- CSV-first localization
- Isar เป็น local database
- Product Grid + Cart Sidebar
- VAT 7%
- Checkout เงินสด / PromptPay / บัตร
- Receipt Preview + PDF + Print simulation
- Order History
- Seed Data

> อ้างอิงจาก `AGENTS.md` ใน repo `dexter-cnx/flutter-pos-demo`

### `tio-res`
repo นี้มีจุดแข็งฝั่ง restaurant POS โดยเฉพาะ:

- table management
- headcount / entry charge
- buffet + extra items
- Bluetooth thermal printer
- receipt แบบร้านอาหาร
- printer settings
- TTS
- reports / transaction history

> อ้างอิงจาก `README.md` ใน repo `kridsadar357/tio-res`

### ข้อสรุปเชิงสถาปัตยกรรม
โครงที่เหมาะที่สุดคือ:

- shared core จาก `flutter-pos-demo`
- mode-specific business flow ที่เรียนรู้จาก `tio-res`
- capability-based composition
- pricing / receipt strategy
- feature modularization

---

## 3. Architectural Principles

### 3.1 Mode-driven architecture
ระบบต้องไม่ถูกมองว่าเป็น “retail app” หรือ “restaurant app” แบบแข็ง  
แต่ต้องเป็น **POS platform ที่มี active business mode**

### 3.2 Capability-based feature enablement
อย่าใช้ `if (mode == restaurant)` กระจายทั่วโค้ด  
ให้ใช้ **feature capabilities** เป็นตัวเปิด/ปิด behavior และ UI

### 3.3 Strategy-based domain behavior
สิ่งที่ต่างกันตาม mode เช่น:

- pricing
- receipt composition
- session model
- home dashboard
- navigation schema

ต้องแยกเป็น **policy / strategy / definition**

### 3.4 Shared core, mode-specific extensions
สิ่งที่เหมือนกัน เช่น payment, transaction, checkout framework, receipt pipeline  
อยู่ใน shared core

สิ่งที่ต่างกัน เช่น table session, buffet plan, stock movement  
อยู่ใน mode-specific domain/features

### 3.5 UI ต้องบาง
ห้ามใส่ business logic ใน widget  
business logic อยู่ใน:

- domain services
- use cases
- pricing engines
- receipt composers
- repositories

---

## 4. Target Architecture

```text
App Core
├─ Bootstrap
├─ Config
├─ Routing
├─ App Shell
└─ Business Mode System

Shared POS Core
├─ Shared Domain
├─ Shared Data
├─ Shared Presentation
└─ Common Services

Mode Layer
├─ Retail Mode
├─ Restaurant Mode
└─ Future Modes

Feature Layer
├─ Catalog
├─ Cart
├─ Checkout
├─ Receipt
├─ Payment
├─ History
├─ Reporting
├─ Settings
├─ Printer
├─ Inventory
├─ Tables
└─ Dining
```

---

## 5. Recommended Repo Structure

```text
lib/
  app/
    bootstrap/
      app_bootstrap.dart
      dependency_bootstrap.dart
    config/
      app_config.dart
    routing/
      app_router.dart
      route_registry.dart
    shell/
      app_shell.dart
      app_nav_item.dart
    mode/
      business_mode.dart
      business_mode_definition.dart
      business_mode_registry.dart
      current_mode_provider.dart
      feature_capability.dart
      mode_feature_gate.dart

  core/
    constants/
    errors/
    utils/
    result/
    money/
    localization/
    design_system/

  shared/
    domain/
      entities/
      value_objects/
      repositories/
      services/
      usecases/
    data/
      models/
      datasources/
      repositories/
    presentation/
      providers/
      widgets/

  modes/
    retail/
      retail_mode_definition.dart
      retail_module_registry.dart
      retail_seed_data.dart
    restaurant/
      restaurant_mode_definition.dart
      restaurant_module_registry.dart
      restaurant_seed_data.dart

  features/
    auth/
    catalog/
    cart/
    checkout/
    receipt/
    payment/
    order_history/
    reporting/
    settings/
    printer/
    inventory/
    tables/
    dining/
```

---

## 6. Business Mode Model

## 6.1 Base enum

```dart
enum BusinessMode {
  retail,
  restaurant,
}
```

enum นี้ใช้เป็น identity ขั้นพื้นฐาน  
แต่ **อย่าใช้ enum ตัวเดียวเป็นสถาปัตยกรรมทั้งหมด**

## 6.2 BusinessModeDefinition contract

```dart
abstract class BusinessModeDefinition {
  BusinessMode get mode;
  String get id;
  String get displayName;

  List<FeatureCapability> get capabilities;
  List<AppNavItem> get navItems;
  List<RouteBase> buildRoutes();

  OrderPricingEngine get pricingEngine;
  ReceiptComposer get receiptComposer;
  SeedDataStrategy get seedDataStrategy;
}
```

### ความหมาย
mode definition ต้องเป็นตัวอธิบายครบว่า mode นี้:

- ชื่ออะไร
- เปิด feature ไหน
- มี navigation อะไร
- ใช้ pricing engine แบบไหน
- ใช้ receipt composer แบบไหน
- seed demo data แบบไหน

---

## 7. FeatureCapability Model

```dart
enum FeatureCapability {
  productCatalog,
  cart,
  checkout,
  receipt,
  orderHistory,
  reporting,
  inventoryTracking,
  barcodeScanning,
  promptPayPayment,
  cardPayment,
  printerSupport,

  tableManagement,
  diningSession,
  headcountPricing,
  buffetPricing,
  extraChargeItems,
  kitchenTicket,
  splitBill,
}
```

## 7.1 Retail capabilities

```dart
const retailCapabilities = [
  FeatureCapability.productCatalog,
  FeatureCapability.cart,
  FeatureCapability.checkout,
  FeatureCapability.receipt,
  FeatureCapability.orderHistory,
  FeatureCapability.reporting,
  FeatureCapability.inventoryTracking,
  FeatureCapability.barcodeScanning,
  FeatureCapability.promptPayPayment,
  FeatureCapability.cardPayment,
  FeatureCapability.printerSupport,
];
```

## 7.2 Restaurant capabilities

```dart
const restaurantCapabilities = [
  FeatureCapability.productCatalog,
  FeatureCapability.cart,
  FeatureCapability.checkout,
  FeatureCapability.receipt,
  FeatureCapability.orderHistory,
  FeatureCapability.reporting,
  FeatureCapability.printerSupport,
  FeatureCapability.tableManagement,
  FeatureCapability.diningSession,
  FeatureCapability.headcountPricing,
  FeatureCapability.buffetPricing,
  FeatureCapability.extraChargeItems,
  FeatureCapability.promptPayPayment,
  FeatureCapability.cardPayment,
];
```

## 7.3 หลักสำคัญ
ห้ามเขียนแบบนี้ทั่วแอป:

```dart
if (mode == BusinessMode.restaurant) ...
```

ให้เขียนแบบนี้แทน:

```dart
final enabled = ref.watch(
  featureAvailabilityProvider(FeatureCapability.tableManagement),
);
```

---

## 8. Mode Definitions

## 8.1 RetailModeDefinition

```dart
class RetailModeDefinition implements BusinessModeDefinition {
  @override
  BusinessMode get mode => BusinessMode.retail;

  @override
  String get id => 'retail';

  @override
  String get displayName => 'Retail';

  @override
  List<FeatureCapability> get capabilities => const [
        FeatureCapability.productCatalog,
        FeatureCapability.cart,
        FeatureCapability.checkout,
        FeatureCapability.receipt,
        FeatureCapability.orderHistory,
        FeatureCapability.reporting,
        FeatureCapability.inventoryTracking,
        FeatureCapability.barcodeScanning,
        FeatureCapability.promptPayPayment,
        FeatureCapability.cardPayment,
        FeatureCapability.printerSupport,
      ];

  @override
  OrderPricingEngine get pricingEngine => RetailPricingEngine();

  @override
  ReceiptComposer get receiptComposer => RetailReceiptComposer();

  @override
  SeedDataStrategy get seedDataStrategy => RetailSeedDataStrategy();

  @override
  List<AppNavItem> get navItems => const [
        AppNavItem(id: 'pos', labelKey: 'nav.pos', route: '/pos'),
        AppNavItem(id: 'history', labelKey: 'nav.history', route: '/history'),
        AppNavItem(id: 'inventory', labelKey: 'nav.inventory', route: '/inventory'),
        AppNavItem(id: 'settings', labelKey: 'nav.settings', route: '/settings'),
      ];

  @override
  List<RouteBase> buildRoutes() => RetailRoutes.build();
}
```

### Retail mode behavior
เหมาะกับ:

- ร้านค้าทั่วไป
- minimart
- counter sales
- quick checkout

### Retail focus
- barcode scan
- stock movement
- fast cart flow
- VAT / discount / change
- printed receipt แบบขายปลีก

---

## 8.2 RestaurantModeDefinition

```dart
class RestaurantModeDefinition implements BusinessModeDefinition {
  @override
  BusinessMode get mode => BusinessMode.restaurant;

  @override
  String get id => 'restaurant';

  @override
  String get displayName => 'Restaurant';

  @override
  List<FeatureCapability> get capabilities => const [
        FeatureCapability.productCatalog,
        FeatureCapability.cart,
        FeatureCapability.checkout,
        FeatureCapability.receipt,
        FeatureCapability.orderHistory,
        FeatureCapability.reporting,
        FeatureCapability.printerSupport,
        FeatureCapability.tableManagement,
        FeatureCapability.diningSession,
        FeatureCapability.headcountPricing,
        FeatureCapability.buffetPricing,
        FeatureCapability.extraChargeItems,
        FeatureCapability.promptPayPayment,
        FeatureCapability.cardPayment,
      ];

  @override
  OrderPricingEngine get pricingEngine => RestaurantPricingEngine();

  @override
  ReceiptComposer get receiptComposer => RestaurantReceiptComposer();

  @override
  SeedDataStrategy get seedDataStrategy => RestaurantSeedDataStrategy();

  @override
  List<AppNavItem> get navItems => const [
        AppNavItem(id: 'tables', labelKey: 'nav.tables', route: '/tables'),
        AppNavItem(id: 'history', labelKey: 'nav.history', route: '/history'),
        AppNavItem(id: 'reports', labelKey: 'nav.reports', route: '/reports'),
        AppNavItem(id: 'settings', labelKey: 'nav.settings', route: '/settings'),
      ];

  @override
  List<RouteBase> buildRoutes() => RestaurantRoutes.build();
}
```

### Restaurant mode behavior
เหมาะกับ:

- restaurant
- buffet
- all-you-can-eat
- dine-in session based sales

### Restaurant focus
- tables
- headcount
- buffet + extra items
- dining sessions
- printer flow
- restaurant receipt

---

## 9. Business Mode Registry

```dart
class BusinessModeRegistry {
  BusinessModeRegistry({
    required Map<BusinessMode, BusinessModeDefinition> definitions,
  }) : _definitions = definitions;

  final Map<BusinessMode, BusinessModeDefinition> _definitions;

  BusinessModeDefinition get(BusinessMode mode) {
    final definition = _definitions[mode];
    if (definition == null) {
      throw UnsupportedError('No definition registered for $mode');
    }
    return definition;
  }
}
```

## Provider setup

```dart
final businessModeRegistryProvider = Provider<BusinessModeRegistry>((ref) {
  return BusinessModeRegistry(
    definitions: {
      BusinessMode.retail: RetailModeDefinition(),
      BusinessMode.restaurant: RestaurantModeDefinition(),
    },
  );
});

final currentModeDefinitionProvider = Provider<BusinessModeDefinition>((ref) {
  final mode = ref.watch(currentBusinessModeProvider);
  final registry = ref.watch(businessModeRegistryProvider);
  return registry.get(mode);
});

final featureAvailabilityProvider =
    Provider.family<bool, FeatureCapability>((ref, capability) {
  final definition = ref.watch(currentModeDefinitionProvider);
  return definition.capabilities.contains(capability);
});
```

---

## 10. App Startup Flow

```text
App Start
→ load app profile
→ read activeModeId
→ resolve BusinessModeDefinition
→ register dependencies
→ build routes
→ build nav menu
→ seed mode-specific demo data
→ render app shell
```

## Startup responsibilities
1. load app config
2. load persisted active mode
3. build mode definition
4. register modules / dependencies
5. build router
6. seed data
7. open home route

---

## 11. App Shell Design

เพราะ POS ใช้งานบน tablet landscape เป็นหลัก  
จึงควรมี shell กลางตัวเดียว

```text
AppShell
├─ Top Bar
├─ Left Navigation Rail / Sidebar
├─ Main Content Area
└─ Optional Secondary Pane
```

## Example shell contract

```dart
class AppShell extends ConsumerWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(currentModeDefinitionProvider);

    return Scaffold(
      body: Row(
        children: [
          PosSidebar(navItems: mode.navItems),
          Expanded(child: child),
        ],
      ),
    );
  }
}
```

## Retail shell
เมนูหลัก:
- POS
- History
- Inventory
- Settings

## Restaurant shell
เมนูหลัก:
- Tables
- History
- Reports
- Settings

---

## 12. Routing Strategy

## 12.1 Shared routes
routes ที่ใช้ได้ทุก mode:

- `/login`
- `/settings`
- `/checkout`
- `/receipt-preview`
- `/history`

## 12.2 Retail routes
- `/pos`
- `/inventory`
- `/barcode-scan`

## 12.3 Restaurant routes
- `/tables`
- `/table/:id`
- `/dining/session/:sessionId`

## 12.4 Router composition

```dart
final goRouterProvider = Provider<GoRouter>((ref) {
  final definition = ref.watch(currentModeDefinitionProvider);

  return GoRouter(
    initialLocation: '/home',
    routes: [
      ...SharedRoutes.build(),
      ...definition.buildRoutes(),
    ],
  );
});
```

---

## 13. Shared Domain Model

## 13.1 Shared entities
สิ่งที่ควรอยู่ใน shared domain:

- `Product`
- `Category`
- `CartLine`
- `Payment`
- `Receipt`
- `Transaction`
- `AppProfile`
- `StoreProfile`
- `TaxRule`

```text
shared/domain/entities/
  product.dart
  category.dart
  cart_line.dart
  payment.dart
  receipt.dart
  transaction.dart
  app_profile.dart
  store_profile.dart
  tax_rule.dart
```

## 13.2 Shared value objects
- `Money`
- `Percentage`
- `Quantity`
- `PhoneNumber`
- `LocaleCode`

---

## 14. Mode-specific Domain Model

## 14.1 Retail-specific domain

```text
retail/domain/entities/
  retail_sale_session.dart
  barcode.dart
  stock_movement.dart
  inventory_adjustment.dart
```

### ความหมาย
- `RetailSaleSession` = รอบการขาย
- `Barcode` = barcode mapping
- `StockMovement` = movement ของสินค้า
- `InventoryAdjustment` = ปรับสต็อก

## 14.2 Restaurant-specific domain

```text
restaurant/domain/entities/
  dining_table.dart
  table_session.dart
  headcount.dart
  buffet_plan.dart
  menu_inclusion_rule.dart
  extra_charge_line.dart
```

### ความหมาย
- `DiningTable` = โต๊ะ
- `TableSession` = session ของโต๊ะ
- `Headcount` = จำนวนผู้ใหญ่/เด็ก
- `BuffetPlan` = แผนราคาบุฟเฟต์
- `MenuInclusionRule` = รายการไหนรวมใน buffet
- `ExtraChargeLine` = รายการคิดเพิ่ม

---

## 15. Aggregate Design

## 15.1 RetailSaleAggregate

```text
RetailSaleAggregate
- saleSession
- cartLines
- subtotal
- vat
- discount
- grandTotal
- paymentState
```

### หน้าที่
ใช้รวม business state ของการขายปลีกหนึ่งรอบ

## 15.2 RestaurantOrderAggregate

```text
RestaurantOrderAggregate
- tableSession
- headcount
- buffetCharges
- orderedItems
- extraCharges
- subtotal
- serviceCharge
- vat
- grandTotal
- paymentState
```

### หน้าที่
ใช้รวม business state ของ dining session หนึ่งโต๊ะ

---

## 16. Pricing Engine Strategy

Pricing ห้ามอยู่ใน widget  
ต้องแยกเป็น strategy/service

```dart
abstract class OrderPricingEngine {
  PricingResult calculate(OrderContext context);
}
```

## 16.1 RetailPricingEngine
รับผิดชอบ:

- subtotal
- VAT 7%
- discount
- rounding
- change calculation

## 16.2 RestaurantPricingEngine
รับผิดชอบ:

- adult/child headcount pricing
- buffet plan pricing
- included items = 0
- extra charge items
- service charge ในอนาคต
- VAT / change

## Recommendation
checkout screen ควรเรียกแค่:

```dart
final pricing = ref.read(currentModeDefinitionProvider).pricingEngine;
final result = pricing.calculate(context);
```

---

## 17. Receipt Composition Strategy

การสร้าง receipt ต้องแยกจากการ render PDF/print

```dart
abstract class ReceiptComposer {
  ReceiptDocument compose(Transaction transaction);
}
```

## 17.1 RetailReceiptComposer
สร้าง:
- store header
- product lines
- subtotal
- VAT
- payment summary
- change
- footer

## 17.2 RestaurantReceiptComposer
สร้าง:
- table no
- session info
- headcount summary
- buffet section
- extra items section
- payment summary
- footer

## 17.3 ข้อดี
- receipt template เปลี่ยนตาม mode ได้
- print / pdf / preview ใช้ pipeline เดียวกัน
- test ได้ง่าย

---

## 18. Printer Architecture

```text
features/printer/
  domain/
    entities/
      printer_device.dart
      printer_profile.dart
    repositories/
      printer_repository.dart
    services/
      receipt_print_service.dart
  data/
    repositories/
      bluetooth_printer_repository_impl.dart
    datasources/
      bluetooth_printer_datasource.dart
  presentation/
    screens/
      printer_settings_screen.dart
      printer_scan_screen.dart
```

## Contract

```dart
abstract class PrinterRepository {
  Future<List<PrinterDevice>> scan();
  Future<void> connect(String id);
  Future<void> disconnect();
  Future<void> printReceipt(ReceiptDocument doc);
  Future<void> testPrint();
}
```

## หมายเหตุ
ฝั่ง restaurant สามารถ reuse แนวคิดจาก `tio-res` ได้มาก  
แต่ใน `flutter-pos-demo` ควรวางผ่าน abstraction นี้เท่านั้น  
ไม่ให้ plugin ลอยเข้าไปถึง feature อื่น

---

## 19. Data Layer / Isar Design

## 19.1 Shared collections

```text
products
categories
transactions
payments
receipt_snapshots
app_profiles
store_profiles
settings_entries
```

## 19.2 Retail collections

```text
retail_sale_sessions
stock_movements
inventory_adjustments
```

## 19.3 Restaurant collections

```text
dining_tables
table_sessions
buffet_plans
restaurant_order_lines
restaurant_extra_charge_lines
```

## 19.4 AppProfileModel

```dart
@collection
class AppProfileModel {
  Id id = Isar.autoIncrement;

  late String activeModeId; // retail, restaurant
  late String storeName;
  late String localeCode;
  late String themeMode;
  late DateTime updatedAt;
}
```

### หมายเหตุ
ระยะแรกแนะนำให้รองรับ **single active mode**
ก่อนจะขยายไป multi-profile ในอนาคต

---

## 20. Settings Architecture

## 20.1 Shared settings
- language
- theme
- store profile
- default tax
- receipt footer
- default printer

## 20.2 Retail settings
- barcode auto-add
- low stock threshold
- cash rounding
- inventory warning behavior

## 20.3 Restaurant settings
- table count
- buffet plans
- child pricing rules
- service charge toggle
- printer-after-checkout
- TTS total announcement

---

## 21. Seed Data Strategy

```dart
abstract class SeedDataStrategy {
  Future<void> seedIfNeeded();
}
```

## 21.1 RetailSeedDataStrategy
seed:
- 15 สินค้าไทย
- barcode examples
- starting stock
- mock transactions

## 21.2 RestaurantSeedDataStrategy
seed:
- 12 โต๊ะ
- buffet plans adult/child
- included menu items
- extra charge items
- printer profile example

---

## 22. Feature Boundaries

## 22.1 Shared features
- `auth`
- `catalog`
- `cart`
- `checkout`
- `receipt`
- `payment`
- `order_history`
- `reporting`
- `settings`
- `printer`

## 22.2 Retail-only features
- `inventory`
- `barcode`

## 22.3 Restaurant-only features
- `tables`
- `dining`
- `buffet`

---

## 23. Suggested First File Set

```text
lib/app/mode/business_mode.dart
lib/app/mode/business_mode_definition.dart
lib/app/mode/business_mode_registry.dart
lib/app/mode/current_mode_provider.dart
lib/app/mode/feature_capability.dart

lib/modes/retail/retail_mode_definition.dart
lib/modes/retail/retail_seed_data.dart

lib/modes/restaurant/restaurant_mode_definition.dart
lib/modes/restaurant/restaurant_seed_data.dart

lib/shared/domain/entities/app_profile.dart
lib/shared/domain/entities/transaction.dart
lib/shared/domain/entities/payment.dart
lib/shared/domain/value_objects/money.dart

lib/features/checkout/domain/services/order_pricing_engine.dart
lib/features/checkout/domain/services/retail_pricing_engine.dart
lib/features/checkout/domain/services/restaurant_pricing_engine.dart

lib/features/receipt/domain/services/receipt_composer.dart
lib/features/receipt/domain/services/retail_receipt_composer.dart
lib/features/receipt/domain/services/restaurant_receipt_composer.dart

lib/features/printer/domain/repositories/printer_repository.dart
lib/features/printer/presentation/screens/printer_settings_screen.dart
```

---

## 24. Development Phases

## Phase 1 — Mode infrastructure
### Goal
วางแกน mode system ให้ครบก่อน

### Tasks
- เพิ่ม `BusinessMode`
- เพิ่ม `BusinessModeDefinition`
- เพิ่ม `BusinessModeRegistry`
- เพิ่ม `current_mode_provider`
- เพิ่ม `featureAvailabilityProvider`
- persist `activeModeId`

### Done when
- app อ่าน active mode ได้
- nav เปลี่ยนตาม mode ได้
- route เปลี่ยนตาม mode ได้

---

## Phase 2 — Shared checkout / receipt framework
### Goal
ย้าย checkout และ receipt ไปอยู่บน strategy layer

### Tasks
- เพิ่ม `OrderPricingEngine`
- เพิ่ม `ReceiptComposer`
- แยก `Money`, `Transaction`, `Payment`
- refactor checkout ให้เรียกผ่าน engine
- refactor receipt preview ให้เรียกผ่าน composer

### Done when
- retail กับ restaurant ใช้ checkout pipeline เดียวกัน
- แต่คำนวณและ render ต่างกันได้

---

## Phase 3 — Finish retail mode
### Goal
ทำ retail mode ให้เป็น baseline mode ที่เสร็จก่อน

### Tasks
- POS main screen
- product grid
- cart sidebar
- checkout
- history
- inventory basic
- barcode basic

### Done when
- retail mode ใช้งาน flow ขายปลีกได้ครบ

---

## Phase 4 — Add restaurant mode
### Goal
นำ restaurant business flow เข้ามาแบบไม่ทำลาย shared core

### Tasks
- tables feature
- dining session feature
- buffet/headcount pricing
- extra-charge logic
- restaurant receipt
- printer settings
- printer after checkout

### Done when
- restaurant mode เปิดโต๊ะ → สั่งอาหาร → คิดหัว → เช็กเอาต์ → พิมพ์ใบเสร็จ ได้ครบ

---

## 25. Anti-patterns ที่ต้องหลีกเลี่ยง

### ห้ามทำ
- ใส่ `if (mode == ...)` กระจายทั้ง app
- เอา table/headcount ไปยัดใน shared entity ทุกตัว
- คิดราคาใน widget
- print logic ตรงจาก checkout screen
- route hardcoded แบบ retail-only
- ใช้ model กลางก้อนใหญ่ตัวเดียวสำหรับทุก mode

### ควรทำ
- ใช้ mode definition
- ใช้ capability gates
- ใช้ strategy/service
- แยก aggregate ตาม mode
- แยก data collections ตามขอบเขต

---

## 26. Future Modes ที่โครงนี้รองรับ

โครงนี้ตั้งใจรองรับการเพิ่ม mode ใหม่ได้ เช่น:

### Cafe mode
- มี table management
- ไม่มี buffet pricing
- อาจมี kitchen ticket
- มี dine-in + take-away

### Clinic counter mode
- ไม่มี cart แบบ retail เต็มรูป
- มี queue/session
- มี invoice/receipt ต่างรูปแบบ

### Warehouse counter mode
- inventory หนัก
- barcode หนัก
- checkout เบา
- reporting หนัก

### Beauty / service counter mode
- appointment/session
- service package
- optional product sales

---

## 27. Blueprint Summary

### Architectural formula
**Shared POS Core + Business Mode Definitions + Capability Gates + Strategy Engines + Mode-specific Modules**

### สิ่งที่ได้
1. retail กับ restaurant อยู่ใน repo เดียวกันได้
2. future mode เพิ่มได้ง่ายขึ้น
3. reuse shared checkout/payment/receipt pipeline ได้
4. business logic ไม่ไหลเข้า UI
5. data model ไม่พังเมื่อขยายระบบ

---

## 28. Recommended Next Deliverables

หลังจาก blueprint นี้ เอกสาร/ไฟล์ที่ควรทำต่อทันทีคือ:

1. `business_mode.dart`
2. `business_mode_definition.dart`
3. `feature_capability.dart`
4. `business_mode_registry.dart`
5. `current_mode_provider.dart`
6. `order_pricing_engine.dart`
7. `receipt_composer.dart`
8. `retail_mode_definition.dart`
9. `restaurant_mode_definition.dart`
10. `app_profile.dart`

---

## 29. Prompt Seed for Codex / Claude Code

```md
Read AGENTS.md first.

Task:
Implement a mode-driven architecture for flutter-pos-demo that supports:
- retail mode
- restaurant mode
- future extensibility for more business modes

Constraints:
- Keep Clean Architecture
- Keep Riverpod + go_router + Isar
- No business logic in widgets
- Add business mode infrastructure first
- Use capability-based feature availability
- Separate pricing and receipt composition via strategies

Deliver:
1. business_mode.dart
2. business_mode_definition.dart
3. business_mode_registry.dart
4. current_mode_provider.dart
5. feature_capability.dart
6. retail_mode_definition.dart
7. restaurant_mode_definition.dart
8. order_pricing_engine.dart
9. receipt_composer.dart
10. app_profile.dart

Response format:
1. Task Summary
2. Files Created / Modified
3. Verification Result
4. Next Recommended Step
5. Artifacts
```

---

## 30. Source Notes

เอกสารนี้สรุปและออกแบบต่อยอดจากแนวทางใน 2 repo หลัก:

- `dexter-cnx/flutter-pos-demo`
  - จุดสำคัญ: offline-first POS demo, Clean Architecture, Riverpod, go_router, Isar, CSV-first localization, must-have scope
- `kridsadar357/tio-res`
  - จุดสำคัญ: restaurant POS, table management, buffet/headcount logic, extra-charge items, printer integration, settings, reports

> Blueprint นี้ไม่ได้คัดลอกโค้ดจาก repo อื่นโดยตรง  
> แต่ใช้เป็น architectural interpretation เพื่อวางโครงสำหรับ repo เป้าหมาย
