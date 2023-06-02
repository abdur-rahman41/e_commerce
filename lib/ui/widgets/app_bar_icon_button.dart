

import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    super.key, required this.inconData,  required this.onTap,
  });
  final IconData inconData;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      splashColor: primaryColor.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 4.0),
        child: CircleAvatar(

          backgroundColor:Colors.grey.shade200,
          radius: 15,
          child: Icon(inconData,color: softGreyColor,size: 18,),
        ),
      ),
    );
  }
}