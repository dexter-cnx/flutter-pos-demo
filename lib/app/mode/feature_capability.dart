/// Defines granular capabilities that a business mode can expose.
/// Use this instead of checking `if (mode == ...)` in the UI.
enum FeatureCapability {
  productCatalog,
  cart,
  checkout,
  receipt,
  orderHistory,
  reporting,
  inventoryTracking,
  barcodeScanning,
  promptPayPayment,
  cardPayment,
  printerSupport,

  // Restaurant specifically
  tableManagement,
  diningSession,
  headcountPricing,
  buffetPricing,
  extraChargeItems,
  kitchenTicket,
  splitBill,
}
