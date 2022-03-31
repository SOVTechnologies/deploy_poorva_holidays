import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/constant/constant_size.dart';
import 'package:poorvaholiday/controller/banner_controller.dart';
import 'package:poorvaholiday/controller/top_controller.dart';
import 'package:poorvaholiday/screen/newsLetter/news_letter.dart';
import 'package:poorvaholiday/screen/reviews.dart';
import 'package:poorvaholiday/screen/services.dart';
import 'package:poorvaholiday/screen/tours/offersections.dart';
import 'package:poorvaholiday/screen/tours/tours.dart';
import 'package:poorvaholiday/screen/widgets/custom_loader.dart';
import 'package:poorvaholiday/utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

import 'footer/footer.dart';
import 'widgets/container_radius_boxdecorations.dart';
import 'widgets/custom_divider.dart';
import 'widgets/imagedecoration.dart';
import 'montengero.dart';
import 'widgets/sociamedia.dart';
import 'widgets/custom_text.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  BannerController bannerController = Get.put(BannerController());
  TopController topController = Get.put(TopController());

  List<String> imageName = [
    'https://images.unsplash.com/photo-1617469165786-8007eda3caa7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    'https://images.unsplash.com/photo-1611605645802-c21be743c321?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fG5lcGFsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://media.istockphoto.com/photos/holy-town-varanasi-and-the-river-ganges-picture-id827065008?b=1&k=20&m=827065008&s=170667a&w=0&h=YjToqYIXDJUZvgVFjW8K_WSPAODbZhwRPNcO8SjGo14=',
    'https://images.unsplash.com/photo-1571536802807-30451e3955d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXR0YXIlMjBwcmFkZXNofGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1613445607898-f46e51645acf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8dXR0YXIlMjBwcmFkZXNofGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => bannerController.isBannerDataAvailable == true
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildStack(context),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OfferSections(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        height: ConstantSize().getTourHeight(context),
                        edgeInsets: EdgeInsets.only(left: 20),
                        name: "Offers",
                        type: '',
                        tourList: bannerController.bannerResponse.data,
                      ),

                      const SizedBox(
                        height: 40,
                      ),
                      Tours(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        height: ConstantSize().getTourHeight(context),
                        edgeInsets: EdgeInsets.only(left: 20),
                        name: "Domestic",
                        type: '',
                        tourList: topController.domestic,
                      ),
                      CustomDivier(
                        edgeInsets: const EdgeInsets.only(right: 10),
                        customColor: ColorConstant.whiteColor,
                        width: ConstantSize().unforgotabelDividerSize(context),
                        height: 4,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Tours(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        height: ConstantSize().getTourHeight(context),
                        edgeInsets: EdgeInsets.only(left: 20),
                        name: "International",
                        type: '',
                        tourList: topController.internationals,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  NewsLetter(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Montengero(),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Services(),
                  const SizedBox(
                    height: 20,
                  ),
                  Reviews(),
                  const SizedBox(
                    height: 20,
                  ),
                  Fotters()
                ],
              )
            : Center(child: const CustomLoader()),
      ),
    );
  }

  Stack buildStack(BuildContext context) {
    return Stack(
      children: [
        buildSizedBox(context),
        Positioned(
          top: 130,
          left: 100,
          child: TextView(
              customColor: ColorConstant.whiteColor,
              value: "Get An Unforgettable",
              fontSize: ConstantSize().unforgotabelSize(context),
              fontWeight: FontWeight.w600),
        ),
        Positioned(
            top: 180,
            left: 100,
            child: Row(
              children: [
                CustomDivier(
                  edgeInsets: const EdgeInsets.only(right: 10),
                  customColor: ColorConstant.whiteColor,
                  width: ConstantSize().unforgotabelDividerSize(context),
                  height: 4,
                ),
                TextView(
                    customColor: ColorConstant.whiteColor,
                    value: "Vacations In TRAVELING",
                    fontSize: ConstantSize().unforgotabelSize(context),
                    fontWeight: FontWeight.w600),
              ],
            )),
        Positioned(
            bottom: 0,
            left: 10,
            child: ContainerBoxradiusDecorations(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
              child: Column(
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
            )),
        Positioned(
          bottom: 0,
          right: 10,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.55,
            child: Tours(
              crossAxisAlignment: CrossAxisAlignment.end,
              height: ConstantSize().getTourHeight(context),
              edgeInsets: const EdgeInsets.only(left: 10, bottom: 10),
              name: "",
              type: '',
              tourList: topController.top,
            ),
          ),
        ),
      ],
    );
  }

  SizedBox buildSizedBox(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: ConstantSize().bannerHeight(context),
      child: Swiper(
          autoplay: true,
          loop: true,
          control: const SwiperControl(),
          itemCount: imageName.length,
          layout: SwiperLayout.DEFAULT,
          autoplayDelay: 5000,
          itemBuilder: (context, index) {
            return Image.network(imageName[index],fit: BoxFit.fill);
          }),
    );
  }
}
