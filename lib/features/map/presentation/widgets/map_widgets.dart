import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valguide3/features/agent/presentation/pages/agent_detail_page.dart';
import '../../../../../core/shared/flutter_flow_theme.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/shared/loading.dart';
import '../../business/entities/map_entity.dart';
import '../providers/map_provider.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapEntity? map = Provider.of<MapProvider>(context).map;
    Failure? failure = Provider.of<MapProvider>(context).failure;
    late Widget widget;
    if (map != null) {
      widget = Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            var mapItem = map.data[index];
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
                                  width: MediaQuery.of(context).size.width,
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
          itemCount: map.data.length,
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
