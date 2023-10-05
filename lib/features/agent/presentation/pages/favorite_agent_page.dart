import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valguide3/features/agent/data/models/agent_model.dart';
import 'package:valguide3/features/agent/presentation/widgets/agent_widget.dart';

import '../../../../core/shared/colors.dart';
import '../../../../core/shared/flutter_flow_theme.dart';

class FavoriteAgentPage extends StatelessWidget {
  const FavoriteAgentPage({super.key});

  @override
  Widget build(BuildContext context) {
    var agent = Provider.of<AgentModel>(context);
    // var report = Provider.of<Report>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1B252D),
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.chevron_left_rounded,
              color: redVal,
              size: 32,
            ),
          ),
          title: Text(
            "Favorite Agents",
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Poppins',
                  color: redVal,
                ),
          ),
          centerTitle: false,
          elevation: 0,
        ),
        backgroundColor: blackVal,
        body: agent.data.isNotEmpty
            ? AgentWidget(
                agentModel: agent,
              )
            : Center(
                child: Text(
                  "No Favorite Agents",
                  style: FlutterFlowTheme.of(context).title2.override(
                        fontFamily: 'Poppins',
                        color: whiteVal,
                      ),
                ),
              ),
      ),
    );
  }
}
