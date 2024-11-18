import 'package:construction_site_management/screens/home/home_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  static String homeScreenRouteName = '/homeScreen';
  static final List<GetPage<dynamic>> routes = [
    GetPage(name: homeScreenRouteName, page: ()=> const HomeScreen()),
  ];
}
