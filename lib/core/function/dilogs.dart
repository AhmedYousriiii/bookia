import 'package:boookia/core/function/text_style_app.dart';
import 'package:boookia/core/utils/color_app.dart';
import 'package:flutter/material.dart';

showErrorDialog(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        message,
        style: get16text(color: ColorApp.backgroundcolor),
      )));
}

// showLoadingDialog(BuildContext context) {
//   showDialog(
//       context: context,
//       // barrierDismissible: false,
//       builder: (context) {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Lottie.asset('assets/images/loading.json'),
//           ],
//         );
//       });
// }
