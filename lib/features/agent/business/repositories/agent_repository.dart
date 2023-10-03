import 'package:dartz/dartz.dart';
import '../../../../../core/params/params.dart';
import '../../../../core/errors/failure.dart';
import '../entities/agent_entity.dart';

abstract class AgentRepository {
  Future<Either<Failure, AgentEntity>> getAgent(
      {required AgentParams agentParams});
}
