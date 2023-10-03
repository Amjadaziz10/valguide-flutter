import 'package:data_connection_checker_tv/data_connection_checker.dart';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../../business/entities/agent_entity.dart';
import '../../business/usecases/get_agent.dart';
import '../../data/datasources/agent_local_data_source.dart';
import '../../data/datasources/agent_remote_data_source.dart';
import '../../data/repositories/agent_repository_impl.dart';

class AgentProvider extends ChangeNotifier {
  AgentEntity? agent;
  Failure? failure;

  AgentProvider({
    this.agent,
    this.failure,
  });

  void eitherFailureOrAgent() async {
    AgentRepositoryImpl repository = AgentRepositoryImpl(
      remoteDataSource: AgentRemoteDataSourceImpl(
        dio: Dio(),
      ),
      localDataSource: AgentLocalDataSourceImpl(
        sharedPreferences: await SharedPreferences.getInstance(),
      ),
      networkInfo: NetworkInfoImpl(
        DataConnectionChecker(),
      ),
    );

    final failureOrAgent = await GetAgent(repository).call(
      agentParams: AgentParams(),
    );

    failureOrAgent.fold(
      (newFailure) {
        agent = null;
        failure = newFailure;
        notifyListeners();
      },
      (newAgent) {
        agent = newAgent;
        failure = null;
        notifyListeners();
      },
    );
  }
}
