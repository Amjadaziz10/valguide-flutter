class MapEntity {
  int status;
  List<MapDataEntity> data;
  MapEntity({
    required this.status,
    required this.data,
  });
}

class MapDataEntity {
  String uuid;
  String displayName;
  String narrativeDescription;
  String coordinates;
  String displayIcon;
  String listViewIcon;
  String splash;
  MapDataEntity({
    required this.uuid,
    required this.displayName,
    required this.narrativeDescription,
    required this.coordinates,
    required this.displayIcon,
    required this.listViewIcon,
    required this.splash,
  });
}
