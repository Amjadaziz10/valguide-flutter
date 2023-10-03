import 'package:data_connection_checker_tv/data_connection_checker.dart';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../../business/entities/gun_entity.dart';
import '../../business/usecases/get_gun.dart';
import '../../data/datasources/gun_local_data_source.dart';
import '../../data/datasources/gun_remote_data_source.dart';
import '../../data/repositories/gun_repository_impl.dart';

class GunProvider extends ChangeNotifier {
  GunEntity? gun;
  Failure? failure;

  GunProvider({
    this.gun,
    this.failure,
  });

  void eitherFailureOrGun() async {
    GunRepositoryImpl repository = GunRepositoryImpl(
      remoteDataSource: GunRemoteDataSourceImpl(
        dio: Dio(),
      ),
      localDataSource: GunLocalDataSourceImpl(
        sharedPreferences: await SharedPreferences.getInstance(),
      ),
      networkInfo: NetworkInfoImpl(
        DataConnectionChecker(),
      ),
    );

    final failureOrGun = await GetGun(repository).call(
      gunParams: GunParams(),
    );

    failureOrGun.fold(
      (newFailure) {
        gun = null;
        failure = newFailure;
        notifyListeners();
      },
      (newGun) {
        gun = newGun;
        failure = null;
        notifyListeners();
      },
    );
  }
}
