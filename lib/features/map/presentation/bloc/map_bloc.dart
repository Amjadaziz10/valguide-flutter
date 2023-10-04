import 'package:bloc/bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../core/params/params.dart';
import '../../business/entities/map_entity.dart';
import '../../business/usecases/get_map.dart';
import '../../data/datasources/map_local_data_source.dart';
import '../../data/datasources/map_remote_data_source.dart';
import '../../data/repositories/map_repository_impl.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapInitial()) {
    on<GetMapList>((event, emit) async {
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
          emit(MapError(newFailure.errorMessage));
        },
        (newMap) {
          emit(MapLoaded(newMap));
        },
      );
    });
  }
}
