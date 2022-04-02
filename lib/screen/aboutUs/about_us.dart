import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/controller/about_us_controller.dart';
import 'package:poorvaholiday/screen/header/appbar.dart';
import 'package:poorvaholiday/screen/widgets/container_radius_boxdecorations.dart';
import 'package:poorvaholiday/screen/widgets/Loader/custom_loader.dart';
import 'package:poorvaholiday/screen/widgets/imagedecoration.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';
import 'package:poorvaholiday/utils/responsive.dart';

import '../footer/footer.dart';
import 'about_company.dart';
import 'about_owner.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

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
                    value: 'About Us',
                    customColor: ColorConstant.blueColor),
              ),
              Expanded(
                  child: ContainerBoxradiusDecorations(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
                child: GetX<AboutUsController>(
                    init: AboutUsController(),
                    builder: (aboutUsController) {
                      return aboutUsController.dataAvailable == true
                          ? SingleChildScrollView(
                              child: Reponsivenes.isSmallScreen(context)
                                  ? Column(
                                      children: [
                                        Expanded(
                                            child: AboutOwner(
                                                aboutU: aboutUsController
                                                    .aboutUs[0])),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Expanded(
                                            child: AboutComapny(
                                                aboutU: aboutUsController
                                                    .aboutUs[1])),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Expanded(
                                            child: AboutOwner(
                                                aboutU: aboutUsController
                                                    .aboutUs[0])),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Expanded(
                                            child: AboutComapny(
                                                aboutU: aboutUsController
                                                    .aboutUs[1])),
                                      ],
                                    ),
                            )
                          : CustomLoader();
                    }),
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
