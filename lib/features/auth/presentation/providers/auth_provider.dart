import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AsyncValue<String?> build() {
    return const AsyncValue.data(null);
  }

  void login(String pin) {
    state = const AsyncValue.loading();
    final isValidPin = RegExp(r'^\d{4}$').hasMatch(pin);

    if (isValidPin) {
      state = const AsyncValue.data('admin');
    } else {
      state = AsyncValue.error('Invalid PIN', StackTrace.current);
    }
  }

  void logout() {
    state = const AsyncValue.data(null);
  }
}
