import 'package:boookia/core/function/text_style_app.dart';
import 'package:boookia/core/utils/color_app.dart';
import 'package:flutter/material.dart';

enum DialogType { suceess, error }

showMessageDialog(BuildContext context, String message, DialogType type) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: type == DialogType.suceess ? ColorApp.primarycolor : Colors.red,
      content: Text(
        message,
        style: get16text(color: ColorApp.backgroundcolor),
      )));
}

showLoadingDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset("assets/icons/Bookmark.svg")],
        );
      });
}
