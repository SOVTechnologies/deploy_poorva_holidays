import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

// ignore: must_be_immutable
class GestureDetectorTextBlack extends StatelessWidget {
  String value;
  Function() onPressed;

  GestureDetectorTextBlack({Key? key, required this.value, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextView(customColor: ColorConstant.blackColor,fontSize: 14,fontWeight: FontWeight.w600,value:value ,),
      ),
    );
  }
}
