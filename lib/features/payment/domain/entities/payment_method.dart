enum PaymentMethod {
  cash,
  qr,
  card,
}

extension PaymentMethodX on PaymentMethod {
  String get id => name;
}
