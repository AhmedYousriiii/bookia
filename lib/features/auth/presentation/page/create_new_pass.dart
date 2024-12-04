import 'package:boookia/core/function/dilogs.dart';
import 'package:boookia/core/function/navigator_app.dart';
import 'package:boookia/core/function/text_style_app.dart';
import 'package:boookia/core/utils/color_app.dart';
import 'package:boookia/features/auth/data/model/request/newpasswordprams.dart';
import 'package:boookia/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:boookia/features/auth/presentation/bloc/auth_event.dart';
import 'package:boookia/features/auth/presentation/bloc/auth_state.dart';

import 'package:boookia/features/auth/presentation/page/login.dart';
import 'package:boookia/features/auth/presentation/page/password_success.dart';
import 'package:boookia/features/auth/presentation/page/register.dart';
import 'package:boookia/features/widget/app_barcustom.dart';
import 'package:boookia/features/widget/button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  var NewPasswordcontroller = TextEditingController();
  var ConFirmPasswordcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool _obscureText = true;
  String? enteredCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, RegisterScreen()),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is CreatepasswordloadingState) {
                  showLoadingDialog(context);
                } else if (state is AuthErrorState) {
                  showMessageDialog(context, state.meassage, DialogType.error);
                } else if (state is CreatepasswordSuccessState) {
                  pushReplacement(context, PasswordChanged());
                }
              },
              builder: (context, state) {
                return Column(
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
                    Center(
                      child: Pinput(
                        length: 6,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "code is required";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          enteredCode = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 38,
                    ),
                    TextFormField(
                      obscureText: _obscureText,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password is required";
                        } else if (value.length < 8) {
                          return "Password must be at least 8 characters";
                        }
                      },
                      controller: NewPasswordcontroller,
                      decoration: InputDecoration(
                        suffixIconConstraints: BoxConstraints(
                          maxHeight: 35,
                          maxWidth: 35,
                        ),
                        suffixIcon: Transform.translate(
                          offset: Offset(-10, 0),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: SvgPicture.asset(
                                'assets/icons/eye-.svg',
                              )),
                        ),
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
                      obscureText: _obscureText,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password is required";
                        } else if (NewPasswordcontroller.text != value) {
                          return 'Password and Confirm Password must be same';
                        }
                      },
                      controller: ConFirmPasswordcontroller,
                      decoration: InputDecoration(
                        suffixIconConstraints: BoxConstraints(
                          maxHeight: 35,
                          maxWidth: 35,
                        ),
                        suffixIcon: Transform.translate(
                          offset: Offset(-10, 0),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: SvgPicture.asset(
                                'assets/icons/eye-.svg',
                              )),
                        ),
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
                          if (formkey.currentState!.validate()) {
                            final code = int.tryParse(enteredCode ?? '');
                            if (code != null ) {
                              context.read<AuthBloc>().add(
                                    CreateNewPaawordEvent(
                                        prams: Newpasswordprams(
                                      verifyCode: code,
                                      newPassword: int.tryParse(NewPasswordcontroller.text),
                                      newPasswordConfirmation: int.tryParse(ConFirmPasswordcontroller.text),
                                    )),
                                  );
                            } else {
                              showMessageDialog(
                                context,
                                "Invalid code. Please enter a valid 4-digit code.",
                                DialogType.error,
                              );
                            }
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
