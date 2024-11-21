import 'package:boookia/core/utils/color_app.dart';
import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  const ButtonApp(
      {super.key,
      required this.text,
      this.color,
      this.colortext,
      this.colorborder,
      required this.onpress,
      this.width,
      this.height,
      this.borderrides});
  final String text;
  final Color? color;
  final Color? colortext;
  final Color? colorborder;
  final Function()? onpress;
  final double? width;
  final double? height;
  final double? borderrides;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? 56,
        width: width ?? 354,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? ColorApp.primarycolor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  borderrides ?? 8,
                ),
                side: BorderSide(color: colorborder ?? ColorApp.primarycolor)),
          ),
          onPressed: onpress,
          child: Text(
            text,
            style: TextStyle(color: colortext ?? ColorApp.backgroundcolor),
          ),
        ));
  }
}
