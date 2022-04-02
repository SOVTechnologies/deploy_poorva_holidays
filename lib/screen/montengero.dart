import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/constant/constant_size.dart';
import 'package:poorvaholiday/controller/besttrip_controller.dart';
import 'package:poorvaholiday/screen/widgets/Loader/custom_loader.dart';
import 'package:poorvaholiday/utils/responsive.dart';

import 'widgets/imagedecoration.dart';
import 'widgets/custom_text.dart';

class Montengero extends StatelessWidget {
  const Montengero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<BestTripController>(
      init: BestTripController(),
      builder: (besttripController) {
        return besttripController.dataAvailable == true
            ? buildRow(context, besttripController)
            : Center(
                child: CustomLoader(),
              );
      },
    );
  }

  Row buildRow(BuildContext context, BestTripController besttripController) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: ConstantSize().getBestViewWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextView(
                  customColor: ColorConstant.blackColor,
                  value: "How much are excursion and holidays in Montenegro",
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              const SizedBox(
                height: 10,
              ),
              TextView(
                  customColor: ColorConstant.blackColor,
                  value: besttripController.bestTrip.data.description,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            ],
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Swiper(
          itemWidth: ConstantSize().getBestViewWidth(context),
          itemHeight: ConstantSize().getBestViewHeight(context),
          autoplay: true,
          loop: true,
          fade: 5,
          itemCount: besttripController.bestTrip.data.galleryLink.length,
          layout: SwiperLayout.TINDER,
          itemBuilder: (context, index) {
            return ContainerImageDecorations(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.45,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              imageName: besttripController.bestTrip.data.galleryLink[index],
              opacity: 0,
              child: Container(),
            );
          },
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
