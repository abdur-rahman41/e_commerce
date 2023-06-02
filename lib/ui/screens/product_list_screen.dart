

import 'package:e_commerce/ui/state_manager/product_controller.dart';
import 'package:e_commerce/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key, required this.categoryId}) : super(key: key);
 final int categoryId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
    @override
  void initState() {
    // TODO: implement initState
      Get.find<ProductController>().getProductsByCategory(widget.categoryId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title:  const Text("Products"),
              leading: BackButton(
                      color: Colors.black,
                  onPressed: ()
                {

                },
              ),
            ),
          body: GetBuilder<ProductController>(

            builder: (producrController) {
              if(producrController.getProductsByCategoryInProgress)
                {
                    return Center(
                        child: CircularProgressIndicator(),
                    );
                }
              return GridView.builder(
                  itemCount: producrController.productByCategoryModel.products?.length??0,
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.6

              ), itemBuilder: (context,index)
                  {
                        return  ProductCard(product: producrController.productByCategoryModel.products![index]);
                  }
              );
            }
          ),
    );
  }
}
