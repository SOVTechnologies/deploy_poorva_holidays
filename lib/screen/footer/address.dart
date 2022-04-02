import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/screen/footer/payment_details.dart';
import 'package:poorvaholiday/screen/widgets/poorva_logo.dart';
import 'package:poorvaholiday/screen/widgets/sociamedia.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';
import 'package:poorvaholiday/utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class Address extends StatelessWidget {
  const Address({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const PoorvaLogo(),
          TextView(
              customColor: ColorConstant.whiteColor,
              value:
                  "Shop No. 23, Yudhistir Building,\nOpp. N. L. Garden, N. L. Complex,\nDahisar (E), Mumbai 400068. Maharashtra",
              fontSize: 14,
              fontWeight: FontWeight.normal),

          //Custom Support
          SizedBox(height: 20),
          TextView(
              customColor: ColorConstant.whiteColor,
              value: "Custom Support :\n9930993825/7977628030/022-40031840",
              fontSize: 14,
              fontWeight: FontWeight.normal),
        ],
      ),
    );
  }
}
