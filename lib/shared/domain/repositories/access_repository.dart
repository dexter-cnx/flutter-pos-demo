import '../entities/app_permission.dart';
import '../entities/app_role.dart';

abstract class AccessRepository {
  /// Check if a specific role should have a specific permission
  bool hasPermission(AppRole role, AppPermission permission);

  /// Get list of all permissions for a certain role
  Set<AppPermission> getPermissionsForRole(AppRole role);

  /// Hardcoded mapping initialization for demo purposes
  Map<AppRole, Set<AppPermission>> getRolePermissionsMap();
}
