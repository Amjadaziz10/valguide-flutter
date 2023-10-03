import 'package:dio/dio.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/params/params.dart';
import '../../../../core/constants/constants.dart';
import '../models/gun_model.dart';

abstract class GunRemoteDataSource {
  Future<GunModel> getGun({required GunParams gunParams});
}

class GunRemoteDataSourceImpl implements GunRemoteDataSource {
  final Dio dio;

  GunRemoteDataSourceImpl({required this.dio});

  @override
  Future<GunModel> getGun({required GunParams gunParams}) async {
    final response = await dio.get(
      "$baseUrl/weapons",
      queryParameters: {
        'api_key': 'if needed',
      },
    );

    if (response.statusCode == 200) {
      return GunModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
