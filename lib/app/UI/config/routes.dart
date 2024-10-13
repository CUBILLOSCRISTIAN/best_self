import 'package:get/get.dart';

import '../pages/home/home_page.dart';
import '../pages/shop/shop.dart';


class AppRoutes {
  static const String home = '/home';
  static const String login = '/login';
  static const String profile = '/profile';

  static List<GetPage> routes = [
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(name: '/shop', page: () => Shop() ),
  ];
}