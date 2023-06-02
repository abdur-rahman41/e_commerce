import 'dart:convert';
import 'dart:developer';

import 'package:e_commerce/data/models/response_model.dart';
import 'package:e_commerce/ui/state_manager/auth_controller.dart';
import 'package:e_commerce/ui/state_manager/user_auth_controller.dart';


import 'package:http/http.dart';

import '../utils/urls.dart';

class NetworkCaller {
  NetworkCaller._();

  static Future<ResponseModel> getRequest({required String url}) async {
    try {

      final Response response = await get(Uri.parse(Urls.baseUrl + url),headers: {
        'Content-type':'application/json',
        'Accept':'application/json',
        'token':AuthController.token.toString(),
      }
      );
         // log(response.body);
         // log(response.statusCode.toString());
      if (response.statusCode == 200) {
          return ResponseModel(

            statusCode: response.statusCode,
            returnData: jsonDecode(response.body),
            isSuccess: true,
            
          );
      }
     else if (response.statusCode == 401) {
        return ResponseModel(

          statusCode: response.statusCode,
          returnData: jsonDecode(response.body),
          isSuccess: false,

        );
      }
      else {
        return ResponseModel(

          statusCode: response.statusCode,
          returnData: jsonDecode(response.body),
          isSuccess: false,

        );
      }
    } catch (e) {
      // TODO
        log(e.toString());
        return ResponseModel(

          statusCode:-1,
          returnData: e.toString(),
          isSuccess: false

        );
    }
  }
}
