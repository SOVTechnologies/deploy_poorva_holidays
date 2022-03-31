import 'package:flutter/material.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/models/about_us.dart';
import 'package:poorvaholiday/screen/header/appbar.dart';
import 'package:poorvaholiday/screen/widgets/container_radius_boxdecorations.dart';
import 'package:poorvaholiday/screen/widgets/imagedecoration.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

class AboutOwner extends StatelessWidget {
  AboutUsResponse aboutU;
  AboutOwner({Key? key, required this.aboutU}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextView(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                value: aboutU.name,
                customColor: ColorConstant.whiteColor),
            TextView(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                value: aboutU.description,
                customColor: ColorConstant.whiteColor)
          ],
        ),
      ),
    );
  }
}
