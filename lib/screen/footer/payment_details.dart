import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/screen/widgets/poorva_logo.dart';
import 'package:poorvaholiday/screen/widgets/sociamedia.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';
import 'package:poorvaholiday/utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({
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
              value: "Payment Details",
              fontSize: 18,
              fontWeight: FontWeight.bold),
          const SizedBox(
            height: 5,
          ),
          TextView(
              customColor: ColorConstant.whiteColor,
              value:
              "Name: Poorva Holidays\nBank Name: Axis Bank\nA/c No: 919020011046384\nIfsc Code: UTIB0001346\nBranch: Dahisar East\nGoogle Pay No: 99309 93825",
              fontSize: 14,
              fontWeight: FontWeight.normal)
        ],
      ),
    );
  }
}
