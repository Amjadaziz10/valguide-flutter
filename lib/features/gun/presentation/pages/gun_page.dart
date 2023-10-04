import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valguide3/features/gun/presentation/bloc/gun_bloc.dart';
import 'package:valguide3/features/gun/presentation/pages/gun_detail_page.dart';
import '../../../../core/shared/flutter_flow_theme.dart';
import '../../../../core/shared/loading.dart';

class GunPage extends StatefulWidget {
  const GunPage({Key? key}) : super(key: key);

  @override
  State<GunPage> createState() => _GunPageState();
}

class _GunPageState extends State<GunPage> {
  final GunBloc _gunBloc = GunBloc();
  @override
  void initState() {
    _gunBloc.add(GetGunList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildListGun();
  }

  Widget _buildListGun() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
      child: BlocProvider(
        create: (context) => _gunBloc,
        child: BlocBuilder<GunBloc, GunState>(builder: (context, state) {
          if (state is GunInitial) {
            return Center(child: buildCircularProgressIndicator());
          } else if (state is GunLoaded) {
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  var gunItem = state.gunEntity.data[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return GunDetailPage(gunItem: gunItem);
                      }));
                    },
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 30, 0, 0),
                                  child: Hero(
                                    tag: gunItem.displayName,
                                    child: Text(
                                      gunItem.displayName.toUpperCase(),
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w900,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(1, 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(2),
                                    child: Hero(
                                      tag: gunItem.displayIcon,
                                      child: CachedNetworkImage(
                                        imageUrl: gunItem.displayIcon,
                                        width: 180,
                                        height: 70,
                                        fit: BoxFit.contain,
                                      ),
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
                itemCount: state.gunEntity.data.length,
              ),
            );
          } else if (state is GunError) {
            return Center(child: Text(state.message ?? ""));
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
