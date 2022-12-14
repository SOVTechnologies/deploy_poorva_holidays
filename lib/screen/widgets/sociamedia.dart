import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:poorvaholiday/constant/color_constant.dart';

class SocialMedia extends StatelessWidget {
  IconData fontAwesomeIcons;
  Function() onPressed;
  SocialMedia(
      {Key? key, required this.fontAwesomeIcons, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(
        fontAwesomeIcons,
        color: ColorConstant.whiteColor,
        size: 14,
      ),
      onPressed: onPressed,
    );
  }
}
