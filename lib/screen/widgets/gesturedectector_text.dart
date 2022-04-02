import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/helpers/Seo/renderers/link_renderer/link_renderer_web.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

// ignore: must_be_immutable
class GestureDetectorText extends StatefulWidget {
  String value;
  Function() onPressed;
  double fontSize;
  Color? textColor;
  String? herf;
  GestureDetectorText({
    Key? key,
    required this.value,
    required this.onPressed,
    required this.fontSize,
    this.textColor,
    this.herf,
  }) : super(key: key);

  @override
  State<GestureDetectorText> createState() => _GestureDetectorTextState();
}

class _GestureDetectorTextState extends State<GestureDetectorText> {
  Color defaultColor = ColorConstant.whiteColor;
  bool isHover = false;

  @override
  void initState() {
    super.initState();
    defaultColor = widget.textColor ?? ColorConstant.whiteColor;
  }

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
              isHover = true;
            });
          },
          onExit: (event) {
            setState(() {
              defaultColor = widget.textColor ?? ColorConstant.whiteColor;
              isHover = false;
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextView(
                style: TextView.headerStyle(
                  size: 20,
                  weight: FontWeight.bold,
                  color: defaultColor,
                ),
                value: widget.value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
