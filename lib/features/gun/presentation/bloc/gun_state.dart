part of 'gun_bloc.dart';

abstract class GunState extends Equatable {
  const GunState();

  @override
  List<Object> get props => [];
}

class GunInitial extends GunState {}

class GunLoading extends GunState {}

class GunLoaded extends GunState {
  final GunEntity gunEntity;

  const GunLoaded(this.gunEntity);
}

class GunError extends GunState {
  final String? message;

  const GunError(this.message);
}
