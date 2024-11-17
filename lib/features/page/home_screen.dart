import 'package:boookia/core/utils/color_App.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentpage = 0;
  List<Widget> page = [
    Center(child: Text("home")),
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
