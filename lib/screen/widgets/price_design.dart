import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:poorvaholiday/constant/color_constant.dart';

import 'custom_text.dart';


class PriceDesign extends StatelessWidget {
  double bottomLeft;
  double topLeft;
  double topRight;
  double bottomRight;
  final String price;
  PriceDesign({
    Key? key,
    required this.bottomLeft,
    required this.topLeft,
    required this.topRight,
    required this.bottomRight,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(bottomLeft),
              topLeft: Radius.circular(topLeft),
              topRight: Radius.circular(topRight),
              bottomRight: Radius.circular(bottomRight)),
          color: ColorConstant.blueColor),
      child: TextView(
          customColor: ColorConstant.whiteColor,
          value: price,
          fontSize: 10,
          fontWeight: FontWeight.normal),
    );
  }
}
