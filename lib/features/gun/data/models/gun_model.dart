
import 'package:json_annotation/json_annotation.dart';
import 'package:valguide3/features/gun/business/entities/gun_entity.dart';
part 'gun_model.g.dart';

@JsonSerializable()
class GunModel extends GunEntity {
  GunModel({
    required int status,
    required List<GunDataModel> data,
  }) : super(status: status, data: data);

  @override
  String toString() => 'GunModel(status: $status, data: $data)';

  factory GunModel.fromJson(Map<String, dynamic> json) =>
      _$GunModelFromJson(json);

  Map<String, dynamic> toJson() => _$GunModelToJson(this);
}

@JsonSerializable()
class GunDataModel extends GunDataEntity {
  GunDataModel({
    required String uuid,
    required String displayName,
    required String displayIcon,
  }) : super(uuid: uuid, displayName: displayName, displayIcon: displayIcon);

  @override
  String toString() {
    return 'GunDataModel(uuid: $uuid, displayName: $displayName, displayIcon: $displayIcon)';
  }

  factory GunDataModel.fromJson(Map<String, dynamic> json) =>
      _$GunDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$GunDataModelToJson(this);
}
