import 'package:flutter/material.dart';

pushReplacement(BuildContext context, Widget newpage) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => newpage,
    ),
  );
}

pushto(BuildContext context, Widget newpage) {
  return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => newpage,
      ));
}
