import 'package:boookia/core/utils/color_App.dart';
import 'package:boookia/features/home/presentation/page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int currentpage = 0;
  List<Widget> page = [
    Homescreen(),
    Center(child: Text("Bookmark")),
    Center(child: Text("Category")),
    Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[currentpage],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentpage,
          onTap: (index) {
            setState(() {
              currentpage = index;
            });
          },
          selectedItemColor: ColorApp.darkcolor,
          unselectedItemColor: ColorApp.primarycolor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              backgroundColor: ColorApp.backgroundcolor,
              icon: SvgPicture.asset("assets/icons/Home.svg"),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/Bookmark.svg"),
              label: "Bookmark",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/Category.svg"),
              label: "Category",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/Profile.svg"),
              label: "Profile",
            ),
          ]),
    );
  }
}
