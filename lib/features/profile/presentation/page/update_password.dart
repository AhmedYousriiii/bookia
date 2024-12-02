import 'package:boookia/core/function/text_style_app.dart';
import 'package:boookia/features/widget/button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  var CurrentPasswordcontroller = TextEditingController();
  var newpasswordcontroller = TextEditingController();
  var confirmpasswordcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Password",
          style: get20text(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 100, 15, 10),
        child: Form(
          key: formkey,
          child: Column(
            children: [
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
                controller: CurrentPasswordcontroller,
                decoration: InputDecoration(
                  suffixIconConstraints: BoxConstraints(
                    maxHeight: 35,
                    maxWidth: 35,
                  ),
                  hintText: "Current Password",
                  hintStyle: get15text(fontsize: 12),
                  fillColor: Color(0xffE8ECF4).withOpacity(.3),
                  filled: true,
                ),
              ),
              SizedBox(
                height: 20,
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
                controller: confirmpasswordcontroller,
                decoration: InputDecoration(
                  suffixIconConstraints: BoxConstraints(
                    maxHeight: 35,
                    maxWidth: 35,
                  ),
                  hintText: "New Password",
                  hintStyle: get15text(fontsize: 12),
                  fillColor: Color(0xffE8ECF4).withOpacity(.3),
                  filled: true,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Confirm password is required";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 characters";
                  } else if (newpasswordcontroller.text != value) {
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
                  hintStyle: get15text(fontsize: 12),
                  fillColor: Color(0xffE8ECF4).withOpacity(.3),
                  filled: true,
                ),
              ),
              Spacer(),
              ButtonApp(
                onpress: () {
                  if (formkey.currentState!.validate()) {}
                },
                text: "Update Password",
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
