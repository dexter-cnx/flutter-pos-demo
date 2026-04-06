// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_breakdown.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaxBreakdownImpl _$$TaxBreakdownImplFromJson(Map<String, dynamic> json) =>
    _$TaxBreakdownImpl(
      total: (json['total'] as num).toDouble(),
      taxAmount: (json['taxAmount'] as num).toDouble(),
      subtotal: (json['subtotal'] as num).toDouble(),
      rate: (json['rate'] as num?)?.toDouble() ?? 0.07,
      inclusive: json['inclusive'] as bool? ?? true,
    );

Map<String, dynamic> _$$TaxBreakdownImplToJson(_$TaxBreakdownImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'taxAmount': instance.taxAmount,
      'subtotal': instance.subtotal,
      'rate': instance.rate,
      'inclusive': instance.inclusive,
    };
