// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppProfileImpl _$$AppProfileImplFromJson(Map<String, dynamic> json) =>
    _$AppProfileImpl(
      activeModeId: json['activeModeId'] as String,
      isOfflineFirst: json['isOfflineFirst'] as bool? ?? true,
      languageCode: json['languageCode'] as String? ?? 'th',
      currencyCode: json['currencyCode'] as String? ?? 'THB',
    );

Map<String, dynamic> _$$AppProfileImplToJson(_$AppProfileImpl instance) =>
    <String, dynamic>{
      'activeModeId': instance.activeModeId,
      'isOfflineFirst': instance.isOfflineFirst,
      'languageCode': instance.languageCode,
      'currencyCode': instance.currencyCode,
    };
