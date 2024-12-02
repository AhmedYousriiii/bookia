import 'package:boookia/core/function/dilogs.dart';
import 'package:boookia/core/function/navigator_app.dart';
import 'package:boookia/core/function/text_style_app.dart';
import 'package:boookia/features/auth/presentation/page/login.dart';
import 'package:boookia/features/profile/data/model/request/update_profile_prams.dart';
import 'package:boookia/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:boookia/features/profile/presentation/page/edit_profile.dart';
import 'package:boookia/features/profile/presentation/page/update_password.dart';
import 'package:boookia/features/profile/presentation/widget/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(GetProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is LogutLoadingState) {
          showLoadingDialog(context);
        } else if (state is logoutLoadedState) {
          pushReplacement(context, LoginScreen());
        } else if (state is ProfileErrorState) {
          showMessageDialog(context, state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Profile",
            style: get20text(fontsize: 24),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                context.read<ProfileBloc>().add(LogoutEvent());
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SvgPicture.asset(
                  "assets/icons/Logout.svg",
                  height: 17,
                  width: 17,
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          buildWhen: (previous, current) => current is GetProfileLoadingState || current is GetProfileLoadedState,
          builder: (context, state) {
            var profile = context.read<ProfileBloc>().profileResponse?.data;
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: profile != null && profile.image != null
                            ? Image.network(
                                profile?.image ?? "",
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              )
                            : Icon(
                                Icons.person,
                                size: 80,
                              ),
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profile?.name ?? "",
                              style: get20text(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              profile?.address ?? "Mansoura",
                              style: get16text(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              profile?.email ?? "",
                              style: get16text(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  CustomContainer(
                    onpress: () {},
                    text: "My Orders",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomContainer(
                    onpress: () {
                      pushto(
                          context,
                          EditProfileScreen(
                            Modelprams: UpdateProfilePrams(
                              address: profile?.address,
                              name: profile?.name,
                              phone: profile?.phone,
                            ),
                          ));
                    },
                    text: "Edit Profile",
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomContainer(
                    onpress: () {
                      pushto(context, UpdatePasswordScreen());
                    },
                    text: "Reset Password",
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomContainer(
                    onpress: () {},
                    text: "FAQ",
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomContainer(
                    onpress: () {},
                    text: "Contact Us",
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomContainer(
                    onpress: () {},
                    text: "Privacy & Terms",
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
