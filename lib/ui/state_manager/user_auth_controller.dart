import 'package:e_commerce/data/services/network_caller.dart';
import 'package:e_commerce/ui/state_manager/auth_controller.dart';
import 'package:e_commerce/ui/state_manager/user_profile_controller.dart';
import 'package:get/get.dart';

class UserAuthControler extends GetxController {
  bool _emailVerificationControllerInProgress = false;
  bool _otpVerificationControllerInProgress = false;
  bool get emailVerificationControllerInProgress => _emailVerificationControllerInProgress;
  bool get otpVerificationControllerInProgress => _otpVerificationControllerInProgress;

  Future<bool> emailVerificationController(String email) async {
    _emailVerificationControllerInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/UserLogin/$email');
    _emailVerificationControllerInProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      update();
      return false;
    }
  }




  Future<bool> otplVerificationController(String email,String otp) async {
    _otpVerificationControllerInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/VerifyLogin/$email/$otp');
    _otpVerificationControllerInProgress = false;
    if (response.isSuccess) {
     await Get.find<AuthController>().saveToken(response.returnData['data']);
     Get.find<UserProfileController>().getProfileData();

      update();
      return true;
    } else {
      update();
      return false;
    }
  }



}






