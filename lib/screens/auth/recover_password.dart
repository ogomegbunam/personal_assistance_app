import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:personal_assistance_app/screens/auth/create_password.dart';
import 'package:personal_assistance_app/screens/auth/sing_up.dart';
import 'package:personal_assistance_app/screens/auth/widgets/button.dart';
import 'package:personal_assistance_app/screens/auth/widgets/inputdecoration.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class RecoverPassword extends StatelessWidget {
   RecoverPassword({super.key});
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SingleChildScrollView(
        child: SafeArea(child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start ,
            children: [

            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: const Row(children: [
                Icon(Icons.arrow_back,size: 24,),
                Text("Back",style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500),)
              ],),

            ),
            SizedBox(height: 10.h,),
            Row(children: [Image.asset(
              'assets/icons/recover.png',
              height: 12.w,
              width: 12.w,
            ),],),
            SizedBox(height: 1.h,),
            Row(
              children: [
                Text(
                  'Recover Password',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF0F1728),
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            SizedBox(height: 1.h,),
             Text(
                "Enter the email address associated with your account and we’ll send an email with instructions on how to recover your password",
                style: TextStyle(
                  fontSize: 14.5.sp,
                  fontWeight: FontWeight.w400,
                )
            ),
            SizedBox(height: 2.h,),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Enter your email",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    bottom: 0, left: 0, right: 8),
                child: TextFormField(
                  style:
                  const TextStyle(color: Color(0xFF0F1728)),
                  cursorColor: Color(0xFF0F1728),
                  textAlign: TextAlign.start,
                  controller: emailController,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardAppearance: Brightness.dark,
                  autovalidateMode:
                  AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (!EmailValidator.validate(value ?? "")) {
                      return "enter a valid email";
                    }
                    return null;
                  },
                  decoration: AuthInputDecoration().decoration(
                    "Enter your email",
                    Icon(Icons.email_outlined),
                  ),
                )),
              SizedBox(
                height: 3.h,
              ),
              Buttoncreate(
                title: "Send",
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType
                              .leftToRightWithFade,
                          child: const CreateNewPassword()));
                },
              ),
              SizedBox(height: 1.5.h,),
              Center(
                child: Text.rich(
                  TextSpan(

                    children: [
                      TextSpan(
                        text: "Don't have an Account?",

                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14.sp,
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
                                    child:  SingUp()));
                          },
                        text: ' Sign Up',
                        style: TextStyle(
                          color: const Color(0xFF1B6DEE),
                          fontSize: 14.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.18,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              )


          ],),
        )),
      ) ,
    );
  }
}
