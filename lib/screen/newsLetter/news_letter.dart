import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/controller/contacus_controller.dart';
import 'package:poorvaholiday/controller/news_controller.dart';
import 'package:poorvaholiday/remote_services/api.dart';
import 'package:poorvaholiday/screen/widgets/container_radius_boxdecorations.dart';
import 'package:poorvaholiday/screen/widgets/container_button.dart';
import 'package:poorvaholiday/screen/widgets/custom_divider.dart';
import 'package:poorvaholiday/screen/widgets/imagedecoration.dart';
import 'package:poorvaholiday/screen/widgets/sociamedia.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';
import 'package:poorvaholiday/utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsLetter extends StatefulWidget {
  const NewsLetter({Key? key}) : super(key: key);

  @override
  _NewsLetterState createState() => _NewsLetterState();
}

class _NewsLetterState extends State<NewsLetter> {
  TextEditingController message = TextEditingController();
  var getXController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return ContainerImageDecorations(
        imageName: 'dashboard_image.jpeg',
        child: newsLeterChild(),
        width: MediaQuery.of(context).size.width,
        height: Reponsivenes.isLargeScreen(context) ? 350 :300,
        opacity: 0.2,
        borderRadius: BorderRadius.zero);
  }

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  Widget newsLeterChild() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextView(
                  customColor: ColorConstant.whiteColor,
                  value: "Subscribe",
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  CustomDivier(
                    edgeInsets: const EdgeInsets.only(right: 10),
                    customColor: ColorConstant.whiteColor,
                    width: 150,
                    height: 2,
                  ),
                  TextView(
                      customColor: ColorConstant.whiteColor,
                      value: "to our NEWS",
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SizedBox(
                width: 250,
                child: TextField(
                  controller: message,
                  style: GoogleFonts.poppins(
                      color: ColorConstant.whiteColor,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1,
                      wordSpacing: 1),
                  decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: Icon(
                        Icons.email,
                        color: ColorConstant.whiteColor,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: ColorConstant.whiteColor,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: ColorConstant.whiteColor,
                          width: 1.0,
                        ),
                      ),
                      hintText: "Enter Email",
                      hintStyle: GoogleFonts.poppins(
                          color: ColorConstant.whiteColor,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 1,
                          wordSpacing: 1)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ContainerButton(
                  onTap: () {
                    getXController.contactUs(Api.mainUrl + Api.newsletter, message.text)
                        .then((value) {
                      int code = value.statusCode;
                      if (code == 200 || code == 201) {
                        message.text = "";
                        Get.defaultDialog(title: "Success", middleText: "You have successfully subscribe!!!");
                      }
                    });
                  },
                  title: "Submit",
                  backGroundColor: ColorConstant.blueColor),
            )
          ],
        ),
        const Spacer(),
        ContainerBoxradiusDecorations(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(0.0),
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(0.0),
          ),
          child: Column(
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
          ),
        )
      ],
    );
  }
}
