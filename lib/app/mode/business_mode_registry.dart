import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../modes/retail/retail_mode_definition.dart';
import '../../modes/restaurant/restaurant_mode_definition.dart';
import './business_mode.dart';
import './business_mode_definition.dart';

part 'business_mode_registry.g.dart';

/// Registry of all supported business modes in the application.
@riverpod
Map<BusinessMode, BusinessModeDefinition> businessModeRegistry(
  BusinessModeRegistryRef ref,
) {
  return {
    BusinessMode.retail: RetailModeDefinition(),
    BusinessMode.restaurant: RestaurantModeDefinition(),
  };
}

/// Helper provider to get a mode definition by its identity.
@riverpod
BusinessModeDefinition businessModeDefinition(
  BusinessModeDefinitionRef ref,
  BusinessMode mode,
) {
  final registry = ref.watch(businessModeRegistryProvider);
  final definition = registry[mode];
  if (definition == null) {
    throw StateError('No definition found for business mode: $mode');
  }
  return definition;
}
