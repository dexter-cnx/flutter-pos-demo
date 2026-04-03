# Architecture 00: Multi-Mode Business Framework

> **Status:** Core Foundation  
> **Modules:** `app/mode`, `app/routing`, `app/shell`, `modes/`  
> **Intent:** Enable a single codebase to support diverse business types (Retail, Restaurant, Cafe, etc.) via a capability-based architecture.

---

## 1. Design Philosophy

The system is built on **Capability-Based Design** rather than hardcoded conditional logic. Instead of checking `if (mode == restaurant)`, the application asks `if (currentMode.hasCapability(FeatureCapability.tableManagement))`.

### Core Objectives
- **Decoupling**: Business logic (pricing, receipts) is delegated to mode-specific strategies.
- **Extensibility**: Adding a new mode (e.g., "Clinic") requires creating a new `BusinessModeDefinition` without modifying existing feature code.
- **Dynamic UI**: Navigation and routing are composed at runtime based on the active mode's definition.

---

## 2. Component Architecture

### 2.1 BusinessMode Definition Registry
The `BusinessModeRegistry` acts as a central hub for all supported business types. Each mode must implement the `BusinessModeDefinition` contract:

| Property | Description |
|----------|-------------|
| `id` / `mode` | Unique identifier (Enum: `retail`, `restaurant`). |
| `capabilities` | List of enabled `FeatureCapabilities`. |
| `navItems` | List of `AppNavItems` for the side/bottom navigation. |
| `buildRoutes()` | Mode-specific route overrides/additions. |
| `pricingEngine` | Strategy for calculating totals (e.g., A la carte vs. Buffet). |
| `receiptComposer`| Strategy for formatting print data. |
| `seedDataStrategy`| Initial demo data injection logic. |

### 2.2 Feature Capability System
Capabilities are granular feature flags used to gate UI and logic:
- `productCatalog`, `cart`, `checkout` (Common)
- `inventoryTracking`, `barcodeScanning` (Retail specific)
- `tableManagement`, `diningSession`, `buffetPricing` (Restaurant specific)

### 2.3 Mode-Aware Services
Services like the **Pricing Engine** and **Receipt Composer** are accessed via the `currentModeDefinitionProvider`, ensuring the application automatically switches behavior when the user changes business modes in settings.

---

## 3. Directory Structure

```
lib/
├── app/
│   └── mode/
│       ├── business_mode.dart            (Identity)
│       ├── business_mode_definition.dart (Contract)
│       ├── business_mode_registry.dart   (Registry)
│       ├── current_mode_provider.dart    (State)
│       └── feature_capability.dart       (Flags/Gates)
├── modes/
│   ├── retail/
│   │   ├── retail_mode_definition.dart
│   │   └── retail_seed_data.dart
│   └── restaurant/
│       ├── restaurant_mode_definition.dart
│       └── restaurant_seed_data.dart
```

---

## 4. Navigation & Routing Flow

1.  **Boot**: App initializes and reads the `activeModeId` from local storage (Isar).
2.  **Provider Binding**: The `currentModeDefinitionProvider` resolves the appropriate definition (e.g., `RestaurantModeDefinition`).
3.  **Shell Composition**: The `AppShell` queries `currentMode.navItems` to build the sidebar.
4.  **Router Composition**: The `GoRouter` combines `SharedRoutes` with `currentMode.buildRoutes()`.

---

## 5. Verification Framework

- [x] Application resolves active mode on startup.
- [x] Shell navigation items change dynamically between Retail and Restaurant.
- [x] Pricing calculations use the strategy defined by the active mode.
- [x] Barcode scanning features are hidden when in Restaurant mode.
- [x] Zero "Switch/Case" sprawl for mode checking in Feature widgets.

---
*Last updated: April 2026*
