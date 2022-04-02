import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/controller/besttrip_controller.dart';
import 'package:poorvaholiday/screen/HomeScreen/widget/About/SnapImage.dart';
import 'package:poorvaholiday/screen/widgets/Loader/custom_loader.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<BestTripController>(
      init: BestTripController(),
      builder: (besttripController) {
        return besttripController.dataAvailable == true
            ? SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width,
                child: Row(children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        TextView(
                          customColor: ColorConstant.blueColor,
                          value:
                              'How much are excursion and holidays in Montenegro',
                          align: TextAlign.left,
                          style: TextView.headerStyle(
                            size: 30,
                            weight: FontWeight.w600,
                            color: ColorConstant.blueColor,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextView(
                          value: besttripController.bestTrip.data.description,
                          align: TextAlign.left,
                          fontSize: 14,
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: Swiper(
                    autoplay: true,
                    loop: true,
                    fade: 5,
                    itemCount:
                        besttripController.bestTrip.data.galleryLink.length,
                    layout: SwiperLayout.TINDER,
                    itemBuilder: (context, index) {
                      return SnapImage(
                        imageUrl:
                            besttripController.bestTrip.data.galleryLink[index],
                        index: index,
                      );
                    },
                  ))
                ]),
              )
            : Center(
                child: CustomLoader(),
              );
      },
    );
  }
}
