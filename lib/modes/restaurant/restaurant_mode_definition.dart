import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/mode/business_mode.dart';
import '../../app/mode/business_mode_definition.dart';
import '../../app/mode/feature_capability.dart';
import '../../app/shell/app_nav_item.dart';
import '../../features/receipt/domain/services/receipt_composer.dart';
import '../../features/receipt/domain/services/restaurant_receipt_composer.dart';
import '../../features/orders/presentation/pages/order_history_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import './restaurant_main_page.dart';

class RestaurantModeDefinition extends BusinessModeDefinition {
  @override
  BusinessMode get mode => BusinessMode.restaurant;

  @override
  String get id => 'restaurant';

  @override
  String get displayName => 'Restaurant POS';

  @override
  List<FeatureCapability> get capabilities => [
        FeatureCapability.productCatalog,
        FeatureCapability.cart, // Buffet / Dining cart
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
  List<AppNavItem> get navItems => [
        AppNavItem(
          label: 'pos.nav.restaurant_tables',
          icon: Icons.table_restaurant_outlined,
          selectedIcon: Icons.table_restaurant,
          location: '/',
        ),
        AppNavItem(
          label: 'pos.nav.history',
          icon: Icons.history_outlined,
          selectedIcon: Icons.history,
          location: '/history',
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
        name: 'restaurant_pos',
        builder: (context, state) => const RestaurantMainPage(),
      ),
      GoRoute(
        path: '/history',
        name: 'history',
        builder: (context, state) => const OrderHistoryPage(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsPage(),
      ),
    ];
  }

  @override
  OrderPricingEngine get pricingEngine => const RestaurantPricingEngine();

  @override
  ReceiptComposer get receiptComposer => RestaurantReceiptComposer();

  @override
  SeedDataStrategy get seedDataStrategy => const RestaurantSeedDataStrategy();
}

class RestaurantPricingEngine implements OrderPricingEngine {
  const RestaurantPricingEngine();

  @override
  double calculateSubtotal(List<dynamic> items) {
    // Basic sum for now (can expand to buffet/headcount later)
    return items.fold(0.0, (sum, item) => sum + (item.product.price * item.quantity));
  }

  @override
  double calculateTax(double subtotal, double taxRate) {
    // Restaurants sometimes have Service Charge (10%) then VAT (7%)
    // But for foundation, we stay clean
    return subtotal * taxRate;
  }

  @override
  double calculateTotal(double subtotal, double taxAmount) {
    return subtotal + taxAmount;
  }
}

class RestaurantSeedDataStrategy implements SeedDataStrategy {
  const RestaurantSeedDataStrategy();

  @override
  Future<void> seed() async {
    // No-op for foundation
  }
}
