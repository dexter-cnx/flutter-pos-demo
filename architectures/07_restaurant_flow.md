# Architecture 07: Restaurant Operations Flow

> **Status:** Implementation Complete  
> **Modules:** `features/tables`, `features/dining`, `modes/restaurant`  
> **Intent:** Provide a table-centric, session-oriented POS experience optimized for dine-in and buffet environments.

---

## 1. Operational Logic

Unlike the Retail mode (transaction-first), the Restaurant mode is **Session-Oriented**. The workflow starts with a physical location (Table) and builds a stateful order (Dining Session) over time.

### Core Lifecycle
1.  **Table Selection**: User initiates the flow from a visual grid of tables.
2.  **Session Initialization**: Defines the service type (Buffet/A la carte) and headcount.
3.  **Active Consumption**: Items are added to the session. The system distinguishes between "Included" items (Buffet) and "Extra Charge" items.
4.  **Checkout & Finalization**: The session is converted into a completed Order, applying the `RestaurantPricingEngine` logic, and the table is marked for cleaning or immediate availability.

---

## 2. Technical Components

### 2.1 Table & Session Management
*   **TableModel**: Tracks physical identifiers and real-time status (`available`, `occupied`, `billing`, `cleaning`).
*   **DiningSessionModel**: A persistent local state (Isar) holding the active headcount and un-billed items for a specific table.

### 2.2 Restaurant Pricing Engine
The engine calculates totals based on:
- **Headcount Basis**: `adults * adultPrice` + `children * childPrice`.
- **Item Semantics**: Only items marked as `isExtraCharge` or not belonging to the selected Buffet Tier are added to the total.
- **Service Charges**: (Future) Automatic percentage-based service fees.

### 2.3 Receipt Composition
The `RestaurantReceiptComposer` extends the base system to include:
- Table Number & Session ID.
- Headcount breakdown (Adult/Child/Elderly).
- Separation of Buffet charges from additional A la carte extras.

---

## 3. Data Integration

### 3.1 Restaurant Seed Data
The mode provides a specialized dataset:
- **Tables**: T-01 through T-20 with varying capacities.
- **Products**: Categorized into "Buffet Included" (e.g., standard meats) and "Premium Add-ons" (e.g., Wagyu beef, Special Drinks).
- **Buffet Tiers**: Default Silver, Gold, and Platinum definitions.

---

## 4. Navigation & Routing

| Route | Purpose |
|-------|---------|
| `/restaurant/tables` | Main entry point showing table grid/status. |
| `/restaurant/table/:id` | Dynamic route for managing a specific table session. |
| `/restaurant/checkout/:sessionId` | Finalizing payment for a specific session. |

---

## 5. Verification Checklist

- [x] Tables accurately reflect their current state (occupied vs available).
- [x] Headcount values are correctly passed into the pricing engine.
- [x] Buffet "Included" items result in ฿0.00 line totals in the cart.
- [x] Receipt printout includes table info and demographic summary.
- [x] Closing a session correctly updates the table status to `available` or `cleaning`.

---
*Last updated: April 2026*
