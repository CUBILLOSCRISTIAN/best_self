import 'package:best_self/app/UI/pages/home/splas_screen.dart';
import 'package:get/get.dart';

import '../pages/home/home_page.dart';
import '../pages/user-config/user_config.dart';

class AppRoutes {
  static const String home = '/home';
  static const String login = '/login';
  static const String profile = '/profile';

  static List<GetPage> routes = [
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(name: '/splash', page: () => SplashScreen()),
    GetPage(name: '/user-config', page: () => UserConfigPage()),
  ];
}
