import '../../domain/entities/app_permission.dart';
import '../../domain/entities/app_role.dart';
import '../../domain/repositories/access_repository.dart';

class AccessRepositoryImpl implements AccessRepository {
  late final Map<AppRole, Set<AppPermission>> _roleMapping;

  AccessRepositoryImpl() {
    _roleMapping = {
      AppRole.cashier: {
        AppPermission.checkoutPerform,
        AppPermission.paymentComplete,
        AppPermission.receiptPrint,
      },
      AppRole.supervisor: {
        AppPermission.checkoutPerform,
        AppPermission.paymentComplete,
        AppPermission.receiptPrint,
        AppPermission.receiptReprint,
      },
      AppRole.manager: {
        AppPermission.checkoutPerform,
        AppPermission.paymentComplete,
        AppPermission.receiptPrint,
        AppPermission.receiptReprint,
        AppPermission.settingsEdit,
        AppPermission.printerChangeDefault,
        AppPermission.transactionVoid,
      },
      AppRole.admin: {
        ...AppPermission.values.toSet(),
      },
    };
  }

  @override
  bool hasPermission(AppRole role, AppPermission permission) {
    return _roleMapping[role]?.contains(permission) ?? false;
  }

  @override
  Set<AppPermission> getPermissionsForRole(AppRole role) {
    return _roleMapping[role] ?? {};
  }

  @override
  Map<AppRole, Set<AppPermission>> getRolePermissionsMap() {
    return Map.unmodifiable(_roleMapping);
  }
}
