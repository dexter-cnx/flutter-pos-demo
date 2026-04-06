enum AppPermission {
  /// Regular checkout flow
  checkoutPerform('checkout.perform'),

  /// Finalizing a specific payment
  paymentComplete('payment.complete'),

  /// Basic printing of the first copy
  receiptPrint('receipt.print'),

  /// Reprinting an old receipt (often needs manager)
  receiptReprint('receipt.reprint'),

  /// Access to change application level settings
  settingsEdit('settings.edit'),

  /// Changing the default hardware printer
  printerChangeDefault('printer.change_default'),

  /// Nullifying an already completed transaction
  transactionVoid('transaction.void'),

  /// Process refund workflow
  transactionRefund('transaction.refund_future'),

  /// Direct inventory stock adjustments
  inventoryAdjust('inventory.adjust'),

  /// Reopening a closed restaurant session
  diningReopenSession('dining.reopen_session_future'),

  /// Assigning or moving tables
  tableAssign('table.assign_future');

  final String value;
  const AppPermission(this.value);

  @override
  String toString() => value;

  static AppPermission? fromString(String val) {
    return AppPermission.values.firstWhere(
      (e) => e.value == val,
      orElse: () => throw ArgumentError('Unknown permission: $val'),
    );
  }
}
