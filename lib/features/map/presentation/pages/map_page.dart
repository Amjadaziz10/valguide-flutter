import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valguide3/features/map/presentation/bloc/map_bloc.dart';

import '../../../../core/shared/flutter_flow_theme.dart';
import '../../../../core/shared/loading.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapBloc _mapBloc = MapBloc();
  @override
  void initState() {
    _mapBloc.add(GetMapList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildListMap();
  }

  Widget _buildListMap() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
      child: BlocProvider(
        create: (context) => _mapBloc,
        child: BlocBuilder<MapBloc, MapState>(builder: (context, state) {
          if (state is MapInitial) {
            return Center(child: buildCircularProgressIndicator());
          } else if (state is MapLoaded) {
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  var mapItem = state.mapEntity.data[index];
                  return InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFF9F9F9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: AlignmentDirectional(0, 0.95),
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: CachedNetworkImage(
                                        imageUrl: mapItem.splash,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 70,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(-0.95, 0),
                                      child: Text(
                                        mapItem.displayName.toUpperCase(),
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFFF9F9F9),
                                              fontWeight: FontWeight.w900,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: state.mapEntity.data.length,
              ),
            );
          } else if (state is MapError) {
            return Center(
              child: Text(state.message ?? ""),
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
