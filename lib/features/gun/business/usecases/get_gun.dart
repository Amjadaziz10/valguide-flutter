import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../entities/gun_entity.dart';
import '../repositories/gun_repository.dart';

class GetGun {
  final GunRepository repository;

  GetGun(this.repository);

  Future<Either<Failure, GunEntity>> call({
    required GunParams gunParams,
  }) async {
    return await repository.getGun(gunParams: gunParams);
  }
}
