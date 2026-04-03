import '../entities/receipt_document.dart';

/// Contract for rendering a ReceiptDocument into platform-specific commands.
abstract class ReceiptRenderer<T> {
  Future<T> render(ReceiptDocument document);
}
