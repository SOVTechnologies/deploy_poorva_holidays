import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

// ignore: must_be_immutable
class GestureDetectorText extends StatefulWidget {
  String value;
  Function() onPressed;
  double fontSize;
  GestureDetectorText(
      {Key? key, required this.value, required this.onPressed,required this.fontSize})
      : super(key: key);

  @override
  State<GestureDetectorText> createState() => _GestureDetectorTextState();
}

class _GestureDetectorTextState extends State<GestureDetectorText> {
  Color defaultColor = ColorConstant.whiteColor;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (event) {
              setState(() {
                defaultColor = ColorConstant.orangeColor;

              });
            },
            onExit: (event) {
              setState(() {
                defaultColor = ColorConstant.whiteColor;

              });
            },
            child: TextView(
              customColor: defaultColor,
              fontSize: widget.fontSize,
              fontWeight: FontWeight.normal,
              value: widget.value,
            )),
      ),
    );
  }
}
