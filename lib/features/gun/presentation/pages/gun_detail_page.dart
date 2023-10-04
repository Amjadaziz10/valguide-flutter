import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valguide3/features/gun/business/entities/gun_entity.dart';
import '../../../../core/shared/colors.dart';
import '../../../../core/shared/flutter_flow_theme.dart';

class GunDetailPage extends StatelessWidget {
  final GunDataEntity gunItem;
  const GunDetailPage({super.key, required this.gunItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackVal,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.chevron_left_rounded,
            color: whiteVal,
            size: 32,
          ),
        ),
        title: Text(
          gunItem.displayName,
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: whiteVal,
              ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: blackVal,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 0, 16),
              child: Hero(
                tag: gunItem.displayIcon,
                child: CachedNetworkImage(
                  imageUrl: gunItem.displayIcon,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Hero(
                      tag: gunItem.displayName,
                      child: Text(
                        gunItem.displayName,
                        style: FlutterFlowTheme.of(context).title2.override(
                              fontFamily: 'Poppins',
                              color: whiteVal,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
