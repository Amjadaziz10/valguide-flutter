import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../entities/map_entity.dart';
import '../repositories/map_repository.dart';

class GetMap {
  final MapRepository repository;

  GetMap(this.repository);

  Future<Either<Failure, MapEntity>> call({
    required MapParams mapParams,
  }) async {
    return await repository.getMap(mapParams: mapParams);
  }
}
