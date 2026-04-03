import 'package:go_router/go_router.dart';
import '../../features/receipt/domain/services/receipt_composer.dart';
import '../shell/app_nav_item.dart';
import './business_mode.dart';
import './feature_capability.dart';

/// Contract for defining a business mode's identity and behavior.
abstract class BusinessModeDefinition {
  BusinessMode get mode;
  String get id;
  String get displayName;

  /// Capabilities enabled for this mode.
  List<FeatureCapability> get capabilities;

  /// Navigation items to display in the app shell.
  List<AppNavItem> get navItems;

  /// Mode-specific routes to register in the router.
  List<RouteBase> buildRoutes();

  /// Strategy for calculating order prices and taxes.
  OrderPricingEngine get pricingEngine;

  /// Strategy for composing receipt layouts.
  ReceiptComposer get receiptComposer;

  /// Strategy for seeding demo data.
  SeedDataStrategy get seedDataStrategy;
}

/// Interface for mode-specific pricing logic (Retail vs Restaurant vs Cafe).
abstract class OrderPricingEngine {
  double calculateSubtotal(List<dynamic> items, {Map<String, dynamic>? metadata});
  double calculateTax(double subtotal, double taxRate);
  double calculateTotal(double subtotal, double taxAmount);
}

/// Interface for mode-specific demo data seeding.
abstract class SeedDataStrategy {
  Future<void> seed();
}
