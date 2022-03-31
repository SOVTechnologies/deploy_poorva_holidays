import 'package:flutter/material.dart';
import 'package:poorvaholiday/constant/color_constant.dart';

import 'custom_text.dart';

class TextWithIcon extends StatelessWidget {
  IconData icon;
  String title;
  TextWithIcon({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
        ),
        const SizedBox(
          width: 5,
        ),
        TextView(
            customColor: ColorConstant.blueColor,
            value: title,
            fontSize: 13,
            fontWeight: FontWeight.normal),
      ],
    );
  }
}
