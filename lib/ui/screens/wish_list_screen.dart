
import 'package:e_commerce/ui/state_manager/bottom_navigation_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/product_card.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wish List"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: ()
          {
                Get.find<BottomNavigationBarController>().backHome();
          },
        )
      ),
    //   body:  GridView.builder(
    //     itemCount: 50,
    //     gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 3,
    //         childAspectRatio: 0.6
    //
    //     ), itemBuilder: (context,index)
    // {
    //   return const ProductCard();
    // }
    // ),
    );
  }
}
