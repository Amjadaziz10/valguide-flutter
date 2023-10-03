import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/errors/exceptions.dart';
import '../models/gun_model.dart';

abstract class GunLocalDataSource {
  Future<void>? cacheGun(GunModel? gunToCache);
  Future<GunModel> getLastGun();
}

const cachedGun = 'CACHED_GUN';

class GunLocalDataSourceImpl implements GunLocalDataSource {
  final SharedPreferences sharedPreferences;

  GunLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<GunModel> getLastGun() {
    final jsonString = sharedPreferences.getString(cachedGun);

    if (jsonString != null) {
      return Future.value(GunModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void>? cacheGun(GunModel? gunToCache) async {
    if (gunToCache != null) {
      sharedPreferences.setString(
        cachedGun,
        json.encode(
          gunToCache.toJson(),
        ),
      );
    } else {
      throw CacheException();
    }
  }
}
