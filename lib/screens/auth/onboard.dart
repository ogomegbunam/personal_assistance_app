import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:personal_assistance_app/screens/auth/login.dart';
import 'package:personal_assistance_app/screens/auth/widgets/button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(flex:2,child: Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                   CircleAvatar(
                    backgroundColor:Color(0xFFDCECFF),
                    radius:90,
                    child:  Image.asset(
                      'assets/icons/home.png',
                      height: 90,
                      width: 100,
                      //width: double.maxFinite,
                    ),

                  ),
                  SizedBox(
                    height: 15.h,
                  ),

                  Image.asset(
                    'assets/icons/Voice.png',

                    //width: double.maxFinite,
                  ),
                ],
              )),
              Expanded(flex:1, child:Column(
              crossAxisAlignment:CrossAxisAlignment.center ,
              children: [
                Row(),
              const Text(
                'Your Powerful \n Personal Assistant',
                textAlign: TextAlign.center,

                style: TextStyle(
                  color: Color(0xFF0F1728),
                  fontSize: 32,
                //  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.16,
                  height: 1,
                ),
              ),
                SizedBox(height:2.h ,),
                const Text(
                  'An AI-powered personal assistant for your everyday life. We promise you’ll fall in love.',
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
                Buttoncreate(title:"Get Started" ,onPressed: (){
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType
                              .leftToRightWithFade,
                          child: const Login()));
                },)
            ],) )
          ],
        ),
      )
    )
    ;
  }
}
