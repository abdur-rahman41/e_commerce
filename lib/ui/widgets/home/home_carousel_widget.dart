import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/data/models/home_slider_model.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class HomeCarouselWidget extends StatelessWidget {
  final HomeSliderModel homeSliderModel;

  ValueNotifier<int>currentCurouselIndex=ValueNotifier(0);

   HomeCarouselWidget({super.key, required this.homeSliderModel});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 180.0,viewportFraction:1,autoPlay: true,
              autoPlayInterval: const Duration(seconds: 6),
              scrollDirection: Axis.vertical,
              onPageChanged: (index,_)
              {
                currentCurouselIndex.value=index;
              }

          ),
          items: homeSliderModel.sliders!.map((slider) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    decoration:  BoxDecoration(
                        color: primaryColor,
                        image: DecorationImage(
                            image: NetworkImage(
                              slider.image??' '
                            )
                        )

                    ),
                    alignment: Alignment.center,

                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 6,),
        ValueListenableBuilder(
            valueListenable: currentCurouselIndex,
            builder: (context, currentValue,_) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(int i=0;i<5;i++)
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            color: currentValue==i ?primaryColor:null,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)

                        ),

                      ),
                    )
                ],
              );
            }
        ),
      ],
    );
  }
}