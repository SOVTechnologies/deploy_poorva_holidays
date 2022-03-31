import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/screen/widgets/poorva_logo.dart';
import 'package:poorvaholiday/screen/widgets/sociamedia.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';
import 'package:poorvaholiday/utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class FServices extends StatelessWidget {
  const FServices({
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
              value: "Services",
              fontSize: 18,
              fontWeight: FontWeight.bold),
          const SizedBox(
            height: 5,
          ),
          MouseRegion(
            child: TextView(
                customColor: ColorConstant.whiteColor,
                value: "Air-Ticket",
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 15,
          ),
          MouseRegion(
            child: TextView(
                customColor: ColorConstant.whiteColor,
                value: "Visa",
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 15,
          ),
          MouseRegion(
            child: TextView(
                customColor: ColorConstant.whiteColor,
                value: "Domestic Tour",
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 15,
          ),
          MouseRegion(
            child: TextView(
                customColor: ColorConstant.whiteColor,
                value: "International Tour",
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 15,
          ),
          TextView(
              customColor: ColorConstant.whiteColor,
              value: "Flight Booking",
              fontSize: 14,
              fontWeight: FontWeight.normal),
        ],
      ),
    );
  }
}