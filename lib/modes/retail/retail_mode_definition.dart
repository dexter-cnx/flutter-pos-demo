import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/mode/business_mode.dart';
import '../../app/mode/business_mode_definition.dart';
import '../../app/mode/feature_capability.dart';
import '../../features/pos/presentation/pages/pos_page.dart';
import '../../features/analytics/presentation/pages/dashboard_page.dart';
import '../../app/shell/app_nav_item.dart';
import '../../features/orders/presentation/pages/order_history_page.dart';
import '../../features/inventory/presentation/pages/inventory_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/receipt/domain/services/receipt_composer.dart';
import '../../features/receipt/domain/services/retail_receipt_composer.dart';
import 'package:thai_pos_demo/core/money/tax_calculator.dart';
import 'package:thai_pos_demo/shared/domain/value_objects/tax_breakdown.dart';

class RetailModeDefinition extends BusinessModeDefinition {
  @override
  BusinessMode get mode => BusinessMode.retail;

  @override
  String get id => 'retail';

  @override
  String get displayName => 'Retail POS';

  @override
  List<FeatureCapability> get capabilities => [
        FeatureCapability.productCatalog,
        FeatureCapability.cart,
        FeatureCapability.checkout,
        FeatureCapability.receipt,
        FeatureCapability.orderHistory,
        FeatureCapability.reporting,
        FeatureCapability.customerLoyalty,
        FeatureCapability.promotionSystem,
        FeatureCapability.pointsRedemption,
        FeatureCapability.inventoryTracking,
        FeatureCapability.barcodeScanning,
        FeatureCapability.promptPayPayment,
        FeatureCapability.cardPayment,
        FeatureCapability.printerSupport,
      ];

  @override
  List<AppNavItem> get navItems => [
        AppNavItem(
          label: 'pos.nav.sale',
          icon: Icons.shopping_cart_outlined,
          selectedIcon: Icons.shopping_cart,
          location: '/',
        ),
        AppNavItem(
          label: 'pos.nav.history',
          icon: Icons.history_outlined,
          selectedIcon: Icons.history,
          location: '/history',
        ),
        AppNavItem(
          label: 'pos.nav.inventory',
          icon: Icons.inventory_2_outlined,
          selectedIcon: Icons.inventory_2,
          location: '/inventory',
        ),
        const AppNavItem(
          label: 'pos.nav.dashboard',
          icon: Icons.dashboard_outlined,
          selectedIcon: Icons.dashboard,
          location: '/dashboard',
        ),
        AppNavItem(
          label: 'pos.nav.settings',
          icon: Icons.settings_outlined,
          selectedIcon: Icons.settings,
          location: '/settings',
        ),
      ];

  @override
  List<RouteBase> buildRoutes() {
    return [
      GoRoute(
        path: '/',
        name: 'retail_home',
        builder: (context, state) => const PosPage(),
      ),
      GoRoute(
        path: '/history',
        name: 'history',
        builder: (context, state) => const OrderHistoryPage(),
      ),
      GoRoute(
        path: '/inventory',
        name: 'inventory',
        builder: (context, state) => const InventoryPage(),
      ),
      GoRoute(
        path: '/dashboard',
        name: 'retail_dashboard',
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsPage(),
      ),
    ];
  }

  @override
  OrderPricingEngine get pricingEngine => const RetailPricingEngine();

  @override
  ReceiptComposer get receiptComposer => RetailReceiptComposer();

  @override
  SeedDataStrategy get seedDataStrategy => const RetailSeedDataStrategy();
}

class RetailPricingEngine implements OrderPricingEngine {
  const RetailPricingEngine();

  @override
  double calculateSubtotal(List<dynamic> items, {Map<String, dynamic>? metadata}) {
    return items.fold(0.0, (sum, item) => sum + (item.product.price * item.quantity));
  }

  @override
  double calculateTax(double subtotal, double taxRate) {
    // For Retail, subtotal usually refers to the sticker price sum.
    // If sticker price is inclusive (standard in Thailand), tax is ALREADY inside subtotal.
    return calculateTaxBreakdown(subtotal, taxRate).taxAmount;
  }

  @override
  double calculateTotal(double subtotal, double taxAmount) {
    // If inclusive, Total = Subtotal (sum of sticker prices)
    return subtotal;
  }

  @override
  TaxBreakdown calculateTaxBreakdown(double amount, double taxRate) {
    return TaxCalculator.calculateFromInclusive(amount, rate: taxRate);
  }
}

class RetailSeedDataStrategy implements SeedDataStrategy {
  const RetailSeedDataStrategy();

  @override
  Future<void> seed() async {
    // Already handled by existing seed logic in bootstrap/main
    // We can move it here later if we want to clean up bootstrap
  }
}
