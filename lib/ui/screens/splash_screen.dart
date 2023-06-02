

import 'dart:developer';

import 'package:e_commerce/ui/screens/bottom_nav_bar_screen.dart';
import 'package:e_commerce/ui/screens/categories_screen.dart';
import 'package:e_commerce/ui/screens/completion_user_profile_screen.dart';
import 'package:e_commerce/ui/screens/email_verification_screen.dart';
import 'package:e_commerce/ui/screens/home_screen.dart';
import 'package:e_commerce/ui/screens/product_list_screen.dart';
import 'package:e_commerce/ui/state_manager/auth_controller.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      Future.delayed(Duration(seconds: 2)).then((value) async  {
         final  bool state=  await Get.find<AuthController>().isLoggedIn();


         if(state)
           {
             Get.off(BottomNavBarScreen());
           }
          else
            {
              Get.to(const EmailVerificationScreen());
            }

        
      });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
                children: [
                  Expanded(child: Image.asset('assets/images/logo.png')),


                   Column(
                          children: const [
                              CircularProgressIndicator(
                                color: primaryColor,
                              ),

                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text("version 1.0",style:TextStyle(
                                    color: Colors.grey
                                ),),
                              )
                          ],
                      )
                ],
          ),
    );
  }
}
