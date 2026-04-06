enum AppRole {
  /// Basic floor staff (Cashier/Waitstaff)
  cashier('CASHIER', 'Cashier'),

  /// Team lead / Supervisor
  supervisor('SUPERVISOR', 'Supervisor'),

  /// Store management
  manager('MANAGER', 'Manager'),

  /// System admin / Owner
  admin('ADMIN', 'Administrator');

  final String code;
  final String label;
  const AppRole(this.code, this.label);

  static AppRole? fromCode(String val) {
    for (final role in AppRole.values) {
      if (role.code == val || role.name == val.toLowerCase()) return role;
    }
    return null;
  }
}
