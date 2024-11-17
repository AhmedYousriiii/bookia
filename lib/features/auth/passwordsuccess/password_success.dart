import 'package:boookia/core/function/navigator_app.dart';
import 'package:boookia/core/function/text_style_app.dart';
import 'package:boookia/features/auth/presentation/page/login.dart';
import 'package:boookia/features/widget/button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordChanged extends StatelessWidget {
  const PasswordChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset("assets/images/Successmark.svg"),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Password Changed!",
            style: get30text(fontsize: 29),
          ),
          SizedBox(
            height: 3,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Text(
              "Your password has been changed   \n                    successfully.",
              style: get16text(),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          ButtonApp(
              text: "Back to Login",
              onpress: () {
                pushReplacement(context, LoginScreen());
              }),
        ],
      ),
    );
  }
}
