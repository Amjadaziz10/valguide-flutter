// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentModel _$AgentModelFromJson(Map<String, dynamic> json) => AgentModel(
      status: json['status'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => AgentDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AgentModelToJson(AgentModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

AgentDataModel _$AgentDataModelFromJson(Map<String, dynamic> json) =>
    AgentDataModel(
      uuid: json['uuid'] as String? ?? '',
      displayName: json['displayName'] as String? ?? '',
      description: json['description'] as String? ?? '',
      displayIcon: json['displayIcon'] as String? ?? '',
      fullPortraitV2: json['fullPortraitV2'] as String? ?? '',
      background: json['background'] as String? ?? '',
      role: RoleModel.fromJson(json['role'] as Map<String, dynamic>),
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => AbilitiesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AgentDataModelToJson(AgentDataModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'displayName': instance.displayName,
      'description': instance.description,
      'displayIcon': instance.displayIcon,
      'fullPortraitV2': instance.fullPortraitV2,
      'background': instance.background,
      'role': instance.role,
      'abilities': instance.abilities,
    };

RoleModel _$RoleModelFromJson(Map<String, dynamic> json) => RoleModel(
      uuid: json['uuid'] as String? ?? '',
      displayName: json['displayName'] as String? ?? '',
      description: json['description'] as String? ?? '',
      displayIcon: json['displayIcon'] as String? ?? '',
    );

Map<String, dynamic> _$RoleModelToJson(RoleModel instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'displayName': instance.displayName,
      'description': instance.description,
      'displayIcon': instance.displayIcon,
    };

AbilitiesModel _$AbilitiesModelFromJson(Map<String, dynamic> json) =>
    AbilitiesModel(
      slot: json['slot'] as String? ?? '',
      displayName: json['displayName'] as String? ?? '',
      description: json['description'] as String? ?? '',
      displayIcon: json['displayIcon'] as String? ?? '',
    );

Map<String, dynamic> _$AbilitiesModelToJson(AbilitiesModel instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'displayName': instance.displayName,
      'description': instance.description,
      'displayIcon': instance.displayIcon,
    };
