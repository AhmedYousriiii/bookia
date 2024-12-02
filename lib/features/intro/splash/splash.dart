import 'dart:developer';

import 'package:boookia/core/function/navigator_app.dart';
import 'package:boookia/core/function/text_style_app.dart';
import 'package:boookia/core/services/shared_preferences.dart';

import 'package:boookia/features/intro/welcome/welcome.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    String? token = SharedPrefere.getData(SharedPrefere.token);
    Future.delayed(Duration(seconds: 5), () {
      log(token.toString());
      // if (token != null) {
      // pushReplacement(
      //     context,
      //     NavBarScreen(
      //       currentindex: 0,
      //     ));
      // }
      pushReplacement(context, WelcomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: SvgPicture.asset(
            "assets/images/logo.svg",
            width: 210,
            height: 66,
          )),
          Text(
            "Order Your Book Now!",
            style: get20text(fontsize: 18),
          ),
        ],
      ),
    );
  }
}
