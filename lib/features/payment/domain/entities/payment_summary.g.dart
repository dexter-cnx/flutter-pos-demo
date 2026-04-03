// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentSummaryImpl _$$PaymentSummaryImplFromJson(Map<String, dynamic> json) =>
    _$PaymentSummaryImpl(
      id: json['id'] as String,
      orderId: json['orderId'] as String,
      totalAmount: (json['totalAmount'] as num).toDouble(),
      receivedAmount: (json['receivedAmount'] as num).toDouble(),
      changeAmount: (json['changeAmount'] as num).toDouble(),
      method: $enumDecode(_$PaymentMethodEnumMap, json['method']),
      status: $enumDecode(_$PaymentStatusEnumMap, json['status']),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$PaymentSummaryImplToJson(
        _$PaymentSummaryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'totalAmount': instance.totalAmount,
      'receivedAmount': instance.receivedAmount,
      'changeAmount': instance.changeAmount,
      'method': _$PaymentMethodEnumMap[instance.method]!,
      'status': _$PaymentStatusEnumMap[instance.status]!,
      'timestamp': instance.timestamp.toIso8601String(),
    };

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'cash',
  PaymentMethod.qr: 'qr',
  PaymentMethod.card: 'card',
};

const _$PaymentStatusEnumMap = {
  PaymentStatus.pending: 'pending',
  PaymentStatus.processing: 'processing',
  PaymentStatus.approved: 'approved',
  PaymentStatus.declined: 'declined',
  PaymentStatus.cancelled: 'cancelled',
  PaymentStatus.refunded: 'refunded',
};
