import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../shared/domain/entities/app_profile.dart';
import '../../features/settings/presentation/providers/settings_providers.dart';
import './business_mode.dart';
import './business_mode_definition.dart';
import './business_mode_registry.dart';
import './feature_capability.dart';

part 'current_mode_provider.g.dart';

@riverpod
class AppProfileNotifier extends _$AppProfileNotifier {
  @override
  FutureOr<AppProfile> build() {
    return ref.watch(settingsRepositoryProvider).getAppProfile();
  }

  Future<void> updateMode(String modeId) async {
    final profile = await future;
    final updated = profile.copyWith(activeModeId: modeId);
    
    await ref.read(settingsRepositoryProvider).saveAppProfile(updated);
    state = AsyncData(updated);
  }
}

// Keep the old name for backward compatibility if possible, or refactor all consumers
@riverpod
Future<AppProfile> appProfile(AppProfileRef ref) {
  return ref.watch(appProfileNotifierProvider.future);
}

/// Provides the current active business mode (identity).
@riverpod
BusinessMode currentBusinessMode(CurrentBusinessModeRef ref) {
  final profileAsync = ref.watch(appProfileProvider);
  
  return profileAsync.maybeWhen(
    data: (profile) {
      if (profile.activeModeId == 'restaurant') {
        return BusinessMode.restaurant;
      }
      return BusinessMode.retail;
    },
    orElse: () => BusinessMode.retail,
  );
}

/// Provides the full definition for the currently active mode.
@riverpod
BusinessModeDefinition currentModeDefinition(CurrentModeDefinitionRef ref) {
  final mode = ref.watch(currentBusinessModeProvider);
  return ref.watch(businessModeDefinitionProvider(mode));
}

/// Helper to check if a specific capability is enabled in the current mode.
@riverpod
bool isCapabilityEnabled(IsCapabilityEnabledRef ref, FeatureCapability capability) {
  final definition = ref.watch(currentModeDefinitionProvider);
  return definition.capabilities.contains(capability);
}
