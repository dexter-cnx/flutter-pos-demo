# Thai POS Demo: Full Features List

This project is a high-end POS (Point of Sale) demonstration tailored specifically for Thailand's unique business landscape, ranging from retail to all-you-can-eat buffet restaurants. It features an Offline-First architecture and a premium Material 3 design system.

## 1. Restaurant & Buffet Management
- **Buffet Tier System**: Support for tiered pricing (Adult/Child), duration timers, and automated pricing calculations.
- **Visual Floor Plan**: An interactive drag-and-drop table management system reflects real-time status (Available, Occupied, Billing Requested).
- **Dining Sessions**: Detailed session tracking per table or member, complete with time-remaining notifications.
- **Restaurant Mode**: Native support for table numbering, check-splitting, and specialized kitchen ticketing.

## 2. Advanced POS Interface
- **Dynamic Product Grid**: Sleek, category-based product listing with instant search.
- **Smart Cart Sidebar**: Automatic 7% VAT (standard Thai tax rate) calculation with accurate rounding logic.
- **Pricing Configuration**: Flexibility for Inclusive (VAT embedded) or Exclusive (VAT added at checkout) price models.
- **Offline Reliability**: Full operational capability without internet connectivity using a local Isar database.

## 3. Loyalty & CRM System
- **Customer Database**: Comprehensive profile management with point-sharing and purchase histories.
- **Automated Member Tiers**: Dynamic tier assignment (Bronze, Silver, Gold, Platinum) based on total lifetime spend.
- **Promotion Engine**: Native support for Percentage (%) or Fixed savings on orders.
- **Tier-based Benefits**: Discount rules tied directly to the customer's membership status.

## 4. Analytics & BI Dashboard
- **Rich Visualization**: Professional summaries of Daily, Weekly, and Monthly sales through interactive charts.
- **KPI Monitoring**: Real-time tracking of Gross Sales, Order Count, and top-performing products.
- **Financial Breakdown**: Revenue reports categorized by payment method (Cash, QR PromptPay, Card).

## 5. Payments & Peripherals
- **Smart QR PromptPay**: Automatic generation of Thai-standard QR codes with correct amounts and merchant info.
- **Integrated EDC Simulation**: A realistic simulator for credit card terminal flows (Reading → Authorizing → Success).
- **Thai-native Printer Engine**: Flawless Thai character rendering using TIS-620 encoding on standard ESC/POS thermal printers.
- **WYSIWYG Receipt Designer**: A visual editor to customize headers, footers, logos, and paper width.
- **Kitchen Tickets**: Formatted order slips for the back-of-house, including table numbers and special notes.

## 6. Security & Data Integrity
- **PIN-based Access**: Secure 6-digit PIN login for different staff roles and permissions.
- **Automated Backup System**: Scheduled snapshots of the Isar database to local or cloud-compatible storage.
- **Instant Restore**: User-friendly recovery tools to prevent data loss in case of device failure.

---
*Last updated: April 2026*
