import 'package:boookia/core/utils/color_App.dart';
import 'package:flutter/material.dart';

TextStyle get30text({double? fontsize, Color? color, FontWeight? fontweight}) {
  return TextStyle(
    color: color ?? ColorApp.darkcolor,
    fontSize: fontsize ?? 30,
    fontWeight: fontweight ?? FontWeight.w400,
  );
}

TextStyle get20text({double? fontsize, Color? color, FontWeight? fontweight}) {
  return TextStyle(
    color: color ?? ColorApp.darkcolor,
    fontSize: fontsize ?? 20,
    fontWeight: fontweight ?? FontWeight.w400,
  );
}

TextStyle get15text({double? fontsize, Color? color, FontWeight? fontweight}) {
  return TextStyle(
    color: color ?? ColorApp.darkgraycolor,
    fontSize: fontsize ?? 15,
    fontWeight: fontweight ?? FontWeight.w400,
  );
}

TextStyle get16text({double? fontsize, Color? color, FontWeight? fontweight}) {
  return TextStyle(
    color: color ?? ColorApp.graycolor,
    fontSize: fontsize ?? 16,
    fontWeight: fontweight ?? FontWeight.w400,
  );
}

TextStyle getprimarytext(
    {double? fontsize, Color? color, FontWeight? fontweight}) {
  return TextStyle(
    color: color ?? ColorApp.primarycolor,
    fontSize: fontsize ?? 15,
    fontWeight: fontweight ?? FontWeight.w400,
  );
}

TextStyle getbuttontext(
    {double? fontsize, Color? color, FontWeight? fontweight}) {
  return TextStyle(
    color: color ?? ColorApp.backgroundcolor,
    fontSize: fontsize ?? 15,
    fontWeight: fontweight ?? FontWeight.w400,
  );
}
