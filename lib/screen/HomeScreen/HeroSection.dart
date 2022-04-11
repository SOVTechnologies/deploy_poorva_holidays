import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/helpers/Seo/renderers/text_renderer/text_renderer_style.dart';
import 'package:poorvaholiday/screen/HomeScreen/widget/NewsLetter.dart';

import 'package:poorvaholiday/screen/header/appbar.dart';
import 'package:poorvaholiday/screen/widgets/container_radius_boxdecorations.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';
import 'package:poorvaholiday/screen/widgets/sociamedia.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class Herosection extends StatefulWidget {
  const Herosection({Key? key}) : super(key: key);

  @override
  State<Herosection> createState() => _HerosectionState();
}

class _HerosectionState extends State<Herosection> {
  List<String> imageName = [
    'https://images.unsplash.com/photo-1617469165786-8007eda3caa7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    'https://images.unsplash.com/photo-1611605645802-c21be743c321?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fG5lcGFsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://media.istockphoto.com/photos/holy-town-varanasi-and-the-river-ganges-picture-id827065008?b=1&k=20&m=827065008&s=170667a&w=0&h=YjToqYIXDJUZvgVFjW8K_WSPAODbZhwRPNcO8SjGo14=',
    'https://images.unsplash.com/photo-1571536802807-30451e3955d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXR0YXIlMjBwcmFkZXNofGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1613445607898-f46e51645acf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8dXR0YXIlMjBwcmFkZXNofGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
  ];
  int activeIndex = 0;
  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width,
          color: ColorConstant.blueColor,
          alignment: Alignment.topLeft,
          child: PoorvaAppBar(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1, right: 20),
          ),
        ),
        Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.1,
                left: MediaQuery.of(context).size.width * 0.1),
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Stack(
              children: [
                Swiper(
                  itemCount: imageName.length,
                  autoplay: true,
                  autoplayDelay: 5000,
                  autoplayDisableOnInteraction: true,
                  onIndexChanged: (index) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      // decoration: BoxDecoration(
                      //   image: DecorationImage(
                      //     image: NetworkImage(imageName[index]),
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      child: CachedNetworkImage(
                        imageUrl: imageName[index],
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) {
                          // blurred background image like instagram
                          return Container(
                              // height: MediaQuery.of(context).size.height * 0.7,
                              // width: MediaQuery.of(context).size.width,
                              // decoration: BoxDecoration(
                              //   gradient: LinearGradient(
                              //     begin: Alignment.topCenter,
                              //     end: Alignment.bottomCenter,
                              //     colors: [
                              //       Colors.black.withOpacity(0.9),
                              //       Colors.black.withOpacity(0.7),
                              //       Colors.black.withOpacity(0.5),
                              //       Colors.black.withOpacity(0.2),
                              //       Colors.black.withOpacity(0.1),
                              //       Colors.black.withOpacity(0.05),
                              //       Colors.black.withOpacity(0.025),
                              //       Colors.black.withOpacity(0.01),
                              //     ],
                              //     stops: [
                              //       0.1,
                              //       0.3,
                              //       0.5,
                              //       0.7,
                              //       0.9,
                              //       0.95,
                              //       0.975,
                              //       0.99,
                              //       1
                              //     ],
                              //   ),
                              // ),
                              );
                        },
                      ),
                    );
                  },
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.3),
                      Colors.transparent,
                      Colors.transparent,
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextView(
                          style: TextView.headerStyle(
                            size: 40,
                            weight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textRenderStyle: TextRendererStyle.header1,
                          isSeoText: true,
                          value:
                              'Get An Unforgettable \nVacations In TRAVELING',
                          align: TextAlign.left,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.48,
          left: MediaQuery.of(context).size.width * 0.08,
          child: RotatedBox(
            quarterTurns: 3,
            child: AnimatedSmoothIndicator(
              effect: ExpandingDotsEffect(
                activeDotColor: ColorConstant.whiteColor,
                dotColor: ColorConstant.whiteColor,
                dotHeight: 5,
                dotWidth: 5,
              ),
              count: imageName.length,
              activeIndex: activeIndex,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.8,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
              ],
            ),
            child: const NewsLetter(),
            height: 120,
            width: MediaQuery.of(context).size.width * 0.6,
          ),
        ),
        Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left: 10,
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
            )),
      ],
    );
  }

  SizedBox buildSizedBox(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 500,
      child: Swiper(
          autoplay: true,
          loop: true,
          control: const SwiperControl(),
          itemCount: imageName.length,
          layout: SwiperLayout.DEFAULT,
          autoplayDelay: 5000,
          itemBuilder: (context, index) {
            return Image.network(imageName[index], fit: BoxFit.fill);
          }),
    );
  }
}
