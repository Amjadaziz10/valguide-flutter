import 'package:dartz/dartz.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../../../../core/connection/network_info.dart';
import '../../business/repositories/gun_repository.dart';
import '../datasources/gun_local_data_source.dart';
import '../datasources/gun_remote_data_source.dart';
import '../models/gun_model.dart';

class GunRepositoryImpl implements GunRepository {
  final GunRemoteDataSource remoteDataSource;
  final GunLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  GunRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, GunModel>> getGun(
      {required GunParams gunParams}) async {
    if (await networkInfo.isConnected!) {
      try {
        GunModel remoteGun =
            await remoteDataSource.getGun(gunParams: gunParams);

        localDataSource.cacheGun(remoteGun);
        return Right(remoteGun);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      }
    } else {
      try {
        GunModel localGun = await localDataSource.getLastGun();
        return Right(localGun);
      } on CacheException {
        return Left(CacheFailure(errorMessage: 'This is a cache exception'));
      }
    }
  }
}
