

import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,

      onSubmitted: (value)
      {

      },
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          fillColor: softGreyColor.withOpacity(0.2),
          filled: true,
          hintText: "Search",
          prefixIcon: Icon(Icons.search,color: softGreyColor,),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8)

          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8)
          )
      ),
    );
  }
}