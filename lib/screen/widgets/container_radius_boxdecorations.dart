import 'package:flutter/material.dart';
import 'package:poorvaholiday/constant/color_constant.dart';

class ContainerBoxradiusDecorations extends StatelessWidget {
  Widget child;
  BorderRadius borderRadius;

  ContainerBoxradiusDecorations(
      {Key? key, required this.child, required this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.blueColor,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}
