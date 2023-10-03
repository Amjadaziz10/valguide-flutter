class GunEntity {
  int status;
  List<GunDataEntity> data;
  GunEntity({
    required this.status,
    required this.data,
  });
}

class GunDataEntity {
  String uuid;
  String displayName;
  String displayIcon;
  GunDataEntity({
    required this.uuid,
    required this.displayName,
    required this.displayIcon,
  });
}
