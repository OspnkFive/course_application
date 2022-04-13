import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:onlineShop/app/routes.dart';
import 'package:onlineShop/ui/home/products/bin/bin_list.dart';
import 'package:onlineShop/ui/main_screen/main_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: Routes.HOME,
        page: () => MainScreen(),
      ),
    GetPage(
        name: Routes.BIN,
        page: () => BinScreen(),
      ),
  ];
}