part of 'agent_bloc.dart';

abstract class AgentState extends Equatable {
  const AgentState();

  @override
  List<Object> get props => [];
}

class AgentInitial extends AgentState {}

class AgentLoading extends AgentState {}

class AgentLoaded extends AgentState {
  final AgentEntity agentEntity;

  const AgentLoaded(this.agentEntity);
}

class AgentError extends AgentState {
  final String? message;

  const AgentError(this.message);
}
