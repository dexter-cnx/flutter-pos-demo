import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/mode/business_mode.dart';
import '../../app/mode/business_mode_definition.dart';
import '../../app/mode/feature_capability.dart';
import '../../app/shell/app_nav_item.dart';
import '../../features/receipt/domain/services/restaurant_receipt_composer.dart';
import '../../features/receipt/domain/services/receipt_composer.dart';
import '../../features/orders/presentation/pages/order_history_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import 'presentation/pages/restaurant_main_page.dart';
import 'presentation/pages/dining_session_page.dart';
import '../../features/analytics/presentation/pages/dashboard_page.dart';

class RestaurantModeDefinition implements BusinessModeDefinition {
  const RestaurantModeDefinition();

  @override
  BusinessMode get mode => BusinessMode.restaurant;

  @override
  String get id => 'restaurant';

  @override
  String get displayName => 'Restaurant POS';

  @override
  List<FeatureCapability> get capabilities => [
        FeatureCapability.splitBill,
        FeatureCapability.reporting,
        FeatureCapability.tableManagement,
        FeatureCapability.diningSession,
        FeatureCapability.headcountPricing,
        FeatureCapability.buffetPricing,
        FeatureCapability.extraChargeItems,
        FeatureCapability.kitchenTicket,
        FeatureCapability.visualFloorPlan,
        FeatureCapability.floorPlanEditor,
        FeatureCapability.customerLoyalty,
        FeatureCapability.promotionSystem,
        FeatureCapability.pointsRedemption,
        FeatureCapability.receiptDesigner,
        FeatureCapability.kitchenPrinter,
      ];

  @override
  List<AppNavItem> get navItems => [
        const AppNavItem(
          label: 'pos.nav.restaurant_tables',
          icon: Icons.table_restaurant_outlined,
          selectedIcon: Icons.table_restaurant,
          location: '/',
        ),
        const AppNavItem(
          label: 'pos.nav.history',
          icon: Icons.history_outlined,
          selectedIcon: Icons.history,
          location: '/history',
        ),
        const AppNavItem(
          label: 'pos.nav.dashboard',
          icon: Icons.dashboard_outlined,
          selectedIcon: Icons.dashboard,
          location: '/dashboard',
        ),
        const AppNavItem(
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
        name: 'restaurant_home',
        builder: (context, state) => const RestaurantMainPage(),
      ),
      GoRoute(
        path: '/session/:sessionId',
        name: 'restaurant_session',
        builder: (context, state) {
          final id = int.tryParse(state.pathParameters['sessionId'] ?? '');
          return DiningSessionPage(sessionId: id);
        },
      ),
      GoRoute(
        path: '/history',
        name: 'restaurant_history',
        builder: (context, state) => const OrderHistoryPage(),
      ),
      GoRoute(
        path: '/dashboard',
        name: 'restaurant_dashboard',
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        path: '/settings',
        name: 'restaurant_settings',
        builder: (context, state) => const SettingsPage(),
      ),
    ];
  }

  @override
  OrderPricingEngine get pricingEngine => const RestaurantPricingEngine();

  @override
  ReceiptComposer get receiptComposer => const RestaurantReceiptComposer();

  @override
  SeedDataStrategy get seedDataStrategy => const DefaultRestaurantSeedDataStrategy();
}

class DefaultRestaurantSeedDataStrategy implements SeedDataStrategy {
  const DefaultRestaurantSeedDataStrategy();
  
  @override
  Future<void> seed() async {
    // Seeding logic is currently handled in app/services/data_seeder.dart
  }
}

class RestaurantPricingEngine implements OrderPricingEngine {
  const RestaurantPricingEngine();

  @override
  double calculateSubtotal(List<dynamic> items, {Map<String, dynamic>? metadata}) {
    // 1) ยอดสินค้า à la carte
    double itemsTotal = items.fold(0.0, (sum, item) => sum + (item.product.price * item.quantity));

    // 2) ยอด Buffet (ถ้ามี)
    final adultCount = (metadata?['adultCount'] as int?) ?? 0;
    final childCount = (metadata?['childCount'] as int?) ?? 0;
    final elderlyCount = (metadata?['elderlyCount'] as int?) ?? 0;
    
    final adultPrice = (metadata?['buffetAdultPrice'] as num?)?.toDouble() ?? 0.0;
    final childPrice = (metadata?['buffetChildPrice'] as num?)?.toDouble() ?? 0.0;
    final elderlyDiscount = (metadata?['elderlyDiscount'] as num?)?.toDouble() ?? 0.0;

    final buffetTotal = (adultCount * adultPrice) +
                        (childCount * childPrice) +
                        (elderlyCount * adultPrice * (1 - elderlyDiscount));

    return itemsTotal + buffetTotal;
  }

  @override
  double calculateTax(double subtotal, double taxRate) {
    return subtotal * taxRate;
  }

  @override
  double calculateTotal(double subtotal, double taxAmount) {
    return subtotal + taxAmount;
  }
}
