import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:onlineShop/app/app_routes.dart';
import 'package:onlineShop/app/buildings.dart';
import 'package:onlineShop/app/routes.dart';
import 'package:onlineShop/theme/app_colors.dart';

class OnlineShop extends StatelessWidget {
  const OnlineShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      title: "Our new online shop",
      initialRoute: Routes.HOME,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialBinding: AppBinding(),
      theme: ThemeData(
          appBarTheme:
              const AppBarTheme(backgroundColor: AppColors.mainDarkBlue),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: AppColors.mainDarkBlue,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.green),
        ),
    );
  }
}
