import 'package:data_connection_checker_tv/data_connection_checker.dart';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../../business/entities/map_entity.dart';
import '../../business/usecases/get_map.dart';
import '../../data/datasources/map_local_data_source.dart';
import '../../data/datasources/map_remote_data_source.dart';
import '../../data/repositories/map_repository_impl.dart';

class MapProvider extends ChangeNotifier {
  MapEntity? map;
  Failure? failure;

  MapProvider({
    this.map,
    this.failure,
  });

  void eitherFailureOrMap() async {
    MapRepositoryImpl repository = MapRepositoryImpl(
      remoteDataSource: MapRemoteDataSourceImpl(
        dio: Dio(),
      ),
      localDataSource: MapLocalDataSourceImpl(
        sharedPreferences: await SharedPreferences.getInstance(),
      ),
      networkInfo: NetworkInfoImpl(
        DataConnectionChecker(),
      ),
    );

    final failureOrMap = await GetMap(repository).call(
      mapParams: MapParams(),
    );

    failureOrMap.fold(
      (newFailure) {
        map = null;
        failure = newFailure;
        notifyListeners();
      },
      (newMap) {
        map = newMap;
        failure = null;
        notifyListeners();
      },
    );
  }
}
