
import 'package:e_commerce/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'package:get/get.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key, required this.name, required this.imageUrl, required this.id,
  });
  final String name;
  final String imageUrl;
  final int id;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: ()
          {
              Get.to(ProductListScreen(categoryId: id));
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8)

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.network(imageUrl, height: 50,width: 50,fit: BoxFit.scaleDown,)
                  ),
                ),
               const SizedBox(height: 6,),
                Text(name,
                  textAlign:TextAlign.center,
                  style:  const TextStyle(

                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: primaryColor
                ),)
              ],
            ),
          ),
        ),
      ],
    );
  }
}