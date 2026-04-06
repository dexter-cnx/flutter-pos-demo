// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReceiptLineImpl _$$ReceiptLineImplFromJson(Map<String, dynamic> json) =>
    _$ReceiptLineImpl(
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: (json['unitPrice'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$ReceiptLineImplToJson(_$ReceiptLineImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'totalPrice': instance.totalPrice,
      'note': instance.note,
    };

_$ReceiptDocumentImpl _$$ReceiptDocumentImplFromJson(
        Map<String, dynamic> json) =>
    _$ReceiptDocumentImpl(
      storeName: json['storeName'] as String,
      storeAddress: json['storeAddress'] as String?,
      storePhone: json['storePhone'] as String?,
      storeTaxId: json['storeTaxId'] as String?,
      transactionId: json['transactionId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      lines: (json['lines'] as List<dynamic>)
          .map((e) => ReceiptLine.fromJson(e as Map<String, dynamic>))
          .toList(),
      subtotal: (json['subtotal'] as num).toDouble(),
      taxAmount: (json['taxAmount'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      taxBreakdown: json['taxBreakdown'] == null
          ? null
          : TaxBreakdown.fromJson(json['taxBreakdown'] as Map<String, dynamic>),
      paymentMethod: json['paymentMethod'] as String,
      receivedAmount: (json['receivedAmount'] as num).toDouble(),
      changeAmount: (json['changeAmount'] as num).toDouble(),
      footerNote: json['footerNote'] as String?,
    );

Map<String, dynamic> _$$ReceiptDocumentImplToJson(
        _$ReceiptDocumentImpl instance) =>
    <String, dynamic>{
      'storeName': instance.storeName,
      'storeAddress': instance.storeAddress,
      'storePhone': instance.storePhone,
      'storeTaxId': instance.storeTaxId,
      'transactionId': instance.transactionId,
      'timestamp': instance.timestamp.toIso8601String(),
      'lines': instance.lines,
      'subtotal': instance.subtotal,
      'taxAmount': instance.taxAmount,
      'total': instance.total,
      'taxBreakdown': instance.taxBreakdown,
      'paymentMethod': instance.paymentMethod,
      'receivedAmount': instance.receivedAmount,
      'changeAmount': instance.changeAmount,
      'footerNote': instance.footerNote,
    };
