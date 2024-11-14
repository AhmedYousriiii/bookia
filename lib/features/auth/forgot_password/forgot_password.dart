import 'package:boookia/core/function/navigator_app.dart';
import 'package:boookia/core/function/text_style_app.dart';
import 'package:boookia/features/auth/login/login.dart';
import 'package:boookia/features/auth/register/register.dart';
import 'package:boookia/features/widget/app_barcustom.dart';
import 'package:boookia/features/widget/button_app.dart';

import 'package:flutter/material.dart';

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
          child: SingleChildScrollView(
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
                ButtonApp(
                    text: "Send Code",
                    onpress: () {
                      if (formkey.currentState!.validate()) {}
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
          ),
        ),
      ),
    );
  }
}
