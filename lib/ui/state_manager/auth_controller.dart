



import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
 static String? _token;

  static String? get token =>_token;

  Future<bool>isLoggedIn()async
  {
        await getToken();


        return _token!=null;
  }


    Future<void>saveToken(String userToken)async
    {
      log(userToken);
        SharedPreferences preference =  await SharedPreferences.getInstance();

        await preference.setString('crafty_token', userToken);
      _token = userToken;



    }


  Future<void>getToken()async
  {
    SharedPreferences preference =  await SharedPreferences.getInstance();

    _token = preference.getString('crafty_token');
  }

  Future<void>clearUserData()async
  {
    SharedPreferences preference =  await SharedPreferences.getInstance();

      preference.clear();
  }



}