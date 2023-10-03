import 'package:dio/dio.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/params/params.dart';
import '../../../../core/constants/constants.dart';
import '../models/map_model.dart';

abstract class MapRemoteDataSource {
  Future<MapModel> getMap({required MapParams mapParams});
}

class MapRemoteDataSourceImpl implements MapRemoteDataSource {
  final Dio dio;

  MapRemoteDataSourceImpl({required this.dio});

  @override
  Future<MapModel> getMap({required MapParams mapParams}) async {
    final response = await dio.get(
      "$baseUrl/maps",
      queryParameters: {
        'api_key': 'if needed',
      },
    );

    if (response.statusCode == 200) {
      return MapModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
