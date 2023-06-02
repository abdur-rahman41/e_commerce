import 'package:e_commerce/data/models/product.dart';
import 'package:e_commerce/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: InkWell(
        onTap: ()
        {
          Get.to(  ProductDetailsScreen(productId: product.id!,));
        },
        borderRadius: BorderRadius.circular(10),
        child: Card(
          elevation: 3,
          shadowColor: primaryColor.withOpacity(0.2),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
          ),

          child: Column(
            children: [
              Image.network(product.image??'',width: 100,height: 90,fit: BoxFit.scaleDown,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(product.title??'Unknown',style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: softGreyColor
                    ),),
                    SizedBox(height: 4,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$${product.price}",style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: primaryColor
                        ),),
                        const SizedBox(height: 4,),
                        Wrap(
                            children: [Icon(Icons.star,color: Colors.amber,size: 14,),Text("${product.star??0}",style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: softGreyColor
                            ),),]
                        ),

                        Container(
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.favorite_border,size: 14,color: Colors.white,),
                          ),
                        )

                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}