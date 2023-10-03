import 'package:json_annotation/json_annotation.dart';
import '../../business/entities/agent_entity.dart';
part 'agent_model.g.dart';

@JsonSerializable()
class AgentModel extends AgentEntity {
  AgentModel({
    required int status,
    required List<AgentDataModel> data,
  }) : super(status: status, data: data);

  @override
  String toString() => 'Agent(status: $status, data: $data)';

  factory AgentModel.fromJson(Map<String, dynamic> json) =>
      _$AgentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AgentModelToJson(this);
}

@JsonSerializable()
class AgentDataModel extends AgentDataEntity {
  AgentDataModel({
    required String uuid,
    required String displayName,
    required String description,
    required String displayIcon,
    required String fullPortraitV2,
    required String background,
    required RoleModel role,
    required List<AbilitiesModel> abilities,
  }) : super(
            uuid: uuid,
            displayName: displayName,
            description: description,
            displayIcon: displayIcon,
            fullPortraitV2: fullPortraitV2,
            background: background,
            role: role,
            abilities: abilities);

  @override
  String toString() {
    return 'AgentData(uuid: $uuid, displayName: $displayName, description: $description, displayIcon: $displayIcon, fullPortraitV2: $fullPortraitV2, background: $background, role: $role, abilities: $abilities)';
  }

  factory AgentDataModel.fromJson(Map<String, dynamic> json) =>
      _$AgentDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$AgentDataModelToJson(this);
}

@JsonSerializable()
class RoleModel extends RoleEntity {
  RoleModel({
    required String uuid,
    required String displayName,
    required String description,
    required String displayIcon,
  }) : super(
            uuid: uuid,
            displayName: displayName,
            description: description,
            displayIcon: displayIcon);

  @override
  String toString() {
    return 'Role(uuid: $uuid, displayName: $displayName, description: $description, displayIcon: $displayIcon)';
  }

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoleModelToJson(this);
}

@JsonSerializable()
class AbilitiesModel extends AbilitiesEntity {
  AbilitiesModel({
    required String slot,
    required String displayName,
    required String description,
    required String displayIcon,
  }) : super(
            slot: slot,
            displayName: displayName,
            description: description,
            displayIcon: displayIcon);

  @override
  String toString() {
    return 'Abilities(slot: $slot, displayName: $displayName, description: $description, displayIcon: $displayIcon)';
  }

  factory AbilitiesModel.fromJson(Map<String, dynamic> json) =>
      _$AbilitiesModelFromJson(json);

  Map<String, dynamic> toJson() => _$AbilitiesModelToJson(this);
}
