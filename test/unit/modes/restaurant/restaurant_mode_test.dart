import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:thai_pos_demo/modes/restaurant/restaurant_mode_definition.dart';
import 'package:thai_pos_demo/app/mode/business_mode.dart';
import 'package:thai_pos_demo/app/mode/feature_capability.dart';

void main() {
  group('RestaurantModeDefinition', () {
    const definition = RestaurantModeDefinition();

    test('returns correct basic properties', () {
      expect(definition.id, 'restaurant');
      expect(definition.mode, BusinessMode.restaurant);
      expect(definition.displayName, contains('Restaurant'));
    });

    test('has required restaurant capabilities', () {
      expect(definition.capabilities, contains(FeatureCapability.tableManagement));
      expect(definition.capabilities, contains(FeatureCapability.diningSession));
      expect(definition.capabilities, contains(FeatureCapability.headcountPricing));
    });

    test('has correct navigation items', () {
      final rails = definition.navItems;
      expect(rails.any((item) => item.location == '/'), isTrue);
      expect(rails.any((item) => item.location == '/history'), isTrue);
      expect(rails.any((item) => item.location == '/settings'), isTrue);
    });

    test('builds required routes including session routing', () {
      final routes = definition.buildRoutes();
      final paths = routes.map((r) => (r as GoRoute).path).toList();
      
      expect(paths, contains('/'));
      expect(paths, contains('/session/:sessionId'));
      expect(paths, contains('/history'));
      expect(paths, contains('/settings'));
    });
  });
}
