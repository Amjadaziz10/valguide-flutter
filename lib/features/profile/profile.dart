import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valguide3/core/shared/colors.dart';
import '../../../../core/services/auth.dart';
import '../../../../core/services/models.dart';
import '../../../../core/shared/flutter_flow_theme.dart';
import '../../../../core/shared/loading.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var report = Provider.of<Report>(context);
    var user = AuthService().user;

    if (user != null) {
      return Scaffold(
        backgroundColor: blackVal,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(user.photoURL ??
                        'https://cdn1.iconfinder.com/data/icons/user-pictures/100/unknown-512.png'),
                  ),
                ),
              ),
              Text(user.displayName ?? 'Guest',
                  style: FlutterFlowTheme.of(context).subtitle1.override(
                        lineHeight: 3,
                        fontFamily: 'Poppins',
                        color: whiteVal,
                      )),
              const Spacer(),
              Text('${report.total}',
                  style: FlutterFlowTheme.of(context).title1.override(
                      fontFamily: 'Poppins', color: whiteVal, fontSize: 64)),
              Text('Quizzes Completed',
                  style: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Poppins',
                        color: whiteVal,
                      )),
              const Spacer(),
            ],
          ),
        ),
      );
    } else {
      return buildCircularProgressIndicator();
    }
  }
}
