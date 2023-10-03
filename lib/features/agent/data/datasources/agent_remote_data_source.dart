import 'package:dio/dio.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/params/params.dart';
import '../../../../core/constants/constants.dart';
import '../models/agent_model.dart';

abstract class AgentRemoteDataSource {
  Future<AgentModel> getAgent({required AgentParams agentParams});
}

class AgentRemoteDataSourceImpl implements AgentRemoteDataSource {
  final Dio dio;

  AgentRemoteDataSourceImpl({required this.dio});

  @override
  Future<AgentModel> getAgent({required AgentParams agentParams}) async {
    final response = await dio.get(
      "$baseUrl/agents/?isPlayableCharacter=true",
      queryParameters: {
        'api_key': 'if needed',
      },
    );

    if (response.statusCode == 200) {
      return AgentModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
