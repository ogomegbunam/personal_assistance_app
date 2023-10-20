import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:personal_assistance_app/screens/auth/widgets/button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'login.dart';
class PasswordRecovery extends StatelessWidget {
  const PasswordRecovery({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 0.h,
              ),
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  color: Color(0xFFDCECFF),
                  borderRadius: BorderRadius.all(Radius.circular(15))
                ),

                child:  Image.asset(
                  'assets/icons/check.png',
                  height: 60,
                  width: 60,
                  //width: double.maxFinite,
                ),

              ),
              SizedBox(height: 3.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Password reset complete',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF0F1728),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(height:2.h ,),
              const Text(
                'Your password reset was successful. You can now proceed to login to your account.',
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
              SizedBox(height: 6.h,),
              Buttoncreate(title:"Log in" ,onPressed: (){
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType
                            .leftToRightWithFade,
                        child: const Login()));
              },)
            ],
          ),
        )
    )
    ;
  }
}
