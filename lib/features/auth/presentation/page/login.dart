import 'package:boookia/core/function/dilogs.dart';
import 'package:boookia/core/function/navigator_app.dart';
import 'package:boookia/core/function/regex.dart';
import 'package:boookia/core/function/text_style_app.dart';
import 'package:boookia/core/utils/color_app.dart';
import 'package:boookia/features/auth/data/model/request/request..dart';
import 'package:boookia/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:boookia/features/auth/presentation/bloc/auth_event.dart';
import 'package:boookia/features/auth/presentation/bloc/auth_state.dart';
import 'package:boookia/features/auth/presentation/page/register.dart';
import 'package:boookia/features/home/presentation/page/nav_bar.dart';
import 'package:boookia/features/intro/welcome/welcome.dart';

import 'package:boookia/features/widget/app_barcustom.dart';
import 'package:boookia/features/widget/button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

var emailcontroller = TextEditingController();
var passwordcontroller = TextEditingController();
var formkey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, WelcomeScreen()),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            pushAndRemoveUntil(context, NavBarScreen());
          } else if (state is AuthErrorState) {
            showErrorDialog(context, state.meassage);
          }
        },
        builder: (context, state) {
          return Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 73),
                    child: Text(
                      "Welcome back! Glad to see you, Again!",
                      style: get30text(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "email is required";
                        } else if (!regexemail(value)) {
                          return "please enter valid email";
                        }
                      },
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        hintStyle: get15text(),
                        fillColor: Color(0xffE8ECF4).withOpacity(.4),
                        filled: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password is required";
                        } else if (value.length < 8) {
                          return "Password must be at least 8 characters";
                        }
                      },
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        hintStyle: get15text(),
                        fillColor: Color(0xffE8ECF4).withOpacity(.4),
                        filled: true,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password?",
                              style: get15text(),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  state is LoginLoadingState
                      ? CircularProgressIndicator()
                      : ButtonApp(
                          text: "Login",
                          onpress: () {
                            if (formkey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                    LoginEvent(
                                      UserModel(
                                          email: emailcontroller.text,
                                          password: passwordcontroller.text),
                                    ),
                                  );
                            }
                          }),
                  SizedBox(
                    height: 34,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                        endIndent: 9,
                        indent: 22,
                        color: ColorApp.graycolor,
                      )),
                      Expanded(
                        child: Text(
                          "    Or Login with",
                          style: get15text(),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          endIndent: 22,
                          color: ColorApp.graycolor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 22, right: 20, top: 22),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: 56,
                            width: 105,
                            decoration: BoxDecoration(
                              color: ColorApp.backgroundcolor,
                              border: Border.all(color: ColorApp.bordercolor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: SvgPicture.asset(
                              "assets/images/facebook_ic.svg",
                              height: 26,
                              width: 26,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: 56,
                            width: 105,
                            decoration: BoxDecoration(
                              color: ColorApp.backgroundcolor,
                              border: Border.all(color: ColorApp.bordercolor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: SvgPicture.asset(
                              "assets/images/google_ic.svg",
                              height: 26,
                              width: 26,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: 56,
                            width: 105,
                            decoration: BoxDecoration(
                              color: ColorApp.backgroundcolor,
                              border: Border.all(color: ColorApp.bordercolor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: SvgPicture.asset(
                              "assets/images/cib_apple.svg",
                              height: 26,
                              width: 26,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Don’t have an account?",
                          style: get20text(fontsize: 15),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          pushto(context, RegisterScreen());
                        },
                        child: Text(
                          "Register Now",
                          style: getprimarytext(fontsize: 15),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
