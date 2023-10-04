import 'package:flutter/material.dart';
import 'package:valguide3/core/shared/colors.dart';
import 'package:valguide3/features/agent/presentation/pages/agent_page.dart';
import 'package:valguide3/features/gun/presentation/pages/gun_page.dart';
import '../../core/shared/flutter_flow_theme.dart';
import '../map/presentation/pages/map_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: DefaultTabController(
            length: 3,
            initialIndex: 0,
            child: Column(
              children: [
                TabBar(
                  labelColor: redVal,
                  unselectedLabelColor: greyVal,
                  labelStyle: FlutterFlowTheme.of(context).subtitle1,
                  indicatorColor: redVal,
                  tabs: const [
                    Tab(
                      text: 'Agents',
                    ),
                    Tab(
                      text: 'Maps',
                    ),
                    Tab(
                      text: 'Guns',
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 0, 4),
                              child: Text(
                                'Agents',
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: whiteVal,
                                    ),
                              ),
                            ),
                            LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                return const AgentPage();
                              },
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 0, 4),
                              child: Text(
                                'Maps',
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: whiteVal,
                                    ),
                              ),
                            ),
                            LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                return const MapPage();
                              },
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 0, 0),
                              child: Text(
                                'Guns',
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: const Color(0xFFF9F9F9),
                                    ),
                              ),
                            ),
                            LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                return const GunPage();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
