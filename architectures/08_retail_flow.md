# Architecture 08: Retail Operations Flow

> **Status:** Reference Implementation  
> **Modules:** `features/catalog`, `features/cart`, `modes/retail`  
> **Intent:** Provide a high-velocity, product-centric POS experience for counter-sales and general retail environments.

---

## 1. Operational Logic

Retail mode is optimized for **Throughput** and **Simplicity**. It follows a linear, non-stateful transaction flow (Transaction-first).

### Core Lifecycle
1.  **Direct Cart Entry**: Items are added via categories, searching, or (scaffolded) barcode scanning.
2.  **Immediate Adjustment**: Quantities and discounts are applied directly to the line items in the sidebar.
3.  **Unified Checkout**: Single-step payment finalization using the shared payment framework.
4.  **Transaction archival**: Sale is recorded, stock is decremented (if applicable), and a receipt is issued immediately.

---

## 2. Technical Components

### 2.1 Inventory & Catalog
*   **RetailCatalogProvider**: Optimized for quick filtering by category and text search.
*   **Stock Ledger Hook**: A post-transaction trigger that decrements Isar-based `ProductModel.stockQuantity` upon sale completion.

### 2.2 Retail Pricing Engine
The engine calculates totals based on:
- **Unit Pricing**: Standard `quantity * price` logic.
- **VAT 7%**: Calculation is integrated into the subtotal/total chain.
- **Tender Calculation**: Handles "Cash Received" and calculates "Change Due" accurately.

### 2.3 Receipt Composition
The `RetailReceiptComposer` provides a compact format containing:
- Transaction ID (UUID or incremental).
- Simplified line items (Name, Qty, Total).
- Summary of Cash Tendered and Change given.

---

## 3. Data Integration

### 3.1 Retail Seed Data
The mode provides a diverse product set:
- **Categories**: Beverages, Snacks, Personal Care, Dry Goods.
- **Attributes**: Every product includes a SKU, Price, and initial Stock count.
- **Barcodes**: Sample EAN-13 codes are attached to products for future barcode lookup testing.

---

## 4. Navigation & Routing

| Route | Purpose |
|-------|---------|
| `/retail/pos` | The primary sales interface (Grid + Cart). |
| `/retail/inventory` | Simple stock visibility and management screen. |
| `/retail/history` | Transaction-only history filter. |

---

## 5. Verification Checklist

- [x] End-to-end flow from Catalog -> Cart -> Checkout -> History is stable.
- [x] Pricing engine handles floating-point VAT calculations correctly.
- [x] Cart preserves state across navigation within the same session.
- [x] Barcode scaffolding accepts input and triggers product lookup (mock).
- [x] Receipt output is consistent with Thai retail standards.

---
*Last updated: April 2026*
