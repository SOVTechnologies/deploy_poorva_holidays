import 'package:flutter/material.dart';

class CustomDivier extends StatelessWidget {
  double width;
  double height;
  Color customColor;
  EdgeInsets edgeInsets;
  CustomDivier(
      {Key? key,
      required this.width,
      required this.height,
      required this.customColor,
      required this.edgeInsets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: customColor,
      ),
      margin: edgeInsets,
      height: height,
      width: width,
    );
  }
}
