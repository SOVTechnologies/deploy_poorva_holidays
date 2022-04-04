import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/helpers/Seo/renderers/text_renderer/text_renderer_style.dart';
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
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 70),
          child: PoorvaAppBar(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            textColor: ColorConstant.whiteColor,
            shortBackground: ColorConstant.blueColor,
          ),
        ),
        // ignore: sized_box_for_whitespace
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Row(children: [
                  Expanded(
                    child: Container(
                      color: ColorConstant.blueColor,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 40, left: 10),
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: TextView(
                            style: TextView.headerStyle(
                              size: 40,
                              weight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textRenderStyle: TextRendererStyle.header1,
                            isSeoText: true,
                            value: 'Contact Us',
                            align: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: ColorConstant.whiteColor,
                    ),
                  ),
                ]),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: const EdgeInsets.only(top: 100, bottom: 40),
                      decoration: BoxDecoration(
                          color: ColorConstant.whiteColor,
                          boxShadow: [
                            BoxShadow(
                                color:
                                    ColorConstant.blackColor.withOpacity(0.25),
                                blurRadius: 10,
                                offset: const Offset(0, 5))
                          ]),
                      child: Row(
                        children: [
                          Expanded(
                              child: SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: Image.asset(
                              'egypt.jpeg',
                              fit: BoxFit.cover,
                            ),
                          )),
                          Expanded(
                              child: Container(
                            color: ColorConstant.whiteColor,
                            child: ContactUsFrom(),
                          )),
                        ],
                      )),
                ),
              ],
            )));
  }
}




// ContainerImageDecorations(
//           imageName: 'egypt.jpeg',
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(top: 50, bottom: 50),
//                 child: TextView(
//                     fontSize: 50,
//                     fontWeight: FontWeight.w500,
//                     value: 'Contact Us',
//                     customColor: ColorConstant.blueColor),
//               ),
//               Expanded(
//                   child: ContainerBoxradiusDecorations(
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(40.0),
//                   topRight: Radius.circular(40.0),
//                 ),
//                 child: SingleChildScrollView(
//                   child: Reponsivenes.isSmallScreen(context)
//                       ? Column(
//                           children: [
//                             Expanded(child: ContausCompanyetails()),
//                             Expanded(flex: 2, child: ),

//                           ],
//                         )
//                       : Row(
//                           children: [
//                             Expanded(child: ContausCompanyetails()),
//                             Expanded(
//                                 flex:
//                                     Reponsivenes.isLargeScreen(context) ? 1 : 2,
//                                 child: ContactUsFrom()),
//                           ],
//                         ),
//                 ),
//               )),

//             ],
//           ),
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           opacity: 0,
//           borderRadius: BorderRadius.zero),
//     );