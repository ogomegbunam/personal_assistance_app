import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:personal_assistance_app/screens/auth/recover_password.dart';
import 'package:personal_assistance_app/screens/auth/sing_up.dart';
import 'package:personal_assistance_app/screens/auth/widgets/button.dart';
import 'package:personal_assistance_app/screens/auth/widgets/inputdecoration.dart';
import 'package:personal_assistance_app/screens/auth/widgets/passwordDecocration.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passVisibility = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(),
                SizedBox(height: 5.h,),
                Center(
                  child: Image.asset(
                    'assets/icons/home.png',
                    height: 12.w,
                    width: 12.w,
                  ),
                ),
                SizedBox(
                  height: 8.w,
                ),
                Text(
                  'Log in to your account',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF0F1728),
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Welcome back. Please enter your details',
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
                              "Email",
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
                                    "Enter your password",
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Color(0xFF184CC8),
                                    value: isChecked,
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  const Text(
                                    "Remember for 30 days",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType
                                              .leftToRightWithFade,
                                          child:  RecoverPassword()));
                                },
                                child: const Text(
                                  "Forgot password",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF184CC8)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Buttoncreate(
                            title: "Sign in",
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
                                  'Sign in with Google',
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

                        ],
                      ),
                    ))
              ],
            ),
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