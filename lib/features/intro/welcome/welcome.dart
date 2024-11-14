import 'package:boookia/core/function/navigator_app.dart';
import 'package:boookia/core/function/text_style_app.dart';
import 'package:boookia/core/utils/color_app.dart';
import 'package:boookia/features/auth/login/login.dart';
import 'package:boookia/features/auth/register/register.dart';

import 'package:boookia/features/widget/button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/welcome.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(
                  flex: 1,
                ),
                SvgPicture.asset(
                  "assets/images/logo.svg",
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Order Your Book Now!",
                  style: get20text(fontsize: 18),
                ),
                // SizedBox(
                //   height: 300,
                // ),
                Spacer(
                  flex: 4,
                ),
                ButtonApp(
                  onpress: () {
                    pushto(context, LoginScreen());
                  },
                  text: "Login",
                ),
                SizedBox(
                  height: 15,
                ),
                ButtonApp(
                  onpress: () {
                    pushto(context, RegisterScreen());
                  },
                  text: "Register",
                  color: ColorApp.backgroundcolor,
                  colortext: ColorApp.darkcolor,
                  colorborder: ColorApp.darkcolor,
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
