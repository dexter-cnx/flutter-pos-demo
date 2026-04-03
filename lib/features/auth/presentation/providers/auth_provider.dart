import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AsyncValue<String?> build() {
    return const AsyncValue.data(null);
  }

  void loginWithPin(String pin) {
    state = const AsyncValue.loading();
    // For demo, any 4-digit PIN works as staff
    final isValidPin = RegExp(r'^\d{4}$').hasMatch(pin);

    if (isValidPin) {
      state = const AsyncValue.data('staff');
    } else {
      state = AsyncValue.error('Invalid PIN', StackTrace.current);
    }
  }

  void loginWithAdmin(String username, String password) {
    state = const AsyncValue.loading();
    // Demo credentials: admin / admin123
    if (username == 'admin' && password == 'admin123') {
      state = const AsyncValue.data('admin');
    } else {
      state = AsyncValue.error('Invalid Credentials', StackTrace.current);
    }
  }

  void login(String pin) => loginWithPin(pin);

  void logout() {
    state = const AsyncValue.data(null);
  }
}
