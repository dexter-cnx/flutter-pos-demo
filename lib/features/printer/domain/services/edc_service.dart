import '../../../payment/domain/entities/payment_status.dart';

abstract class EdcService {
  /// Initiates a card transaction on the physical EDC terminal.
  /// Returns a stream of status updates until final state.
  Stream<PaymentStatus> processPayment(double amount);
  
  /// Cancels any active transaction on the terminal.
  Future<void> cancelTransaction();
}

/// A simulated EDC service that mimics real terminal behavior.
class MockEdcService implements EdcService {
  @override
  Stream<PaymentStatus> processPayment(double amount) async* {
    yield PaymentStatus.processing;
    // Mimic terminal "Reading Card..."
    await Future.delayed(const Duration(seconds: 2));
    yield PaymentStatus.processing; // "Authorizing..."
    await Future.delayed(const Duration(seconds: 2));
    yield PaymentStatus.approved;
  }

  @override
  Future<void> cancelTransaction() async {
    // No-op for mock
  }
}
