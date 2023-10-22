import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:personal_assistance_app/screens/auth/create_password.dart';
import 'package:personal_assistance_app/screens/auth/recover_password.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'auth/widgets/button.dart';

class Passcode extends StatefulWidget {
  const Passcode({super.key});

  @override
  State<Passcode> createState() => _PasscodeState();
}

class _PasscodeState extends State<Passcode> {
  TextEditingController codeController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
                color: Color(0xFFDCECFF),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Image.asset(
              'assets/icons/email.png',
              height: 60,
              width: 60,
              //width: double.maxFinite,
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Password recovery code',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F1728),
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          const Text(
            'We sent a 6-digit password recovery code to \nyour email. Enter the code to proceed.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF667084),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 1,
              letterSpacing: -0.24,
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          SizedBox(
            width: 90.w,
            child: PinCodeTextField(
              length: 6,
              appContext: context,
              cursorColor: Colors.black26,
              cursorWidth: 2,
              hintStyle: TextStyle(
                  color: Colors.black26,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp),
              obscureText: false,
              hintCharacter: "0",


              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                inactiveColor: Colors.black26,
                activeColor: Colors.transparent,

                inactiveFillColor: Colors.transparent,
                activeFillColor: Colors.transparent,
                errorBorderColor: Colors.red,
                activeBorderWidth: 2,
                inactiveBorderWidth: 2,
                selectedColor: Colors.black26,

                shape: PinCodeFieldShape.box,
                selectedFillColor: Colors.transparent,
                borderWidth: 2,
                borderRadius: BorderRadius.circular(8),
                fieldHeight: 40,
                fieldWidth: 40,
                //activeFillColor: Colors.white,
              ),
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,

              enableActiveFill: true,
              // errorAnimationController: errorController,
              controller: codeController,
              onCompleted: (v) {
                print("Completed");
              },
              onChanged: (value) {
                print(value);
               
              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              },
            ),
          ),
          SizedBox(

            height: 0.5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text('If you didn’t receive the code, click ',style: TextStyle(color: Colors.black54 ,fontSize: 13.sp),),
            GestureDetector(
              onTap: (){},
                child: const Text('Resend code',style: TextStyle(color:  Color(0xFF184CC8),),), ),

             Text(' in 35s',style: TextStyle(color: Colors.black54,fontSize: 13.sp),),
          ],),
          SizedBox(
            height: 6.h,
          ),
          Buttoncreate(
            title: "Reset password",
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRightWithFade,
                      child: const CreateNewPassword()));
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 30.h,),
              Text.rich(
                TextSpan(

                  children: [
                    TextSpan(
                      text: "Did not receive the email? Check our Spam folder or ",

                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.18,
                      ),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType
                                      .leftToRightWithFade,
                                  child:  RecoverPassword()));
                        },
                      text: ' Try another email address',
                      style: TextStyle(
                        color: const Color(0xFF1B6DEE),
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.18,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    ));
    ;
  }
}
