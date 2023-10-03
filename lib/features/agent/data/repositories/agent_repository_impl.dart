import 'package:dartz/dartz.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../../../../core/connection/network_info.dart';
import '../../business/repositories/agent_repository.dart';
import '../datasources/agent_local_data_source.dart';
import '../datasources/agent_remote_data_source.dart';
import '../models/agent_model.dart';

class AgentRepositoryImpl implements AgentRepository {
  final AgentRemoteDataSource remoteDataSource;
  final AgentLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AgentRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AgentModel>> getAgent(
      {required AgentParams agentParams}) async {
    if (await networkInfo.isConnected!) {
      try {
        AgentModel remoteAgent =
            await remoteDataSource.getAgent(agentParams: agentParams);

        localDataSource.cacheAgent(remoteAgent);
        return Right(remoteAgent);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      }
    } else {
      try {
        AgentModel localAgent = await localDataSource.getLastAgent();
        return Right(localAgent);
      } on CacheException {
        return Left(CacheFailure(errorMessage: 'This is a cache exception'));
      }
    }
  }
}
