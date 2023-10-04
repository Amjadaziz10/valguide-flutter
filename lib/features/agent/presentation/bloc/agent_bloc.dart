import 'package:bloc/bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valguide3/features/agent/business/entities/agent_entity.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../core/params/params.dart';
import '../../business/usecases/get_agent.dart';
import '../../data/datasources/agent_local_data_source.dart';
import '../../data/datasources/agent_remote_data_source.dart';
import '../../data/repositories/agent_repository_impl.dart';

part 'agent_event.dart';
part 'agent_state.dart';

class AgentBloc extends Bloc<AgentEvent, AgentState> {
  AgentBloc() : super(AgentInitial()) {
    on<GetAgentList>((event, emit) async {
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
          emit(AgentError(newFailure.errorMessage));
        },
        (newAgent) {
          emit(AgentLoaded(newAgent));
        },
      );
    });
  }
}
