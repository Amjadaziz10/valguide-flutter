import 'package:dartz/dartz.dart';
import '../../../../../core/params/params.dart';
import '../../../../core/errors/failure.dart';
import '../entities/map_entity.dart';

abstract class MapRepository {
  Future<Either<Failure, MapEntity>> getMap({required MapParams mapParams});
}
