import 'package:e_commerce/data/models/home_slider_model.dart';
import 'package:e_commerce/ui/screens/cart_screen.dart';
import 'package:e_commerce/ui/screens/categories_screen.dart';
import 'package:e_commerce/ui/screens/home_screen.dart';
import 'package:e_commerce/ui/screens/wish_list_screen.dart';
import 'package:e_commerce/ui/state_manager/bottom_navigation_bar_controller.dart';
import 'package:e_commerce/ui/state_manager/category_controller.dart';
import 'package:e_commerce/ui/state_manager/home_controller.dart';
import 'package:e_commerce/ui/state_manager/product_by_remark_controller.dart';
import 'package:e_commerce/ui/state_manager/product_controller.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarScreen extends StatefulWidget {
   BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    WishListScreen()
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<HomeController>().getHomeSlider();
    Get.find<CategoryController>().getCategories();
    Get.find<ProductByRemarkController>().getPopularProductsByRemark();
    Get.find<ProductByRemarkController>().getSpecialProductsByRemark();
    Get.find<ProductByRemarkController>().getNewProductsByRemark();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavigationBarController>(

        builder: (controller) {
          return _screens[controller.selectedIndex];
        }
      ),
      bottomNavigationBar: GetBuilder<BottomNavigationBarController>(

        builder: (controller) {
          return BottomNavigationBar(
            onTap: (value) {
              controller.changeIndex(value);
            },
            currentIndex: controller.selectedIndex,
            selectedItemColor: primaryColor,
            unselectedItemColor: softGreyColor,
            showUnselectedLabels: true,
            elevation: 5,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.grid_view), label: "Categories"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border), label: "Wish List")
            ],
          );
        }
      ),
    );
  }
}
