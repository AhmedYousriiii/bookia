  import 'package:boookia/core/function/navigator_app.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar getAppBar(BuildContext context , Widget newpage) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          pushto(context, newpage);
        },
        child: Padding(
          padding: const EdgeInsets.only(
            left: 14,
          ),
          child: SvgPicture.asset(
            "assets/icons/back.svg",
            height: 41,
            width: 41,
          ),
        ),
      ),
    );
  }