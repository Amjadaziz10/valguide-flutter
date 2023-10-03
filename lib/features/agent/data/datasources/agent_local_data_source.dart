import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/errors/exceptions.dart';
import '../models/agent_model.dart';

abstract class AgentLocalDataSource {
  Future<void>? cacheAgent(AgentModel? agentToCache);
  Future<AgentModel> getLastAgent();
}

const cachedAgent = 'CACHED_AGENT';

class AgentLocalDataSourceImpl implements AgentLocalDataSource {
  final SharedPreferences sharedPreferences;

  AgentLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<AgentModel> getLastAgent() {
    final jsonString = sharedPreferences.getString(cachedAgent);

    if (jsonString != null) {
      return Future.value(AgentModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void>? cacheAgent(AgentModel? agentToCache) async {
    if (agentToCache != null) {
      sharedPreferences.setString(
        cachedAgent,
        json.encode(
          agentToCache.toJson(),
        ),
      );
    } else {
      throw CacheException();
    }
  }
}
