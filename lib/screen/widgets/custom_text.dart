import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/helpers/Seo/renderers/text_renderer/text_renderer_style.dart';
import 'package:poorvaholiday/helpers/Seo/renderers/text_renderer/text_renderer_web.dart';

class TextView extends StatelessWidget {
  final String? value;
  final double? fontSize;
  final Color? customColor;
  final FontWeight? fontWeight;
  final TextAlign? align;
  final bool isSeoText;
  final TextStyle? style;
  final TextRendererStyle? textRenderStyle;
  const TextView({
    Key? key,
    required this.value,
    this.fontSize,
    this.customColor,
    this.fontWeight,
    this.align,
    this.isSeoText = false,
    this.style,
    this.textRenderStyle,
  }) : super(key: key);

  static TextStyle defaultStyle({
    double? size,
    Color? color,
    FontWeight? weight,
  }) =>
      GoogleFonts.poppins(
        textStyle: TextStyle(
            fontSize: size ?? 16,
            color: color ?? ColorConstant.blackColor,
            fontWeight: weight ?? FontWeight.normal),
      );
  static TextStyle headerStyle({
    double? size,
    Color? color,
    FontWeight? weight,
  }) =>
      GoogleFonts.playfairDisplay(
        textStyle: TextStyle(
            fontSize: size ?? 16,
            color: color ?? ColorConstant.blackColor,
            fontWeight: weight ?? FontWeight.normal),
      );
  @override
  Widget build(BuildContext context) {
    return isSeoText
        ? LayoutBuilder(
            builder: ((context, constraints) => TextRenderer(
                  text: value,
                  style: textRenderStyle,
                  child: SizedBox(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    child: Text(
                      value!,
                      textAlign: align ?? TextAlign.center,
                      style: style ??
                          defaultStyle(
                              color: customColor,
                              size: fontSize,
                              weight: fontWeight),
                    ),
                  ),
                )))
        : Text(
            value!,
            textAlign: align ?? TextAlign.center,
            style: style ??
                defaultStyle(
                    color: customColor, size: fontSize, weight: fontWeight),
          );
  }
}
