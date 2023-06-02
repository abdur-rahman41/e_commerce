
import 'dart:developer';

import 'package:e_commerce/ui/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


import '../../data/services/network_caller.dart';
import '../screens/completion_user_profile_screen.dart';

class UserProfileController extends GetxController {

       bool _profileInprogress =false;
       get profileInprogress => _profileInprogress;

  Future<bool?> getProfileData() async {
    _profileInprogress =true;
    update();
    final response = await NetworkCaller.getRequest(url: '/ReadProfile');
    _profileInprogress =false;
  // log(response.returnData['data'].toString());
  //  log(response.statusCode.toString());
    log("user profile");

    if (response.isSuccess ) {
      if(response.returnData['data'].toString()=='[]')
        {
          Get.to(CompletionUserProfile());
          update();
          return true;
        }
      else
        {
          Get.to(HomeScreen());
        }



    }
    else {
      update();
      return false;
    }
  }


}