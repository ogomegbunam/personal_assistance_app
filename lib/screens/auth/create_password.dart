import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:personal_assistance_app/screens/auth/recovery_complete.dart';
import 'package:personal_assistance_app/screens/auth/widgets/button.dart';
import 'package:personal_assistance_app/screens/auth/widgets/passwordDecocration.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  TextEditingController passwordController = TextEditingController();
  bool passVisibility = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'assets/icons/lock.png',
                height: 12.w,
                width: 12.w,
              ),],),
              SizedBox(height: 1.h,),
              Row(
                children: [
                  Text(
                    'Create a new password',
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
                  "Your new password must be different from the previous password you used.",
                  style: TextStyle(
                    fontSize: 14.5.sp,
                    fontWeight: FontWeight.w400,
                  )
              ),
              SizedBox(height: 2.h,),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                // height: 12.w,
                child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 16, left: 8, right: 8),
                    child: TextFormField(
                      style:
                      const TextStyle(color: Color(0xFF0F1728)),
                      cursorColor: Color(0xFF0F1728),
                      textAlign: TextAlign.start,
                      obscureText: passVisibility,
                      controller: passwordController,
                      autovalidateMode:
                      AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return "password should not be empty";
                        }
                        return null;
                      },
                      onChanged: (val) {
                        setState(() {});
                      },
                      decoration:
                      AuthPasswordDecoration().decoration(
                        "Create a password",
                        Icon(Icons.lock),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              passVisibility = !passVisibility;
                            });
                          },
                          icon: Icon(
                              passVisibility
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey),
                        ),
                      ),
                    )),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Confirm Password",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                // height: 12.w,
                child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 16, left: 8, right: 8),
                    child: TextFormField(
                      style:
                      const TextStyle(color: Color(0xFF0F1728)),
                      cursorColor: Color(0xFF0F1728),
                      textAlign: TextAlign.start,
                      obscureText: passVisibility,
                      controller: passwordController,
                      autovalidateMode:
                      AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return "password should not be empty";
                        }
                        return null;
                      },
                      onChanged: (val) {
                        setState(() {});
                      },
                      decoration:
                      AuthPasswordDecoration().decoration(
                        "Create a password",
                        Icon(Icons.lock),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              passVisibility = !passVisibility;
                            });
                          },
                          icon: Icon(
                              passVisibility
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey),
                        ),
                      ),
                    )),
              ),

              SizedBox(
                height: 3.h,
              ),
              Buttoncreate(
                title: "Reset password",
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType
                              .leftToRightWithFade,
                          child: const PasswordRecovery()));
                },
              ),



            ],),
        )),
      ) ,
    );
  }
}
