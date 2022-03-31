import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/screen/footer/footer.dart';
import 'package:poorvaholiday/screen/header/appbar.dart';
import 'package:poorvaholiday/screen/widgets/container_radius_boxdecorations.dart';
import 'package:poorvaholiday/screen/widgets/container_button.dart';
import 'package:poorvaholiday/screen/widgets/imagedecoration.dart';
import 'package:poorvaholiday/screen/widgets/sociamedia.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';
import 'package:poorvaholiday/utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

import 'company_details.dart';
import 'contact_us_from.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: const PoorvaAppBar(),
        preferredSize: Size(MediaQuery.of(context).size.width, 150),
      ),
      body: ContainerImageDecorations(
          imageName: 'egypt.jpeg',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50, bottom: 50),
                child: TextView(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                    value: 'Contact Us',
                    customColor: ColorConstant.blueColor),
              ),
              Expanded(
                  child: ContainerBoxradiusDecorations(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
                child: SingleChildScrollView(
                  child: Reponsivenes.isSmallScreen(context)
                      ? Column(
                          children: [
                            Expanded(child: ContausCompanyetails()),
                            Expanded(flex: 2, child: ContactUsFrom()),

                          ],
                        )
                      : Row(
                          children: [
                            Expanded(child: ContausCompanyetails()),
                            Expanded(
                                flex:
                                    Reponsivenes.isLargeScreen(context) ? 1 : 2,
                                child: ContactUsFrom()),
                          ],
                        ),
                ),
              )),

            ],
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          opacity: 0,
          borderRadius: BorderRadius.zero),
    );
  }
}
