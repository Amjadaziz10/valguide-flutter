part of 'gun_bloc.dart';

abstract class GunEvent extends Equatable {
  const GunEvent();

  @override
  List<Object> get props => [];
}

class GetGunList extends GunEvent {}
