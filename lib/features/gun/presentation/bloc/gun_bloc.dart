import 'package:bloc/bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valguide3/features/gun/business/entities/gun_entity.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../core/params/params.dart';
import '../../business/usecases/get_gun.dart';
import '../../data/datasources/gun_local_data_source.dart';
import '../../data/datasources/gun_remote_data_source.dart';
import '../../data/repositories/gun_repository_impl.dart';

part 'gun_event.dart';
part 'gun_state.dart';

class GunBloc extends Bloc<GunEvent, GunState> {
  GunBloc() : super(GunInitial()) {
    on<GetGunList>((event, emit) async {
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
          emit(GunError(newFailure.errorMessage));
        },
        (newGun) {
          emit(GunLoaded(newGun));
        },
      );
    });
  }
}
