import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../features/auth/presentation/providers/auth_provider.dart';
import '../../data/repositories/access_repository_impl.dart';
import '../../domain/entities/app_permission.dart';
import '../../domain/entities/app_role.dart';
import '../../domain/entities/user_access_profile.dart';
import '../../domain/repositories/access_repository.dart';
import '../../domain/services/permission_service.dart';

part 'access_providers.g.dart';

@riverpod
AccessRepository accessRepository(AccessRepositoryRef ref) {
  return AccessRepositoryImpl();
}

@riverpod
PermissionService permissionService(PermissionServiceRef ref) {
  final repo = ref.watch(accessRepositoryProvider);
  return PermissionService(repo);
}

@riverpod
UserAccessProfile userAccessProfile(UserAccessProfileRef ref) {
  final authState = ref.watch(authNotifierProvider);

  return authState.when(
    data: (roleStr) {
      if (roleStr == null) return UserAccessProfile.anonymous();

      // Simple mapping for current demo's 'admin' and 'staff' strings
      if (roleStr == 'admin') {
        return const UserAccessProfile(
          userId: 'admin_1',
          role: AppRole.admin,
          displayName: 'Demo Administrator',
          isActive: true,
        );
      }

      // Default to cashier for other logged-in staff for now
      return const UserAccessProfile(
        userId: 'cashier_1',
        role: AppRole.cashier,
        displayName: 'Demo Staff',
        isActive: true,
      );
    },
    error: (_, __) => UserAccessProfile.anonymous(),
    loading: () => UserAccessProfile.anonymous(),
  );
}

@riverpod
bool hasPermission(HasPermissionRef ref, AppPermission permission) {
  final profile = ref.watch(userAccessProfileProvider);
  final service = ref.watch(permissionServiceProvider);
  return service.can(profile, permission);
}
