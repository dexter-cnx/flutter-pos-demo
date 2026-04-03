# Architecture 04: Analytics Dashboard

> **Priority:** 🔴 High  
> **Modules:** `features/analytics` (New)  
> **Dependencies:** `fl_chart` package

---

## 1. Current State

### ✅ Implemented
- `OrderModel` — Captures `createdAt`, `total`, `items`, `paymentMethod`, and `businessMode`.
- `OrderHistoryPage` — Tabular list of historical orders.

### ❌ Missing
- **Visual Dashboard**: No high-level summary of business performance.
- **Trend Analysis**: No charting of revenue over time (hourly/daily).
- **Categorical Breakdown**: No insights into top products or payment method distributions.
- **Reporting & Export**: No PDF summary or CSV raw data export.
- **End-of-Day (EOD)**: No specialized daily closing report.

---

## 2. Technical Design: Domain & Service Layer

### 2.1 AnalyticsService (Query & Aggregation)

*   **Real-time Queries**: Aggregates Isar order data for current day/week/month.
*   **KPI Calculation**: Computes Gross Sales, Order Count, and Average Order Value (AOV).
*   **Ranking Engine**: Identifies top-performing products by quantity and revenue.

### 2.2 Data Entities

```dart
@freezed
class DailySummary with _$DailySummary {
  const factory DailySummary({
    required double totalRevenue,
    required int orderCount,
    required int customerCount,
    required List<TopProduct> topProducts,
    required Map<int, double> hourlyRevenue,  // hour (0-23) → revenue
    required Map<String, double> paymentBreakdown, // method → amount
    double? previousDayRevenue,
  }) = _DailySummary;
}

@freezed
class TopProduct with _$TopProduct {
  const factory TopProduct({
    required String name,
    required int quantity,
    required double revenue,
  }) = _TopProduct;
}
```

---

## 3. Presentation Architecture

### 3.1 Dashboard Layout (Adaptive)
*   **KPI Strip**: Highlight cards for today's revenue, order volume, and customer traffic.
*   **Revenue Chart (Bar/Line)**: Displays sales distribution across operating hours.
*   **Payment Mix (Pie)**: Comparison of Cash vs. QR PromptPay vs. Card payments.
*   **Inventory Insights**: Top 5/10 best-selling items list.

### 3.2 Visualization Library: `fl_chart`
*   Used for highly-customizable, performant Flutter charts.
*   Themes integrated with the main application color palette.

---

## 4. Reporting & Exports

### 4.1 Daily Closing Report (PDF)
*   Generates a formatted A4 report using the `pdf` library.
*   Includes summary statistics, payment breakdown, and product rankings.
*   Designed for printing or digital archival.

### 4.2 Raw Data Export (CSV)
*   Allows exporting filtered date ranges to CSV files.
*   Columns: Date, Order ID, Subtotal, Tax, Total, Payment Method.

---

## 5. Implementation Roadmap

### Create
- `features/analytics/domain/entities/daily_summary.dart`
- `features/analytics/domain/services/analytics_service.dart`
- `features/analytics/domain/services/report_exporter.dart`
- `features/analytics/presentation/pages/dashboard_page.dart`
- `features/analytics/presentation/widgets/hourly_bar_chart.dart`
- `features/analytics/presentation/widgets/payment_pie_chart.dart`

### Modify
- `pubspec.yaml`: Add `fl_chart`, `pdf`, `printing`.
- `app_router.dart`: Register `/dashboard` and `/reports` routes.
- `translations.csv`: Add dashboard and analytics keys.
- `restaurant_main_page.dart`: Add "Quick Stats" preview (optional).

---

## 6. Verification Criteria

- [x] Dashboard displays accurate "Today's Sales" matching Isar storage.
- [x] Hourly Bar Chart correctly maps orders to their respective time slots.
- [x] Pie Chart accurately reflects payment method distribution.
- [x] PDF Export generates a valid, formatted file with the correct data.
- [x] Performance: Analytical queries execute within <100ms for standard datasets.
- [x] Navigation: Dashboard accessible from the main side navigation.

---
*Last updated: April 2026*
