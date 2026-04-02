import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thai_pos_demo/features/auth/presentation/providers/auth_provider.dart';

void main() {
  group('AuthNotifier', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('starts unauthenticated', () {
      expect(
          container.read(authNotifierProvider), const AsyncData<String?>(null));
    });

    test('logs in with any 4-digit pin', () {
      container.read(authNotifierProvider.notifier).login('9876');

      expect(container.read(authNotifierProvider).value, 'admin');
    });

    test('returns error with non-4-digit pin', () {
      container.read(authNotifierProvider.notifier).login('999');

      expect(container.read(authNotifierProvider).hasError, isTrue);
      expect(
        container.read(authNotifierProvider).error,
        'Invalid PIN',
      );
    });

    test('returns error with non-numeric pin', () {
      container.read(authNotifierProvider.notifier).login('12a4');

      expect(container.read(authNotifierProvider).hasError, isTrue);
      expect(
        container.read(authNotifierProvider).error,
        'Invalid PIN',
      );
    });

    test('logout resets auth state', () {
      final notifier = container.read(authNotifierProvider.notifier);
      notifier.login('1234');

      notifier.logout();

      expect(
          container.read(authNotifierProvider), const AsyncData<String?>(null));
    });
  });
}
