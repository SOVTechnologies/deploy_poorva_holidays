import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/constant/color_constant.dart';

import 'package:poorvaholiday/constant/constant_size.dart';
import 'package:poorvaholiday/controller/package_controller.dart';
import 'package:poorvaholiday/controller/single_package_info.dart';
import 'package:poorvaholiday/screen/header/appbar.dart';
import 'package:poorvaholiday/screen/short_package_details/hotel_suggestions.dart';
import 'package:poorvaholiday/screen/short_package_details/packageDetails/PackageView.dart';
import 'package:poorvaholiday/screen/short_package_details/short_package_content.dart';
import 'package:poorvaholiday/screen/tours/tour_suggestions.dart';
import 'package:poorvaholiday/screen/widgets/Loader/AnimatedLoader.dart';
import 'package:poorvaholiday/screen/widgets/Loader/custom_loader.dart';
import 'package:poorvaholiday/screen/widgets/imagedecoration.dart';
import 'package:poorvaholiday/utils/responsive.dart';

import '../footer/footer.dart';

class ShortPackagesDetails extends StatefulWidget {
  final String packageId;
  const ShortPackagesDetails({
    Key? key,
    required this.packageId,
  }) : super(key: key);

  @override
  _ShortPackagesDetailsState createState() => _ShortPackagesDetailsState();
}

class _ShortPackagesDetailsState extends State<ShortPackagesDetails> {
  @override
  Widget build(BuildContext context) {
    // var packageid = Get.arguments;

    return GetX<SinglePackgeInfo>(
        init: SinglePackgeInfo(packageid: widget.packageId),
        builder: (controller) {
          return controller.dataAvailable == true
              ? Scaffold(
                  extendBodyBehindAppBar: true,
                  appBar: PreferredSize(
                    preferredSize: Size(MediaQuery.of(context).size.width, 70),
                    child: PoorvaAppBar(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      textColor: ColorConstant.whiteColor,
                      shortBackground: ColorConstant.blueColor,
                    ),
                  ),
                  body: PackageView(
                    controller: controller,
                  ),
                )
              : const Center(child: AnimatedLoader());
        });
  }

  ListView buildListView(SinglePackgeInfo controller) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: controller.packageDetailsResponse.packageStay.length,
      itemBuilder: (BuildContext context, int index) => Container(
        margin: const EdgeInsets.all(10),
        child: HotelSuggestions(
          date: "",
          height: ConstantSize().getTourHeight(context),
          location:
              controller.packageDetailsResponse.packageStay[index].location,
          id: controller.packageDetailsResponse.packageStay[index].nights
              .toString(),
          imageName: controller.packageDetailsResponse.packageStay[index].image,
          initalRating: controller
              .packageDetailsResponse.packageStay[index].rating
              .toDouble(),
          packageName:
              controller.packageDetailsResponse.packageStay[index].hotel,
          price:
              '${controller.packageDetailsResponse.packageStay[index].nights.toString()} Night',
        ),
      ),
    );
  }
}
