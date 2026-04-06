// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_access_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAccessProfileImpl _$$UserAccessProfileImplFromJson(
        Map<String, dynamic> json) =>
    _$UserAccessProfileImpl(
      userId: json['userId'] as String? ?? 'anonymous',
      role: $enumDecode(_$AppRoleEnumMap, json['role']),
      displayName: json['displayName'] as String? ?? 'Unknown User',
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$UserAccessProfileImplToJson(
        _$UserAccessProfileImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'role': _$AppRoleEnumMap[instance.role]!,
      'displayName': instance.displayName,
      'isActive': instance.isActive,
    };

const _$AppRoleEnumMap = {
  AppRole.cashier: 'cashier',
  AppRole.supervisor: 'supervisor',
  AppRole.manager: 'manager',
  AppRole.admin: 'admin',
};
