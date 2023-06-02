import 'package:e_commerce/ui/state_manager/user_auth_controller.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:e_commerce/ui/utils/styles.dart';
import 'package:e_commerce/ui/screens/otp_verification_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/common_elevated_button.dart';
import '../widgets/common_text_field.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  TextEditingController _emailETController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<UserAuthControler>(

          builder: (authController) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/logo.png',height: 80,width: 80,),
                      const SizedBox(height: 16,),
                      Text("Welcome Back",
                          style:tittleTextStyle,),
                      const SizedBox(height: 4,),
                      Text("Please Enter Your Email Address",style: TextStyle(
                            color:softGreyColor,
                      ),),
                      SizedBox(height: 8,),
                     authController.emailVerificationControllerInProgress? CircularProgressIndicator() : CommonTextField(
                        controller: _emailETController,
                        hinText: "Email Address",
                        textInputType:TextInputType.emailAddress,
                        validator: (String? value)
                        {
                              if(value?.isEmpty??true)
                                {
                                  return"Enter a valid Email";
                                }
                                else
                                  return null;
                        },
                      ),
                      SizedBox(height: 16,),

                      CommonElevatedButton(
                          title:"Next",

                         onTap: () async{
                              if(_formKey.currentState!.validate()) {
                                final bool response = await authController
                                    .emailVerificationController(
                                    _emailETController.text);
                                if (response) {
                                  Get.to( OtpVerificationScreen(email:_emailETController.text));
                                }
                                else {
                                  Get.defaultDialog(
                                      title: "Email verification failed. Try again");
                                }
                              }

                         },

                      )

                    ],
                ),
              ),
            );
          }
        ),
    );
  }
}




