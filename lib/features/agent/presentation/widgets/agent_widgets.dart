import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valguide3/features/agent/presentation/pages/agent_detail_page.dart';
import '../../../../../core/shared/flutter_flow_theme.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/shared/loading.dart';
import '../../business/entities/agent_entity.dart';
import '../providers/agent_provider.dart';

class AgentWidget extends StatelessWidget {
  const AgentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AgentEntity? agent = Provider.of<AgentProvider>(context).agent;
    Failure? failure = Provider.of<AgentProvider>(context).failure;
    late Widget widget;
    if (agent != null) {
      widget = Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            var agentItem = agent.data[index];

            return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AgentDetailPage(agentItem: agentItem);
                  }));
                },
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFF9F9F9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.8, 0),
                          child: Hero(
                            tag: agentItem.background,
                            child: CachedNetworkImage(
                              imageUrl: agentItem.background,
                              width: 180,
                              height: 77,
                              fit: BoxFit.fitWidth,
                              color: Color(0xFF1B252D).withOpacity(0.4),
                              colorBlendMode: BlendMode.modulate,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl: agentItem.displayIcon,
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 0, 0),
                                    child: Hero(
                                      tag: agentItem.displayName,
                                      child: Text(
                                        agentItem.displayName,
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 0, 0),
                                    child: Text(
                                      agentItem.role.displayName,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
          },
          itemCount: agent.data.length,
        ),
      );
    } else if (failure != null) {
      widget = Center(
        child: Text(failure.errorMessage),
      );
    } else {
      widget = Center(
        child: buildCircularProgressIndicator(),
      );
    }
    return widget;
  }
}
