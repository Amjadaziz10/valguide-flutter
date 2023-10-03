import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/shared/flutter_flow_theme.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/shared/loading.dart';
import '../../business/entities/gun_entity.dart';
import '../providers/gun_provider.dart';

class GunWidget extends StatelessWidget {
  const GunWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GunEntity? gun = Provider.of<GunProvider>(context).gun;
    Failure? failure = Provider.of<GunProvider>(context).failure;
    late Widget widget;
    if (gun != null) {
      widget = Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            var gunItem = gun.data[index];
            return InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                    child: Container(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 30, 0, 0),
                            child: Text(
                              gunItem.displayName.toUpperCase(),
                              style:
                                  FlutterFlowTheme.of(context).title1.override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w900,
                                      ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: CachedNetworkImage(
                                imageUrl: gunItem.displayIcon,
                                width: 180,
                                height: 70,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: gun.data.length,
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
