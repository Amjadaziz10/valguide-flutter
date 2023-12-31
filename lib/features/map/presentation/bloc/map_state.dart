part of 'map_bloc.dart';

abstract class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

class MapInitial extends MapState {}

class MapLoading extends MapState {}

class MapLoaded extends MapState {
  final MapEntity mapEntity;

  const MapLoaded(this.mapEntity);
}

class MapError extends MapState {
  final String? message;

  const MapError(this.message);
}
