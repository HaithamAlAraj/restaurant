import 'package:get/get.dart';
import 'package:restaurant/core/utils/routes/routes_string.dart';
import 'package:restaurant/views/screens/auth/login.dart';
import 'package:restaurant/views/screens/auth/signup.dart';
import 'package:restaurant/views/screens/introduction.dart';
import 'package:restaurant/views/screens/main/dashboard.dart';
import 'package:restaurant/views/screens/main/home.dart';
import 'package:restaurant/views/screens/splash.dart';

class Routes {
  final List<GetPage> getPages = [
    GetPage(name: RoutesString.splash, page: () => const SplashScreen()),
    GetPage(
      name: RoutesString.introduction,
      page: () => const IntroductionScreen(),
    ),
    GetPage(name: RoutesString.login, page: () => LoginScreen()),
    GetPage(name: RoutesString.signup, page: () => SignupScreen()),
    GetPage(name: RoutesString.dashboard, page: () => const DashboardScreen()),
    GetPage(name: RoutesString.home, page: () => HomeScreen()),
  ];
}
