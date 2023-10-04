import 'package:json_annotation/json_annotation.dart';
import 'package:valguide3/features/map/business/entities/map_entity.dart';
part 'map_model.g.dart';

@JsonSerializable()
class MapModel extends MapEntity {
  MapModel({
    required int status,
    required List<MapDataModel> data,
  }) : super(status: status, data: data);

  @override
  String toString() => 'MapModel(status: $status, data: $data)';

  factory MapModel.fromJson(Map<String, dynamic> json) =>
      _$MapModelFromJson(json);

  Map<String, dynamic> toJson() => _$MapModelToJson(this);
}

@JsonSerializable()
class MapDataModel extends MapDataEntity {
  MapDataModel({
    required String uuid,
    required String displayName,
    required String narrativeDescription,
    required String coordinates,
    required String displayIcon,
    required String listViewIcon,
    required String splash,
  }) : super(
            uuid: uuid,
            displayName: displayName,
            narrativeDescription: narrativeDescription,
            coordinates: coordinates,
            displayIcon: displayIcon,
            listViewIcon: listViewIcon,
            splash: splash);

  @override
  String toString() {
    return 'MapDataModel(uuid: $uuid, displayName: $displayName,narrativeDescription: $narrativeDescription, coordinates: $coordinates, displayIcon: $displayIcon, listViewIcon: $listViewIcon, splash: $splash)';
  }

  factory MapDataModel.fromJson(Map<String, dynamic> json) =>
      _$MapDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MapDataModelToJson(this);
}
