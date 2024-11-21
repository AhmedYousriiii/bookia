import 'package:boookia/features/home/presentation/widget/Banner_widget.dart';
import 'package:boookia/features/home/presentation/widget/papularbooklist.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/Frame 24.png"),
        actions: [
          GestureDetector(
              onTap: () {},
              child: SvgPicture.asset("assets/icons/notification.svg")),
          SizedBox(
            width: 16,
          ),
          GestureDetector(
              onTap: () {},
              child: SvgPicture.asset("assets/icons/search-normal.svg")),
          SizedBox(
            width: 12,
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          BannerWidget(),
          Papularbooklist(),
        ],
      )),
    );
  }
}
