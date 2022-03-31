import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/constant/constant_size.dart';
import 'package:poorvaholiday/controller/package_controller.dart';
import 'package:poorvaholiday/controller/single_package_info.dart';
import 'package:poorvaholiday/screen/header/appbar.dart';
import 'package:poorvaholiday/screen/short_package_details/hotel_suggestions.dart';
import 'package:poorvaholiday/screen/short_package_details/short_package_content.dart';
import 'package:poorvaholiday/screen/tours/tour_suggestions.dart';
import 'package:poorvaholiday/screen/widgets/custom_loader.dart';
import 'package:poorvaholiday/screen/widgets/imagedecoration.dart';
import 'package:poorvaholiday/utils/responsive.dart';

import '../footer/footer.dart';

class ShortPackagesDetails extends StatefulWidget {
  const ShortPackagesDetails({Key? key}) : super(key: key);

  @override
  _ShortPackagesDetailsState createState() => _ShortPackagesDetailsState();
}

class _ShortPackagesDetailsState extends State<ShortPackagesDetails> {
  @override
  Widget build(BuildContext context) {
    var packageid = Get.arguments;
    print(packageid);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 150),
        child: const PoorvaAppBar(),
      ),
      body: GetX<SinglePackgeInfo>(
          init: SinglePackgeInfo(packageid: packageid),
          builder: (controller) {
            return controller.dataAvailable == true
                ? buildStack(controller, context)
                : CustomLoader();
          }),
    );
  }

  Widget buildStack(SinglePackgeInfo controller, BuildContext context) {
    return Reponsivenes.isLargeScreen(context)
        ? buildStacks(controller, context)
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildImageExpanded(controller, context, MediaQuery.of(context).size.width),
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: buildListView(controller),
              ),
              buildSortPackageExpanded(controller),
              Fotters()
            ],
          );
  }

  Stack buildStacks(SinglePackgeInfo controller, BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            buildImageExpanded(
                controller, context, MediaQuery.of(context).size.width * 0.5),
            buildSortPackageExpanded(controller),
          ],
        ),
        Positioned(
          bottom: Reponsivenes.isLargeScreen(context)
              ? 10
              : MediaQuery.of(context).size.height / 2,
          right: 0,
          child: SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width * 0.6,
            child: buildListView(controller),
          ),
        )
      ],
    );
  }

  Expanded buildSortPackageExpanded(SinglePackgeInfo controller) {
    return Expanded(
        flex: 1,
        child: ShortPackageContent(
            packagesDetails: controller.packageDetailsResponse));
  }

  Expanded buildImageExpanded(
      SinglePackgeInfo controller, BuildContext context, double width) {
    return Expanded(
        flex: 1,
        child: ContainerImageDecorations(
            imageName: controller.packageDetailsResponse.packageThumbailLink,
            child: Container(),
            width: width,
            height: MediaQuery.of(context).size.height,
            opacity: 0.3,
            borderRadius: BorderRadius.zero));
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
          location: controller.packageDetailsResponse.packageStay[index].location,
          id: controller.packageDetailsResponse.packageStay[index].nights.toString(),
          imageName: controller.packageDetailsResponse.packageStay[index].image,
          initalRating: controller.packageDetailsResponse.packageStay[index].rating.toDouble(),
          packageName: controller.packageDetailsResponse.packageStay[index].hotel,
          price: '${controller.packageDetailsResponse.packageStay[index].nights.toString()} Night',
        ),
      ),
    );
  }
}
