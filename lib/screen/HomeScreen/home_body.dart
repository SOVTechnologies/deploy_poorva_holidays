import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/controller/banner_controller.dart';
import 'package:poorvaholiday/controller/top_controller.dart';
import 'package:poorvaholiday/screen/HomeScreen/HeroSection.dart';
import 'package:poorvaholiday/screen/HomeScreen/Reviews/Reviews.dart';
import 'package:poorvaholiday/screen/HomeScreen/widget/About/AboutSection.dart';
import 'package:poorvaholiday/screen/HomeScreen/widget/OurServices/OurServices.dart';
import 'package:poorvaholiday/screen/HomeScreen/widget/TourSection/TourSection.dart';
import 'package:poorvaholiday/screen/widgets/Loader/AnimatedLoader.dart';
import 'package:url_launcher/url_launcher.dart';

import '../footer/footer.dart';

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
                  // buildStack(context),
                  const Herosection(),
                  const SizedBox(
                    height: 40,
                  ),

                  const AboutSection(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // OfferSections(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   height: ConstantSize().getTourHeight(context),
                      //   edgeInsets: EdgeInsets.only(left: 20),
                      //   name: "Offers",
                      //   type: '',
                      //   tourList: bannerController.bannerResponse.data,
                      // ),
                      const SizedBox(
                        height: 40,
                      ),
                      if (topController.domestic.isNotEmpty)
                        TourSection(
                          title: 'Domestic',
                          tourList: topController.domestic,
                        ),
                      const SizedBox(
                        height: 80,
                      ),
                      if (topController.internationals.isNotEmpty)
                        TourSection(
                          title: "International",
                          tourList: topController.internationals,
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // const Montengero(),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  const SizedBox(
                    height: 80,
                  ),
                  // Services(),
                  const OurServices(),

                  const SizedBox(
                    height: 80,
                  ),
                  const ReviewsSection(),
                  const SizedBox(
                    height: 100,
                  ),
                  const Fotters()
                ],
              )
            : Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height,
                child: const AnimatedLoader()),
      ),
    );
  }
}
