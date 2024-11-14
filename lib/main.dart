import 'package:boookia/core/constants/font_app.dart';
import 'package:boookia/core/utils/color_app.dart';
import 'package:boookia/features/auth/createnewpassword/create_new_pass.dart';

import 'package:boookia/features/auth/opt/otp_code.dart';
import 'package:boookia/features/auth/passwordsuccess/password_success.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorApp.backgroundcolor,
        appBarTheme: AppBarTheme(
          color: ColorApp.backgroundcolor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorApp.bordercolor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorApp.bordercolor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
        ),
        fontFamily: FontApp.dmserifdisplay,
      ),
      home: PasswordChanged(),
    );
  }
}
