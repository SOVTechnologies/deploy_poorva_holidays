import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/screen/footer/payment_details.dart';
import 'package:poorvaholiday/screen/widgets/poorva_logo.dart';
import 'package:poorvaholiday/screen/widgets/sociamedia.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';
import 'package:poorvaholiday/utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../routes/routes.dart';
import '../widgets/gesturedectector_text.dart';
import 'address.dart';
import 'fservices.dart';
import 'quick_link.dart';

class Fotters extends StatelessWidget {
  const Fotters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Reponsivenes.isLargeScreen(context) ||
              Reponsivenes.isMediumScreen(context)
          ? const WebFotter()
          : Container(),
    );
  }
}

class WebFotter extends StatelessWidget {
  const WebFotter({
    Key? key,
  }) : super(key: key);

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstant.blueColor,
      height: 300,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Address(),
              Spacer(),
              Reponsivenes.isLargeScreen(context)
                  ? PaymentDetails()
                  : Container(),
              Spacer(),
              const FServices(),
              Spacer(),
              const QuickLink(),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialMedia(
                      fontAwesomeIcons: FontAwesomeIcons.instagram,
                      onPressed: () {
                        _launchURL(
                            'https://www.instagram.com/poorva_holidays/?igshid=15tgc6ewtk4y0');
                      }),
                  SocialMedia(
                      fontAwesomeIcons: FontAwesomeIcons.facebook,
                      onPressed: () {
                        _launchURL(
                            'https://www.facebook.com/Poorva-Holidays-354313298627961/?ref=your_pages');
                      }),
                  SocialMedia(
                      fontAwesomeIcons: FontAwesomeIcons.linkedinIn,
                      onPressed: () {
                        _launchURL(
                            'https://www.linkedin.com/company/poorva-holidays/?viewAsMember=true');
                      }),
                  SocialMedia(
                      fontAwesomeIcons: FontAwesomeIcons.whatsapp,
                      onPressed: () {
                        _launchURL(
                            'https://api.whatsapp.com/send?phone=+9199309%2093825&text=Trying%20to%20reach%20Poorva%20Holidays.%20Please%20connect.%20');
                      }),
                ],
              )
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  GestureDetectorText(
                    fontSize: 14,
                    value: "Privacy Policy",
                    onPressed: () {
                      Get.toNamed(Routes.privacyPolicy);
                    },
                  ),

                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetectorText(
                    fontSize: 14,
                    value: "Cancellation & Refund Policy",
                    onPressed: () {
                      Get.toNamed(Routes.cancellationPolicies);
                    },
                  ),

                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetectorText(
                    fontSize: 14,
                    value: "Terms and Conditions",
                    onPressed: () {
                      Get.toNamed(Routes.termsandConditions);
                    },
                  ),

                  const Spacer(),
                ],
              ),
              TextView(
                  customColor: ColorConstant.whiteColor,
                  value:
                      "© 2019 . All Rights Reserved by Poorva Holidays. Developed and Maintained by SOV Technologies",
                  fontSize: 8,
                  fontWeight: FontWeight.normal),
            ],
          ),
        ],
      ),
    );
  }
}



