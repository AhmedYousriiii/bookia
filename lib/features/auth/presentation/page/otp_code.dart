import 'package:boookia/core/function/dilogs.dart';
import 'package:boookia/core/function/navigator_app.dart';
import 'package:boookia/core/function/text_style_app.dart';
import 'package:boookia/core/utils/color_app.dart';
import 'package:boookia/features/auth/presentation/page/create_new_pass.dart';

import 'package:boookia/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:boookia/features/auth/presentation/bloc/auth_event.dart';
import 'package:boookia/features/auth/presentation/bloc/auth_state.dart';

import 'package:boookia/features/auth/presentation/page/register.dart';
import 'package:boookia/features/widget/app_barcustom.dart';
import 'package:boookia/features/widget/button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

var formkey = GlobalKey<FormState>();

class _OtpScreenState extends State<OtpScreen> {
  String? enteredCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, RegisterScreen()),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is CodepasswordSuccessState) {
              pushReplacement(context, CreateNewPassword());
            } else if (state is AuthErrorState) {
              showMessageDialog(context, state.meassage, DialogType.error);
            }
          },
          builder: (context, state) {
            return Form(
              key: formkey,
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
                            border: Border.all(
                                color: ColorApp.primarycolor, width: 2),
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
                    state is CodepasswordloadingState
                        ? Center(child: CircularProgressIndicator())
                        : ButtonApp(
                            text: "Verify",
                            onpress: () {
                              if (formkey.currentState!.validate()) {
                                // تحويل النص إلى عدد صحيح والتحقق من عدم وجود قيمة null
                                final code = int.tryParse(enteredCode ?? '');
                                if (code != null) {
                                  context.read<AuthBloc>().add(
                                        CodeForgetPaawordEvent(
                                          code: code, // تمرير الكود المحول
                                        ),
                                      );
                                } else {
                                  // عرض رسالة خطأ إذا كان الكود المدخل غير صالح
                                  showMessageDialog(
                                    context,
                                    "Invalid code. Please enter a valid 4-digit code.",
                                    DialogType.error,
                                  );
                                }
                              }
                            },
                          ),
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
                          onTap: () {},
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
            );
          },
        ),
      ),
    );
  }
}
