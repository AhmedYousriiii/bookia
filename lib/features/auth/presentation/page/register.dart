import 'package:boookia/core/function/dilogs.dart';
import 'package:boookia/core/function/navigator_app.dart';
import 'package:boookia/core/function/regex.dart';
import 'package:boookia/core/function/text_style_app.dart';
import 'package:boookia/features/auth/data/model/request/request..dart';
import 'package:boookia/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:boookia/features/auth/presentation/bloc/auth_event.dart';
import 'package:boookia/features/auth/presentation/bloc/auth_state.dart';
import 'package:boookia/features/home/presentation/page/nav_bar.dart';

import 'package:boookia/features/intro/welcome/welcome.dart';

import 'package:boookia/features/widget/button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

var namecontro = TextEditingController();
var emailcontro = TextEditingController();
var passwordcontroller = TextEditingController();
var confirmpasswordcontroller = TextEditingController();
var formkey = GlobalKey<FormState>();

class _LoginScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            pushto(context, WelcomeScreen());
          },
          child: Padding(
            padding: const EdgeInsets.only(
              left: 14,
            ),
            child: SvgPicture.asset(
              "assets/icons/back.svg",
              height: 41,
              width: 41,
            ),
          ),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.only(left: 22, right: 22),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 73),
                      child: Text(
                        "Hello! Register to get started",
                        style: get30text(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "username is required";
                        }
                        null;
                      },
                      controller: namecontro,
                      decoration: InputDecoration(
                        hintText: "Username",
                        hintStyle: get15text(),
                        fillColor: Color(0xffE8ECF4).withOpacity(.4),
                        filled: true,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "email is required";
                        } else if (!regexemail(value)) {
                          return "please enter valid email";
                        }
                      },
                      controller: emailcontro,
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: get15text(),
                        fillColor: Color(0xffE8ECF4).withOpacity(.4),
                        filled: true,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password is required";
                        } else if (value.length < 8) {
                          return "Password must be at least 8 characters";
                        }
                      },
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        suffixIconConstraints: BoxConstraints(
                          maxHeight: 35,
                          maxWidth: 35,
                        ),
                        suffixIcon: Transform.translate(
                          offset: Offset(-10, 0),
                          child: SvgPicture.asset(
                            'assets/icons/eye-.svg',
                          ),
                        ),
                        hintText: "Password",
                        hintStyle: get15text(),
                        fillColor: Color(0xffE8ECF4).withOpacity(.4),
                        filled: true,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Confirm password is required";
                        } else if (value.length < 8) {
                          return "Password must be at least 8 characters";
                        } else if (passwordcontroller.text != value) {
                          return 'Password and Confirm Password must be same';
                        }
                      },
                      controller: confirmpasswordcontroller,
                      decoration: InputDecoration(
                        suffixIconConstraints: BoxConstraints(
                          maxHeight: 35,
                          maxWidth: 35,
                        ),
                        suffixIcon: Transform.translate(
                          offset: Offset(-10, 0),
                          child: SvgPicture.asset(
                            'assets/icons/eye-.svg',
                          ),
                        ),
                        hintText: "Confirm password",
                        hintStyle: get15text(),
                        fillColor: Color(0xffE8ECF4).withOpacity(.4),
                        filled: true,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    state is RegisterLoadingState
                        ? Center(child: CircularProgressIndicator())
                        : ButtonApp(
                            text: "Register",
                            onpress: () {
                              if (formkey.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                      RegisterEvent(
                                        UserModel(
                                          email: emailcontro.text,
                                          name: namecontro.text,
                                          password: passwordcontroller.text,
                                          passwordConfirmation:
                                              confirmpasswordcontroller.text,
                                        ),
                                      ),
                                    );
                              }
                            }),
                    SizedBox(
                      height: 34,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Already have an account?",
                            style: get20text(fontsize: 15),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            pushto(context, RegisterScreen());
                          },
                          child: Text(
                            " Login Now",
                            style: getprimarytext(fontsize: 15),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            pushAndRemoveUntil(context, NavBarScreen());
          } else if (state is AuthErrorState) {
            showErrorDialog(context, state.meassage);
          }
        },
      ),
    );
  }
}
