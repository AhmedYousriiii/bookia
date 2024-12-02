import 'package:boookia/core/function/dilogs.dart';
import 'package:boookia/core/function/navigator_app.dart';
import 'package:boookia/core/function/regex.dart';
import 'package:boookia/core/function/text_style_app.dart';
import 'package:boookia/features/auth/data/model/request/request..dart';
import 'package:boookia/features/auth/presentation/page/otp_code.dart';
import 'package:boookia/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:boookia/features/auth/presentation/bloc/auth_event.dart';
import 'package:boookia/features/auth/presentation/bloc/auth_state.dart';
import 'package:boookia/features/auth/presentation/page/login.dart';
import 'package:boookia/features/auth/presentation/page/register.dart';
import 'package:boookia/features/widget/app_barcustom.dart';
import 'package:boookia/features/widget/button_app.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

var passwordcontroller = TextEditingController();
var formkey = GlobalKey<FormState>();

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, RegisterScreen()),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Form(
          key: formkey,
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is ForgetPaawordSuccessState) {
                pushReplacement(context, OtpScreen());
              } else if (state is AuthErrorState) {
                showMessageDialog(context, state.meassage);
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: get30text(),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Don't worry! It occurs. Please enter the email address linked with your account.",
                      style: get16text(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "email is required";
                        } else if (!regexemail(value)) {
                          return "please enter valid email";
                        }
                      },
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        hintStyle: get15text(),
                        fillColor: Color(0xffE8ECF4).withOpacity(.4),
                        filled: true,
                      ),
                    ),
                    SizedBox(
                      height: 38,
                    ),
                    state is ForgetPaawordloadingState
                        ? Center(child: CircularProgressIndicator())
                        : ButtonApp(
                            text: "Send Code",
                            onpress: () {
                              if (formkey.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                      ForgetPaawordEvent(
                                        UserModel(
                                            email: passwordcontroller.text),
                                      ),
                                    );
                              }
                            }),
                    SizedBox(
                      height: 320,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Remember Password?",
                            style: get20text(fontsize: 15),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            pushto(context, LoginScreen());
                          },
                          child: Text(
                            "Login",
                            style: getprimarytext(fontsize: 15),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
