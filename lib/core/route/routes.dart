import 'package:valguide3/init_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../features/skeleton/skeleton.dart';
import '../../features/login/login_screen.dart';
import '../../features/register/register_screen.dart';

var appRoutes = {
  '/': (context) => const InitScreen(),
  '/onboarding': (context) => const OnboardingScreen(),
  '/login': (context) => const LoginScreen(),
  '/register': (context) => const RegisterScreen(),
  '/home': (context) => const HomeScreen(
        selectedIndex: 0,
      ),
  '/topics': (context) => const HomeScreen(
        selectedIndex: 1,
      ),
};
