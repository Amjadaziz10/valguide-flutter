import 'package:dartz/dartz.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../../../../core/connection/network_info.dart';
import '../../business/repositories/map_repository.dart';
import '../datasources/map_local_data_source.dart';
import '../datasources/map_remote_data_source.dart';
import '../models/map_model.dart';

class MapRepositoryImpl implements MapRepository {
  final MapRemoteDataSource remoteDataSource;
  final MapLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  MapRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, MapModel>> getMap(
      {required MapParams mapParams}) async {
    if (await networkInfo.isConnected!) {
      try {
        MapModel remoteMap =
            await remoteDataSource.getMap(mapParams: mapParams);

        localDataSource.cacheMap(remoteMap);
        return Right(remoteMap);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      }
    } else {
      try {
        MapModel localMap = await localDataSource.getLastMap();
        return Right(localMap);
      } on CacheException {
        return Left(CacheFailure(errorMessage: 'This is a cache exception'));
      }
    }
  }
}
