import 'package:boookia/core/function/text_style_app.dart';
import 'package:boookia/core/utils/color_app.dart';

import 'package:boookia/features/auth/register/register.dart';
import 'package:boookia/features/widget/app_barcustom.dart';
import 'package:boookia/features/widget/button_app.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, RegisterScreen()),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "OTP Verification",
                style: get30text(),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Enter the verification code we just sent on your email address.",
                style: get16text(),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Pinput(
                  length: 4,
                  defaultPinTheme: PinTheme(
                    width: 70,
                    height: 60,
                    margin: EdgeInsets.only(left: 5, right: 5),
                    textStyle: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: ColorApp.primarycolor, width: 2),
                    ),
                  ),
                  validator: (value) => value == '2222' ? null : 'Pin is incorrect',
                ),
              ),
              SizedBox(
                height: 38,
              ),
              ButtonApp(text: "Verify", onpress: () {}),
              SizedBox(
                height: 290,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Didn’t received code? ",
                      style: get20text(fontsize: 15),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // pushto(context, LoginScreen());
                    },
                    child: Text(
                      "Resend",
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
  }
}
