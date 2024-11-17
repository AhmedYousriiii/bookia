import 'package:boookia/core/function/navigator_app.dart';
import 'package:boookia/core/function/text_style_app.dart';

import 'package:boookia/features/auth/presentation/page/login.dart';
import 'package:boookia/features/auth/presentation/page/register.dart';
import 'package:boookia/features/widget/app_barcustom.dart';
import 'package:boookia/features/widget/button_app.dart';
import 'package:flutter/material.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, RegisterScreen()),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Form(
          // key: formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create new password",
                  style: get30text(),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Your new password must be unique from those previously used.",
                  style: get16text(),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "New Password is required";
                    }
                  },
                  // controller: passwordcontroller,
                  decoration: InputDecoration(
                    hintText: "New Password",
                    hintStyle: get15text(),
                    fillColor: Color(0xffE8ECF4).withOpacity(.4),
                    filled: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Confirm Password is required";
                    }
                  },
                  // controller: passwordcontroller,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    hintStyle: get15text(),
                    fillColor: Color(0xffE8ECF4).withOpacity(.4),
                    filled: true,
                  ),
                ),
                SizedBox(
                  height: 38,
                ),
                ButtonApp(
                    text: "Reset Password",
                    onpress: () {
                      // if (formkey.currentState!.validate()) {}
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
