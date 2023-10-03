import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../core/services/auth.dart';
import '../../core/shared/colors.dart';
import '../../core/shared/flutter_flow_icon_button.dart';
import '../../core/shared/flutter_flow_theme.dart';
import '../profile/profile.dart';
import '../topic/presentation/pages/topic_page.dart';
import 'home_page.dart';

class HomeScreen extends StatefulWidget {
  final String? userName;
  final int selectedIndex;
  const HomeScreen({Key? key, this.userName, required this.selectedIndex})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _selectedIndex = widget.selectedIndex;
  String appBarUser = '';

  @override
  Widget build(BuildContext context) {
    if (AuthService().user!.isAnonymous) {
      appBarUser = 'Guest';
    } else if (AuthService().user!.displayName == null) {
      appBarUser = "No name";
    } else {
      appBarUser = AuthService().user!.displayName!;
    }
    List<Widget> listWidget = [
      HomePage(),
      const TopicPage(),
      const ProfilePage()
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1B252D),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: Text(
            'Hello, $appBarUser!',
            style: FlutterFlowTheme.of(context).subtitle1.override(
                  fontFamily: 'Poppins',
                  color: Color(0xFFF9F9F9),
                ),
          ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: const Icon(
              Icons.logout,
              color: Color(0xFFF9F9F9),
              size: 30,
            ),
            onPressed: () async {
              _bottomSheetLogout(context);
            },
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Color(0xFF1B252D),
      body: listWidget[_selectedIndex],
      bottomNavigationBar: Container(
        color: blackVal,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: GNav(
            backgroundColor: blackVal,
            color: whiteVal,
            activeColor: whiteVal,
            tabBackgroundColor: redVal.withOpacity(0.6),
            padding: EdgeInsets.all(10),
            gap: 8,
            tabs: [
              GButton(
                icon: FontAwesomeIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: FontAwesomeIcons.graduationCap,
                text: 'Quiz',
              ),
              GButton(
                icon: FontAwesomeIcons.circleUser,
                text: 'Profile',
              )
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
          ),
        ),
      ),
    );
  }

  _bottomSheetLogout(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Logout?',
                style: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Poppins',
                      color: blackVal,
                    ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: redVal),
                child: Text(
                  'Logout',
                  style: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Poppins',
                        color: whiteVal,
                      ),
                ),
                onPressed: () async {
                  await AuthService().signOut();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (route) => false);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
