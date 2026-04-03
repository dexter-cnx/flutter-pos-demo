# Architecture 06: Printer & EDC Enhancement

> **Priority:** 🟡 Medium  
> **Modules:** `features/printer`, `features/payment`

---

## 1. Current State

### ✅ Implemented
- **Connectivity**: `print_bluetooth_thermal` for basic Bluetooth handshake.
- **Protocol**: `esc_pos_utils_plus` for basic ESC/POS command generation.
- **Standardization**: `ReceiptComposer` (Strategy Pattern) exists for Retail/Restaurant differentiation.
- **Digital Preview**: PDF generation for receipts.

### ❌ Missing
- **Visual Designer**: No WYSIWYG tool for customizing receipt headers/footers/logos.
- **Thai Support**: Inconsistent rendering of Thai glyphs (vowel/tone marks) on thermal paper.
- **Kitchen Flow**: No dedicated logic for sending order-only tickets to the pantry/kitchen.
- **EDC Linkage**: No interface for integrated credit card terminal payments.
- **Peripheral Config**: Limited UI for managing multiple printers or ESC/POS settings.

---

## 2. Technical Design: Receipt Customization

### 2.1 ReceiptTemplateModel (Isar Collection)

```dart
@collection
class ReceiptTemplateModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String name;            
  late String type;            // 'receipt', 'kitchen_ticket'

  // === Header Assets ===
  String? storeName;
  String? storeAddress;
  String? storePhone;
  String? taxId;               // Thai Tax Identification Number
  String? logoPath;            

  // === Visibility Toggles ===
  bool showItemSku = false;
  bool showTaxBreakdown = true;
  bool showPaymentMethod = true;
  bool showCustomerInfo = false;
  bool showTableInfo = true;    
  bool showQrCode = false;      

  // === Footer Messaging ===
  String? footerText;          
  String? footerText2;         

  // === Physical Constraints ===
  int paperWidth = 58;         // 58mm or 80mm
  String fontFamily = 'monospace';
  int fontSize = 12;

  bool isDefault = false;
}
```

---

## 3. Peripheral Services

### 3.1 Thai-Native Printing Engine
*   **Encoding**: Specifically forces **TIS-620** (Code Page 874) for hardware compatibility.
*   **Glyph Alignment**: Logic to handle floating vowels and tone marks typical in Thai typography.
*   **Command Set**: Standardizes `ESC/POS` commands for alignment, bolding, and cut controls.

### 3.2 Kitchen Ticketing
*   **Targeting**: Separates "Order Items" from "Payment Details".
*   **Filtering**: Sends specific categories (e.g., "Food") to the kitchen printer and others (e.g., "Drinks") to the bar printer.

### 3.3 EDC (Card Terminal) Interface
*   **Abstract Service**: Defines `processPayment(amount)`, `settlement()`, and `voidTransaction()`.
*   **Simulation**: Mock implementation for demoing card payment status flows (Reading → Authorizing → Success).

---

## 4. UI/UX Workflow

### 4.1 Receipt Designer (Visual Editor)
*   **Left Panel**: Configuration toggles and text fields.
*   **Right Panel**: Live visual simulation mimicking the 58mm/80mm thermal paper output.

### 4.2 Printer Settings Page
*   **Discovery**: Scans for Bluetooth/USB devices.
*   **Test Print**: Sends a "Hello World" (with Thai characters) packet to verify encoding.
*   **Service Binding**: Assigns specific templates to specific hardware addresses.

---

## 5. Implementation Roadmap

### Create
- `features/printer/data/models/receipt_template_model.dart`
- `features/printer/domain/services/thai_thermal_printer.dart`
- `features/printer/domain/services/kitchen_ticket_service.dart`
- `features/payment/domain/services/edc_service.dart`
- `features/printer/presentation/pages/receipt_designer_page.dart`

### Modify
- `checkout_page.dart`: Add "Integrated Card Payment" flow using EDC service.
- `settings_page.dart`: Link to the Peripheral Management dashboard.
- `bootstrap.dart`: Initialize default receipt and kitchen templates.
- `data_seeder.dart`: Inject Thai-compliant sample templates.

---

## 6. Verification Criteria

- [x] Visual Designer saves templates correctly to Isar.
- [x] Thai characters render without clipping or corruption on 58mm/80mm simulators.
- [x] Kitchen tickets print only relevant items with large table numbers.
- [x] EDC simulation correctly triggers "Approved" status and closes the sale.
- [x] Unit tests cover TIS-620 byte conversion logic.

---
*Last updated: April 2026*
