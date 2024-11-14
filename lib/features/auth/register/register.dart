import 'package:boookia/core/function/navigator_app.dart';
import 'package:boookia/core/function/text_style_app.dart';
import 'package:boookia/features/intro/welcome/welcome.dart';
import 'package:boookia/features/widget/button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

var usernamecontro = TextEditingController();
var emailcontro = TextEditingController();
var passwordcontro = TextEditingController();
var confirmpasswordcontro = TextEditingController();
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
      body: SingleChildScrollView(
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "username is required";
                    }
                    null;
                  },
                  controller: usernamecontro,
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "email is required";
                    }
                    null;
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "password is required";
                    }
                    null;
                  },
                  controller: passwordcontro,
                  decoration: InputDecoration(
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Confirm password is required";
                    }
                    null;
                  },
                  controller: confirmpasswordcontro,
                  decoration: InputDecoration(
                    hintText: "Confirm password",
                    hintStyle: get15text(),
                    fillColor: Color(0xffE8ECF4).withOpacity(.4),
                    filled: true,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ButtonApp(
                    text: "Register",
                    onpress: () {
                      if (formkey.currentState!.validate()) {}
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
      ),
    );
  }
}
