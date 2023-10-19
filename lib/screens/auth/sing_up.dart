import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:personal_assistance_app/screens/auth/login.dart';
import 'package:personal_assistance_app/screens/auth/widgets/button.dart';
import 'package:personal_assistance_app/screens/auth/widgets/inputdecoration.dart';
import 'package:personal_assistance_app/screens/auth/widgets/passwordDecocration.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passVisibility = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [

                Row(),
                SizedBox(height: 3.h,),
                Center(
                  child: Image.asset(
                    'assets/icons/home.png',
                    height: 12.w,
                    width: 12.w,
                  ),
                ),
                SizedBox(
                  height: 4.w,
                ),
                Text(
                  'Create an account',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF0F1728),
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Sign up today and enjoy a 30-day free trial on us',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF0F1728),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 4.w,
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Name*",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 0, left: 8, right: 8),
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
                                decoration: AuthInputDecoration().decoration(
                                  "Enter your name",
                                  Icon(Icons.perm_identity_outlined),
                                ),
                              )),

                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Email*",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 0, left: 8, right: 8),
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
                          const SizedBox(
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Password*",
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
                              "Re-enter Password*",
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
                            height: 2.h,
                          ),
                          Buttoncreate(
                            title: "Sign Up",
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .leftToRightWithFade,
                                      child: const Login()));
                            },
                          ),
                          SizedBox(height: 2.h,),
                          Row(
                            children: [
                              Expanded(
                                child: Container(

                                    height: 1,
                                    decoration: BoxDecoration(
                                        color: Colors.black26)
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                    "OR",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    )
                                ),
                              ),
                              Expanded(
                                child: Container(

                                    height: 1,
                                    decoration: const BoxDecoration(
                                        color: Colors.black26)
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 2.h,),
                          Button(
                            onClick: () {},
                            data: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/icons/google.png'),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Sign up with Google',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 1.5.h,),
                          Center(
                            child: Text.rich(
                              TextSpan(

                                children: [
                                  TextSpan(
                                    text: 'Already have an Account?',

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
                                                child:  const Login()));
                                      },
                                    text: ' Login',
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

                        ],
                      ),
                    ))

            ],
          ),
        ),
      ),
    );
  }
}
class Button extends StatelessWidget {
  final Widget data;
  final VoidCallback onClick;
  const Button({super.key, required this.data, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        decoration:  BoxDecoration(

            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            border: Border.all(color: Colors.black26)),
        // width: 55.w,
        height: 12.w,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Center(child: data)),
      ),
    );
  }
}