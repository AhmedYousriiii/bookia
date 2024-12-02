import 'package:boookia/core/function/text_style_app.dart';
import 'package:boookia/core/utils/color_App.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.onpress,
    required this.text,
  });
  final Function() onpress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 15),
        width: 385,
        height: 54,
        decoration: BoxDecoration(
          color: ColorApp.backgroundcolor,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: ColorApp.darkcolor.withOpacity(0.2),
              offset: Offset(1, 1),
              blurRadius: 2,
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          children: [
            Text(
              text,
              style: get20text(fontsize: 18),
            ),
            Spacer(),
            Image.asset("assets/images/Group 6.png"),
          ],
        ),
      ),
    );
  }
}
