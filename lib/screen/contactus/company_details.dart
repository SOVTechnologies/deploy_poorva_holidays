import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/screen/footer/address.dart';
import 'package:poorvaholiday/screen/footer/footer.dart';
import 'package:poorvaholiday/screen/footer/payment_details.dart';
import 'package:poorvaholiday/screen/header/appbar.dart';
import 'package:poorvaholiday/screen/widgets/container_radius_boxdecorations.dart';
import 'package:poorvaholiday/screen/widgets/container_button.dart';
import 'package:poorvaholiday/screen/widgets/imagedecoration.dart';
import 'package:poorvaholiday/screen/widgets/sociamedia.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ContausCompanyetails extends StatelessWidget {
  const ContausCompanyetails({Key? key}) : super(key: key);
  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Address(),
        const PaymentDetails(),
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextView(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              value: 'Call Now : +91 99309 93825',
              customColor: ColorConstant.whiteColor),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextView(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              value: 'Email ID :poorva.holidays@yahoo.com',
              customColor: ColorConstant.whiteColor),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
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
          ),
        )
      ],
    );
  }
}
