import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CommonTextField extends StatelessWidget {

  const CommonTextField({
    super.key, required this.controller, required this.validator, required this.hinText, this.textInputType,  this.maxLines,
  });
  final TextEditingController controller;
  final Function(String?) validator;
  final String hinText;
  final TextInputType? textInputType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      maxLines:maxLines ,
      controller: controller,

      validator: (value)=>validator(value),
      keyboardType: textInputType,
      decoration: InputDecoration(
          hintText: hinText,
          hintStyle:const TextStyle(
              color: softGreyColor
          ),
          contentPadding:const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor,width: 2)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor,width: 2),
          )
      ),


    );
  }
}