import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valguide3/core/shared/colors.dart';
import 'package:valguide3/features/agent/business/entities/agent_entity.dart';
import 'package:valguide3/features/agent/data/models/agent_model.dart';

import '../../../../core/shared/flutter_flow_theme.dart';
import '../pages/agent_detail_page.dart';

class AgentWidget extends StatelessWidget {
  final AgentEntity? agentEntity;
  final AgentModel? agentModel;
  const AgentWidget({super.key, this.agentEntity, this.agentModel});

  @override
  Widget build(BuildContext context) {
    var snapshot = agentModel ?? agentEntity;

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          var agentItem = snapshot.data[index];
          return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AgentDetailPage(agentItem: agentItem);
                }));
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: whiteVal,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.8, 0),
                        child: CachedNetworkImage(
                          imageUrl: agentItem.background,
                          width: 180,
                          height: 77,
                          fit: BoxFit.fitWidth,
                          color: const Color(0xFF1B252D).withOpacity(0.4),
                          colorBlendMode: BlendMode.modulate,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 0, 0),
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
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
        itemCount: snapshot!.data.length,
      ),
    );
  }
}
