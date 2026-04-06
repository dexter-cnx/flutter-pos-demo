import '../entities/app_permission.dart';
import '../entities/user_access_profile.dart';
import '../repositories/access_repository.dart';

/// Central logic for checking permissions.
/// Decouples permission checking from hardcoded roles.
class PermissionService {
  final AccessRepository _accessRepository;

  PermissionService(this._accessRepository);

  /// Check if the provided user profile is allowed to execute a permission
  bool can(UserAccessProfile profile, AppPermission permission) {
    if (!profile.isActive) {
      // Inactive/anonymous sessions can't do anything sensitive by default
      return false;
    }
    return _accessRepository.hasPermission(profile.role, permission);
  }

  /// Batch check for multiple permissions
  bool canAll(UserAccessProfile profile, List<AppPermission> permissions) {
    return permissions.every((p) => can(profile, p));
  }

  /// Access list of permissions for informational use
  Set<AppPermission> getRolePermissions(UserAccessProfile profile) {
    return _accessRepository.getPermissionsForRole(profile.role);
  }
}
