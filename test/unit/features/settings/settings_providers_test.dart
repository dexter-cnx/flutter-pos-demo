import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thai_pos_demo/features/settings/domain/entities/store_profile.dart';
import 'package:thai_pos_demo/features/settings/domain/repositories/settings_repository.dart';
import 'package:thai_pos_demo/features/settings/presentation/providers/settings_providers.dart';

class _FakeSettingsRepository implements SettingsRepository {
  _FakeSettingsRepository(this.profile);

  StoreProfile profile;
  StoreProfile? savedProfile;

  @override
  Future<StoreProfile> getStoreProfile() async => profile;

  @override
  Future<void> saveStoreProfile(StoreProfile profile) async {
    savedProfile = profile;
    this.profile = profile;
  }
}

void main() {
  group('Settings providers', () {
    late ProviderContainer container;
    late _FakeSettingsRepository repository;
    final initialProfile = const StoreProfile(
      storeName: 'Thai POS Demo',
      storeAddress: 'Bangkok',
      storeTaxId: '0105559999999',
      storePhone: '0812345678',
      receiptFooter: 'Thank you',
      lowStockThreshold: 7,
    );

    setUp(() {
      repository = _FakeSettingsRepository(initialProfile);
      container = ProviderContainer(
        overrides: [
          settingsRepositoryProvider.overrideWith((ref) => repository),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('loads store profile from repository', () async {
      final profile = await container.read(storeProfileProvider.future);

      expect(profile.storeName, 'Thai POS Demo');
      expect(profile.lowStockThreshold, 7);
    });

    test('derives low stock threshold from store profile', () async {
      final threshold = await container.read(lowStockThresholdProvider.future);
      expect(threshold, 7);
    });

    test('saves store profile and updates controller state', () async {
      final updatedProfile = initialProfile.copyWith(
        storeName: 'Updated Store',
        lowStockThreshold: 9,
      );

      await container
          .read(settingsControllerProvider.notifier)
          .saveStoreProfile(updatedProfile);

      expect(repository.savedProfile, updatedProfile);
      expect(
        container.read(settingsControllerProvider),
        isA<AsyncData<void>>(),
      );
      expect(
        await container
            .read(storeProfileProvider.future)
            .then((p) => p.storeName),
        'Updated Store',
      );
    });
  });
}
