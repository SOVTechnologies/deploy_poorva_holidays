import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextView extends StatelessWidget {
  String value;
  double fontSize;
  FontWeight fontWeight;
  Color customColor;

  TextView(
      {Key? key,
      required this.fontSize,
      required this.fontWeight,
      required this.value,
      required this.customColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
    
      style: GoogleFonts.poppins(
          fontSize: fontSize,
          color: customColor,
          fontWeight: fontWeight,
          letterSpacing: 1,
          wordSpacing: 1),
    );
  }
}
