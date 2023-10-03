import 'package:flutter/cupertino.dart';
import 'package:valguide3/splash_screen.dart';
import 'core/services/auth.dart';
import 'features/onboarding/onboarding_screen.dart';
import 'features/skeleton/skeleton.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SplashScreen(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error'),
          );
        } else if (snapshot.hasData) {
          return const HomeScreen(
            selectedIndex: 0,
          );
        } else {
          return const OnboardingScreen();
        }
      },
    );
  }
}
