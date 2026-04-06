/// Enum representing different types of audit events
enum AuditEventType {
  /// Transaction lifecycle events
  transactionCreated,
  transactionPaid,
  transactionCompleted,
  transactionVoided,
  transactionRefunded,

  /// Payment lifecycle events
  paymentPending,
  paymentAuthorized,
  paymentCompleted,
  paymentFailed,
  paymentCancelled,
  paymentRefunded,

  /// Receipt lifecycle events
  receiptGenerated,
  receiptPrinted,
  receiptReprinted,

  /// Settings change events
  settingsChanged,
  printerSettingsChanged,

  /// System events
  systemStartup,
  backupPerformed,
  dataImported,
  dataExported,

  /// Future-ready events for restaurant mode
  tableSessionOpened,
  tableSessionClosed,
  diningSessionStarted,
  diningSessionEnded,

  /// Future-ready events for retail mode
  inventoryAdjusted,
  stockAdded,
  stockRemoved,
  priceUpdated,
}