import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/errors/exceptions.dart';
import '../models/map_model.dart';

abstract class MapLocalDataSource {
  Future<void>? cacheMap(MapModel? mapToCache);
  Future<MapModel> getLastMap();
}

const cachedMap = 'CACHED_MAP';

class MapLocalDataSourceImpl implements MapLocalDataSource {
  final SharedPreferences sharedPreferences;

  MapLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<MapModel> getLastMap() {
    final jsonString = sharedPreferences.getString(cachedMap);

    if (jsonString != null) {
      return Future.value(MapModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void>? cacheMap(MapModel? mapToCache) async {
    if (mapToCache != null) {
      sharedPreferences.setString(
        cachedMap,
        json.encode(
          mapToCache.toJson(),
        ),
      );
    } else {
      throw CacheException();
    }
  }
}
