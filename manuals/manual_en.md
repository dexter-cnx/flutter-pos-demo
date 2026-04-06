# Thai POS App Foundation Manual (EN)

## 🏗 Architecture Overview
This application follows **Clean Architecture** combined with **Riverpod** for state management and **Isar** for offline-first persistence. 
- **Presentation**: UI, Notifiers, and Providers.
- **Domain**: Business logic, Entities, and Repository interfaces.
- **Data**: Implementation of repositories and DataSources (Isar).

---

## 🏬 1. Core Retail Features
### 🛍 1.1 POS (Point of Sale) & Mobile Scanner
**Workflow:**
1. **Browse**: Open **POS** tab. Filter products by **Category**.
2. **Scan**: To quickly add items, tap the **Scanner** icon (Camera). Use your mobile camera to scan the product's barcode/QR.
3. **Cart**: Tap a product card to add manually. Slide to adjust quantities in the side-bar.
**Code Reference (Relative):**
- [../lib/features/pos/presentation/pages/pos_page.dart](../lib/features/pos/presentation/pages/pos_page.dart)

### 📦 1.2 Inventory & Stock
**Workflow:**
1. **View**: Open **Inventory** tab.
2. **Alerts**: Items with low stock are highlighted.
3. **Restock**: Select an item to perform a stock adjustment manually.
**Code Reference (Relative):**
- [../lib/features/inventory/presentation/pages/inventory_page.dart](../lib/features/inventory/presentation/pages/inventory_page.dart)

---

## 🏬 2. Business Modes (Retail vs Restaurant)
### Workflow:
1. **Selection**: Go to **Settings** -> **Business Mode** card.
2. **Restaurant Mode**: Rebinds navigation to show **Tables/Floor Plan**.
3. **Retail Mode**: Standard grid-first checkout.
**Code Reference (Relative):**
- [../lib/app/mode/business_mode_registry.dart](../lib/app/mode/business_mode_registry.dart)

---

## 💳 3. Checkout & Finance
### 💰 3.1 Payment Methods
**Workflow:**
1. **Cash**: Input received amount.
2. **PromptPay (Thai QR)**: Generates a QR code for the bank app scan.
**Code Reference (Relative):**
- [../lib/features/checkout/presentation/pages/checkout_page.dart](../lib/features/checkout/presentation/pages/checkout_page.dart)

### 🇹🇭 3.2 Thai Utilities
**Workflow:**
1. **Currency**: Automated ฿ formatting.
2. **VAT**: 7% Tax inclusion/exclusion.
**Code Reference (Relative):**
- [../lib/core/money/thai_currency_formatter.dart](../lib/core/money/thai_currency_formatter.dart)
- [../lib/core/money/tax_calculator.dart](../lib/core/money/tax_calculator.dart)

---

## 📜 4. Hardware: Printer & Receipt
### 🖨 4.1 Bluetooth Printer Setup
**Workflow:**
1. **Connection**: Go to **Settings** -> **Printer Settings**. Click **Refresh** to find paired Bluetooth devices.
2. **Link**: Tap **Connect** on your thermal printer. Once connected, the status badge turns green.
3. **Default**: Use **Set as Default** so the app remembers the printer for future sales.
**Code Reference (Relative):**
- [../lib/features/printer/presentation/screens/printer_settings_screen.dart](../lib/features/printer/presentation/screens/printer_settings_screen.dart)

### 🎨 4.2 Receipt Designer & History
**Workflow:**
1. **Designer**: In Printer Settings, click **Receipt Designer**. Toggle Logo, Tax ID, or Footer visibility.
2. **Reprint**: Open **History** -> Select Order -> Click **Reprint**.
**Code Reference (Relative):**
- [../lib/features/printer/presentation/screens/receipt_designer_screen.dart](../lib/features/printer/presentation/screens/receipt_designer_screen.dart)
- [../lib/features/orders/presentation/pages/order_history_page.dart](../lib/features/orders/presentation/pages/order_history_page.dart)

---

## 🔐 5. Security & Administration
### 👮 5.1 RBAC & Audit Trail
**Workflow:**
1. **Auth**: Enter correct Staff/Admin PIN.
2. **Audit**: Go to **Settings** -> **Audit Log** to review logs.
**Code Reference (Relative):**
- [../lib/shared/presentation/widgets/permission_guard.dart](../lib/shared/presentation/widgets/permission_guard.dart)
- [../lib/shared/domain/services/audit_service.dart](../lib/shared/domain/services/audit_service.dart)

---

## ⚙️ 6. Maintenance & Backup
### Workflow:
1. **Maintenance**: Use **Job Queue Manager** to manage failed prints.
2. **Backup**: Export database locally via **Settings**.
**Code Reference (Relative):**
- [../lib/features/settings/presentation/pages/job_queue_viewer_page.dart](../lib/features/settings/presentation/pages/job_queue_viewer_page.dart)
- [../lib/features/settings/presentation/pages/settings_page.dart](../lib/features/settings/presentation/pages/settings_page.dart)
