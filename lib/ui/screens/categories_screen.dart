
import 'package:e_commerce/ui/state_manager/category_controller.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:e_commerce/ui/widgets/category_card_widget.dart';
import 'package:e_commerce/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state_manager/bottom_navigation_bar_controller.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          title: Text("Categories"),
        leading: IconButton(
          onPressed: () {
            Get.find<BottomNavigationBarController>().backHome();
          },
          icon: Icon(Icons.arrow_back_outlined,color: Colors.black,)

        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<CategoryController>(

          builder: (categoryController) {

              if(categoryController.getCategoryInprogress)
                {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                }

            return GridView.builder(
                itemCount: categoryController.categoryModel.categories!.length ?? 0,
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3

                ),
                itemBuilder: (context,index)
                {
                  final category = categoryController.categoryModel.categories![index];
                  return RefreshIndicator(
                      onRefresh: () async {
                          Get.find<CategoryController>().getCategories();
                      },
                      child: CategoryCardWidget(name: categoryController.categoryModel.categories.toString(), imageUrl: category.categoryImg.toString(), id: category.id!,));
                }
            );
          }
        ),
      )
    );
  }
}
