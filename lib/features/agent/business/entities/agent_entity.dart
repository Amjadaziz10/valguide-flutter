class AgentEntity {
  int status;
  List<AgentDataEntity> data;
  AgentEntity({
    required this.status,
    required this.data,
  });
}

class AgentDataEntity {
  String uuid;
  String displayName;
  String description;
  String displayIcon;
  String fullPortraitV2;
  String background;
  RoleEntity role;
  List<AbilitiesEntity> abilities;
  AgentDataEntity({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.displayIcon,
    required this.fullPortraitV2,
    required this.background,
    required this.role,
    required this.abilities,
  });
}

class RoleEntity {
  String uuid;
  String displayName;
  String description;
  String displayIcon;
  RoleEntity({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });
}

class AbilitiesEntity {
  String slot;
  String displayName;
  String description;
  String displayIcon;
  AbilitiesEntity({
    required this.slot,
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });
}
