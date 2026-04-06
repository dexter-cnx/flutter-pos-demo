import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/local_settings_repository.dart';
import '../../domain/entities/store_profile.dart';
import '../../domain/repositories/settings_repository.dart';
import 'package:thai_pos_demo/shared/domain/entities/app_permission.dart';
import 'package:thai_pos_demo/shared/presentation/providers/access_providers.dart';

import 'package:thai_pos_demo/shared/presentation/providers/audit_providers.dart' hide isar;
import 'package:thai_pos_demo/shared/domain/enums/audit_event_source.dart';

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
    final permissionService = ref.read(permissionServiceProvider);
    final userProfile = ref.read(userAccessProfileProvider);

    if (!permissionService.can(userProfile, AppPermission.settingsEdit)) {
      state = AsyncError('Permission Denied: settings.edit', StackTrace.current);
      return;
    }

    final oldProfile = await ref.read(storeProfileProvider.future);
    await ref.watch(settingsRepositoryProvider).saveStoreProfile(profile);

    final auditService = ref.read(auditServiceProvider);
    await auditService.logSettingsChange(
      settingName: 'store_profile',
      oldValue: oldProfile.storeName,
      newValue: profile.storeName,
      actorId: userProfile.userId,
      actorLabel: userProfile.displayName,
      source: AuditEventSource.staff,
    );

    ref.invalidate(storeProfileProvider);
    ref.invalidate(lowStockThresholdProvider);
    state = const AsyncData(null);
  }
}
