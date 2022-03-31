import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/constant/constant_size.dart';

import 'custom_text.dart';

class ContainerButton extends StatelessWidget {
  Function() onTap;
  String title;
  Color backGroundColor;

  ContainerButton(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.backGroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor:SystemMouseCursors.click,
      child: Container(
        width: ConstantSize().getContainerButtonWidth(context),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: backGroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(5.0) //
                ),
            border: Border.all(color: backGroundColor)),
        child: GestureDetector(
          onTap: onTap,
          child: Align(
            alignment: Alignment.center,
            child: TextView(
                customColor: ColorConstant.whiteColor,
                value: title,
                fontSize: 12,
                fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
