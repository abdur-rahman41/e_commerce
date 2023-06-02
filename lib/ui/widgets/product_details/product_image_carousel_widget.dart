import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class ProductImageCarouselWidget extends StatelessWidget {

  ValueNotifier<int>currentCurouselIndex=ValueNotifier(0);
    final List<String>images=[];


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 180.0,viewportFraction:1,autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              scrollDirection: Axis.vertical,
              onPageChanged: (index,_)
              {
                currentCurouselIndex.value=index;
              }

          ),
          items:images.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    decoration:  BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                      image: DecorationImage(
                          image: NetworkImage(imageUrl)

                      )
                    ),
                    alignment: Alignment.center,

                );
              },
            );
          }).toList(),
        ),
        
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ValueListenableBuilder(
                  valueListenable: currentCurouselIndex,
                  builder: (context, currentValue,_) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for(int i=0;i<images.length;i++)
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                  color: currentValue==i ?primaryColor:Colors.white,
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)

                              ),

                            ),
                          )
                      ],
                    );
                  }
              ),
            ),
          ),
        ),
      ],
    );
  }
}