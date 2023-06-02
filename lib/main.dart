import 'package:e_commerce/ui/state_manager/auth_controller.dart';
import 'package:e_commerce/ui/state_manager/bottom_navigation_bar_controller.dart';
import 'package:e_commerce/ui/state_manager/category_controller.dart';
import 'package:e_commerce/ui/state_manager/home_controller.dart';
import 'package:e_commerce/ui/state_manager/product_by_remark_controller.dart';
import 'package:e_commerce/ui/state_manager/user_auth_controller.dart';
import 'package:e_commerce/ui/state_manager/user_profile_controller.dart';
import 'package:get/get.dart';

import 'ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'ui/state_manager/product_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GetxBindings(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(

          appBarTheme: AppBarTheme(
              color: Colors.white,
              titleTextStyle: TextStyle(
                color: Colors.black
              )
          )
      ),

      home: SplashScreen(),
      
    );
  }
}


class GetxBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(BottomNavigationBarController());
    Get.put(UserAuthControler());
    Get.put(AuthController());
    Get.put(UserProfileController());
    Get.put(HomeController());
    Get.put(CategoryController());
    Get.put(ProductByRemarkController());
    Get.put(ProductController());
    // TODO: implement dependencies
  }

}
