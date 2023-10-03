import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../entities/agent_entity.dart';
import '../repositories/agent_repository.dart';

class GetAgent {
  final AgentRepository repository;

  GetAgent(this.repository);

  Future<Either<Failure, AgentEntity>> call({
    required AgentParams agentParams,
  }) async {
    return await repository.getAgent(agentParams: agentParams);
  }
}
