import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thai_pos_demo/shared/domain/value_objects/tax_breakdown.dart';

part 'receipt_document.freezed.dart';
part 'receipt_document.g.dart';

@freezed
class ReceiptLine with _$ReceiptLine {
  const factory ReceiptLine({
    required String name,
    required int quantity,
    required double unitPrice,
    required double totalPrice,
    String? note,
  }) = _ReceiptLine;

  factory ReceiptLine.fromJson(Map<String, dynamic> json) =>
      _$ReceiptLineFromJson(json);
}

@freezed
class ReceiptDocument with _$ReceiptDocument {
  const factory ReceiptDocument({
    required String storeName,
    String? storeAddress,
    String? storePhone,
    String? storeTaxId,
    required String transactionId,
    required DateTime timestamp,
    required List<ReceiptLine> lines,
    required double subtotal,
    required double taxAmount,
    required double total,
    TaxBreakdown? taxBreakdown,
    required String paymentMethod,
    required double receivedAmount,
    required double changeAmount,
    String? footerNote,
  }) = _ReceiptDocument;

  factory ReceiptDocument.fromJson(Map<String, dynamic> json) =>
      _$ReceiptDocumentFromJson(json);
}
