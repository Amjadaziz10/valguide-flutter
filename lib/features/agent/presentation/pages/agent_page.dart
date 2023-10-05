import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valguide3/features/agent/presentation/bloc/agent_bloc.dart';
import 'package:valguide3/features/agent/presentation/widgets/agent_widget.dart';
import '../../../../core/shared/flutter_flow_theme.dart';
import '../../../../core/shared/loading.dart';
import 'agent_detail_page.dart';

class AgentPage extends StatefulWidget {
  const AgentPage({Key? key}) : super(key: key);

  @override
  State<AgentPage> createState() => _AgentPageState();
}

class _AgentPageState extends State<AgentPage> {
  final AgentBloc _agentBloc = AgentBloc();
  @override
  void initState() {
    _agentBloc.add(GetAgentList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildListAgent();
  }

  Widget _buildListAgent() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
      child: BlocProvider(
          create: (context) => _agentBloc,
          child: BlocBuilder<AgentBloc, AgentState>(
            builder: (context, state) {
              if (state is AgentInitial) {
                return Center(
                  child: buildCircularProgressIndicator(),
                );
              } else if (state is AgentLoaded) {
                return AgentWidget(
                  agentEntity: state.agentEntity,
                );
              } else if (state is AgentError) {
                return Center(child: Text(state.message ?? ""));
              } else {
                return Container();
              }
            },
          )),
    );
  }
}
