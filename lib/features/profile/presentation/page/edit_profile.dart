import 'package:boookia/core/function/dilogs.dart';
import 'package:boookia/core/function/navigator_app.dart';
import 'package:boookia/core/function/text_style_app.dart';
import 'package:boookia/features/auth/presentation/page/register.dart';
import 'package:boookia/features/home/presentation/page/nav_bar.dart';
import 'package:boookia/features/profile/data/model/request/update_profile_prams.dart';
import 'package:boookia/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:boookia/features/widget/button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.Modelprams});
  final UpdateProfilePrams Modelprams;

  @override
  State<EditProfileScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<EditProfileScreen> {
  var fullnamecontroller = TextEditingController();
  var Phonecontroller = TextEditingController();
  var addresscontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  void initState() {
    fullnamecontroller = TextEditingController(text: widget.Modelprams.name);
    Phonecontroller = TextEditingController(text: widget.Modelprams.phone);
    addresscontroller = TextEditingController(text: widget.Modelprams.address);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileLoadingState) {
          showLoadingDialog(context);
        } else if (state is UpdateProfileLoadedState) {
          pushAndRemoveUntil(
              context,
              NavBarScreen(
                currentindex: 3,
              ));
        } else if (state is ProfileErrorState) {
          showMessageDialog(context, state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Edit Profile",
              style: get20text(),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(15, 100, 15, 10),
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " Name is required";
                        }
                      },
                      controller: fullnamecontroller,
                      decoration: InputDecoration(
                        suffixIconConstraints: BoxConstraints(
                          maxHeight: 35,
                          maxWidth: 35,
                        ),
                        hintText: "Full Name",
                        hintStyle: get15text(fontsize: 12),
                        fillColor: Color(0xffE8ECF4).withOpacity(.3),
                        filled: true,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Phone is required";
                        }
                      },
                      controller: Phonecontroller,
                      decoration: InputDecoration(
                        suffixIconConstraints: BoxConstraints(
                          maxHeight: 35,
                          maxWidth: 35,
                        ),
                        hintText: "Phone",
                        hintStyle: get15text(fontsize: 12),
                        fillColor: Color(0xffE8ECF4).withOpacity(.3),
                        filled: true,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.streetAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Address is required";
                        }
                      },
                      controller: addresscontroller,
                      decoration: InputDecoration(
                        suffixIconConstraints: BoxConstraints(
                          maxHeight: 35,
                          maxWidth: 35,
                        ),
                        hintText: "Address",
                        hintStyle: get15text(fontsize: 12),
                        fillColor: Color(0xffE8ECF4).withOpacity(.3),
                        filled: true,
                      ),
                    ),
                    SizedBox(
                      height: 220,
                    ),
                    ButtonApp(
                      onpress: () {
                        if (formkey.currentState!.validate()) {
                          context.read<ProfileBloc>().add(
                                updateprofileEvent(
                                  prams: UpdateProfilePrams(
                                    address: addresscontroller.text,
                                    name: fullnamecontroller.text,
                                    phone: passwordcontroller.text,
                                  ),
                                ),
                              );
                        }
                      },
                      text: "Update Profile",
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
