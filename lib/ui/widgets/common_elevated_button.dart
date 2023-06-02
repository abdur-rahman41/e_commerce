import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CommonElevatedButton extends StatelessWidget {
  const CommonElevatedButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
          ),
          onPressed: onTap,
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w400),
          )),
      width: double.infinity,
    );
  }
}
