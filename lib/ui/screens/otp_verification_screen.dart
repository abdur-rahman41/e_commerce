import 'package:e_commerce/ui/screens/home_screen.dart';
import 'package:e_commerce/ui/state_manager/user_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/app_colors.dart';
import '../utils/styles.dart';
import '../widgets/common_elevated_button.dart';
import '../widgets/common_text_field.dart';
import 'package:get/get.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email ;
  const OtpVerificationScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController otpETController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GetBuilder<UserAuthControler>(

          builder: (UserAuthControler) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 80,
                  width: 80,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Enter OTP Code",
                  style: tittleTextStyle,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "A 4 Digit OTP Code has been sent",
                  style: TextStyle(
                    color: softGreyColor,
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                PinCodeTextField(
                  controller: otpETController,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 45,
                      fieldWidth: 45,
                      activeFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      selectedColor: Colors.green,
                      activeColor: primaryColor,
                      inactiveColor: primaryColor,
                      inactiveFillColor: Colors.white),
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (v) {},
                  onChanged: (value) {},
                  appContext: context,
                ),
                SizedBox(
                  height: 16,
                ),
               UserAuthControler.otpVerificationControllerInProgress? const CircularProgressIndicator(): CommonElevatedButton(
                  title: "Next",
                  onTap: () async{

                    final bool response = await UserAuthControler.otplVerificationController(widget.email,otpETController.text);
                    if(response)
                    {
                      Get.offAll(HomeScreen());
                    }
                    else
                    {
                      Get.showSnackbar(GetSnackBar(title:"Otp verification failed" ,message: "Check your once again before enter it",));
                    }
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                RichText(
                  text: const TextSpan(
                      style: TextStyle(fontSize: 13, color: softGreyColor),
                      text: "The code will be expire in",
                      children: [
                        TextSpan(
                            style: TextStyle(
                                color: primaryColor, fontWeight: FontWeight.w600),
                            text: ' 120'),
                      ]),
                ),
                TextButton(
                    onPressed: ()  {

                    },
                    child: Text(
                      "Resend Code",
                      style: TextStyle(color: Colors.grey.withOpacity(0.5)),
                    ))
              ],
            );
          }
        ),
      ),
    );
  }
}
