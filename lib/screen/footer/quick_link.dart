import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/screen/widgets/poorva_logo.dart';
import 'package:poorvaholiday/screen/widgets/sociamedia.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';
import 'package:poorvaholiday/utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../routes/routes.dart';

class QuickLink extends StatelessWidget {
  const QuickLink({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextView(
              customColor: ColorConstant.whiteColor,
              value: "Quick Link",
              fontSize: 18,
              fontWeight: FontWeight.bold),
          const SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: (){
              Get.toNamed(Routes.home);
            },
            child: TextView(
                customColor: ColorConstant.whiteColor,
                value: "Tour",
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: (){
              Get.toNamed(Routes.aboutus);
            },
            child: TextView(
                customColor: ColorConstant.whiteColor,
                value: "About Us",
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: (){
              Get.toNamed(Routes.contactus);
            },
            child: TextView(
                customColor: ColorConstant.whiteColor,
                value: "Contact Us",
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
