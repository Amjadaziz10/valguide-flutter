// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapModel _$MapModelFromJson(Map<String, dynamic> json) => MapModel(
      status: json['status'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => MapDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MapModelToJson(MapModel instance) => <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

MapDataModel _$MapDataModelFromJson(Map<String, dynamic> json) => MapDataModel(
      uuid: json['uuid'] as String? ?? '',
      displayName: json['displayName'] as String? ?? '',
      coordinates: json['coordinates'] as String? ?? '',
      displayIcon: json['displayIcon'] as String? ?? '',
      listViewIcon: json['listViewIcon'] as String? ?? '',
      splash: json['splash'] as String? ?? '',
    );

Map<String, dynamic> _$MapDataModelToJson(MapDataModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'displayName': instance.displayName,
      'coordinates': instance.coordinates,
      'displayIcon': instance.displayIcon,
      'listViewIcon': instance.listViewIcon,
      'splash': instance.splash,
    };
