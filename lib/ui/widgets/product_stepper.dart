
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ProductStepper extends StatefulWidget {
 const  ProductStepper({Key? key}) : super(key: key);

  @override
  State<ProductStepper> createState() => _ProductStepperState();
}

class _ProductStepperState extends State<ProductStepper> {
  int _currentValue=1;

 final TextEditingController stepperTEController=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        stepperButton(onTap: () {

        if(_currentValue>1)
        {
          _currentValue--;
        }
        stepperTEController.text=_currentValue.toString();
        },
            iconData: Icons.remove
    ),
        SizedBox(
            width: 50,
            height: 30,
            child: TextField(
              textAlign: TextAlign.center,
              controller: stepperTEController,
              enabled: false,
              style:  const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
              ),
              decoration: InputDecoration(

                  border: OutlineInputBorder(
                      borderSide: BorderSide.none
                  )
              ),

            )),
       stepperButton(onTap: () {
         if(_currentValue<20)
         {
           _currentValue++;
         }
         stepperTEController.text=_currentValue.toString();
       },
           iconData: Icons.add
       )

      ],
    );
  }

    Widget stepperButton({required VoidCallback onTap, required IconData iconData}){
        return  SizedBox(
          height: 30,
          width: 30,
          child: InkWell(

            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: primaryColor,
              ),

              child: Icon(
                  iconData,
                  color: Colors.white,
                  size:16
              ),
            ),
          ),
        );
    }
}