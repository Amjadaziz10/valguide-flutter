import 'package:dartz/dartz.dart';
import '../../../../../core/params/params.dart';
import '../../../../core/errors/failure.dart';
import '../entities/gun_entity.dart';

abstract class GunRepository {
  Future<Either<Failure, GunEntity>> getGun({required GunParams gunParams});
}
