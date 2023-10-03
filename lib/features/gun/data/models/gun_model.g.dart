// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gun_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GunModel _$GunModelFromJson(Map<String, dynamic> json) => GunModel(
      status: json['status'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => GunDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GunModelToJson(GunModel instance) => <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

GunDataModel _$GunDataModelFromJson(Map<String, dynamic> json) => GunDataModel(
      uuid: json['uuid'] as String? ?? '',
      displayName: json['displayName'] as String? ?? '',
      displayIcon: json['displayIcon'] as String? ?? '',
    );

Map<String, dynamic> _$GunDataModelToJson(GunDataModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'displayName': instance.displayName,
      'displayIcon': instance.displayIcon,
    };
