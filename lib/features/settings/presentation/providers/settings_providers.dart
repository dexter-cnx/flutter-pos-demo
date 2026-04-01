import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/local_settings_repository.dart';
import '../../domain/entities/store_profile.dart';
import '../../domain/repositories/settings_repository.dart';

part 'settings_providers.g.dart';

@riverpod
SettingsRepository settingsRepository(SettingsRepositoryRef ref) {
  return LocalSettingsRepository();
}

@riverpod
Future<StoreProfile> storeProfile(StoreProfileRef ref) {
  return ref.watch(settingsRepositoryProvider).getStoreProfile();
}

@riverpod
Future<int> lowStockThreshold(LowStockThresholdRef ref) async {
  final profile = await ref.watch(storeProfileProvider.future);
  return profile.lowStockThreshold;
}

@riverpod
class SettingsController extends _$SettingsController {
  @override
  FutureOr<void> build() {}

  Future<void> saveStoreProfile(StoreProfile profile) async {
    await ref.watch(settingsRepositoryProvider).saveStoreProfile(profile);
    ref.invalidate(storeProfileProvider);
    ref.invalidate(lowStockThresholdProvider);
    state = const AsyncData(null);
  }
}
