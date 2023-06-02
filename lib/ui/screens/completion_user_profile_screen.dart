

import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:e_commerce/ui/utils/styles.dart';
import 'package:e_commerce/ui/widgets/common_elevated_button.dart';
import 'package:e_commerce/ui/widgets/common_text_field.dart';
import 'package:flutter/material.dart';

class CompletionUserProfile extends StatefulWidget {
  const CompletionUserProfile({Key? key}) : super(key: key);

  @override
  State<CompletionUserProfile> createState() => _CompletionUserProfileState();
}

class _CompletionUserProfileState extends State<CompletionUserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Image.asset("assets/images/logo.png",height: 80,width: 80,),
                  SizedBox(height: 20,),
                  Text('Complete Profile',style: tittleTextStyle,),
                  Text("Get started with us your details",style: TextStyle(
                    color: softGreyColor
                  ),),
                  SizedBox(height: 22,),
                  CommonTextField(
                      textInputType: TextInputType.text,
                      controller: TextEditingController(),
                      validator: (String? value)
                      {

                      },
                      hinText: "First Name"),
                      SizedBox(height: 16,),
                CommonTextField(
                    textInputType: TextInputType.text,
                    controller: TextEditingController(),
                    validator: (String? value)
                    {

                    },
                    hinText: "Last Name"),
                    SizedBox(height: 16,),
                CommonTextField(
                    textInputType: TextInputType.text,
                    controller: TextEditingController(),
                    validator: (String? value)
                    {

                    },
                    hinText: "Mobile"),
                    SizedBox(height: 16,),
                CommonTextField(
                    controller: TextEditingController(),
                    validator: (String? value)
                    {

                    },
                    hinText: "City"),
                    SizedBox(height: 16,),
                CommonTextField(
                  maxLines: 5,
                    controller: TextEditingController(),
                    validator: (String? value)
                    {

                    },
                    hinText: "Shipping Address"),
                    SizedBox(height: 16,),
                    CommonElevatedButton(onTap: ()
                        {

                        }
                        , title: "Complete")




              ],
          ),
        ),
      ),
    );
  }
}
