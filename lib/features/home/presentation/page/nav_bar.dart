import 'package:boookia/core/utils/color_App.dart';
import 'package:boookia/features/cart/presentation/page/cart.dart';
import 'package:boookia/features/home/presentation/page/home_screen.dart';
import 'package:boookia/features/profile/presentation/page/profile_page.dart';
import 'package:boookia/features/wishlist/presentation/page/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key, this.currentindex});
  final int? currentindex;

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int currentpage = 0;
  List<Widget> page = [
    Homescreen(),
    WishlistScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  @override
  void initState() {
    super.initState();
    currentpage = widget.currentindex ?? 0;
  }

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
              activeIcon: SvgPicture.asset(
                "assets/icons/Home.svg",
                colorFilter:
                    ColorFilter.mode(ColorApp.primarycolor, BlendMode.srcIn),
              ),
              backgroundColor: ColorApp.backgroundcolor,
              icon: SvgPicture.asset("assets/icons/Home.svg"),
              label: "Home",
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                "assets/icons/Bookmark.svg",
                colorFilter:
                    ColorFilter.mode(ColorApp.primarycolor, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset("assets/icons/Bookmark.svg"),
              label: "Bookmark",
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                "assets/icons/Category.svg",
                colorFilter:
                    ColorFilter.mode(ColorApp.primarycolor, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset("assets/icons/Category.svg"),
              label: "Category",
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                "assets/icons/Profile.svg",
                colorFilter:
                    ColorFilter.mode(ColorApp.primarycolor, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset("assets/icons/Profile.svg"),
              label: "Profile",
            ),
          ]),
    );
  }
}
