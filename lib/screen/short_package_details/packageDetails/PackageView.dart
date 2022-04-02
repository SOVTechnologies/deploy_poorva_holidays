import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:poorvaholiday/constant/color_constant.dart';

import 'package:poorvaholiday/controller/single_package_info.dart';
import 'package:poorvaholiday/screen/short_package_details/hotel_suggestions.dart';
import 'package:poorvaholiday/screen/short_package_details/short_package_content.dart';

class PackageView extends StatefulWidget {
  final SinglePackgeInfo controller;
  const PackageView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PackageView> createState() => _PackageViewState();
}

class _PackageViewState extends State<PackageView> {
  final SwiperController _swiperController = SwiperController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Expanded(
                  child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: CachedNetworkImage(
                      imageUrl: widget.controller.packageDetailsResponse
                          .packageThumbailLink,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.3),
                            Colors.transparent,
                            Colors.transparent,
                          ]),
                    ),
                  )
                ],
              )),
              Expanded(
                  child: ShortPackageContent(
                      packagesDetails:
                          widget.controller.packageDetailsResponse))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.72,
          ),
          height: MediaQuery.of(context).size.height * 0.28,
          width: MediaQuery.of(context).size.width,
          child: Swiper(
            loop: false,
            controller: _swiperController,
            viewportFraction: 0.2,
            itemCount:
                widget.controller.packageDetailsResponse.packageStay.length,
            itemBuilder: (BuildContext context, int index) {
              return HotelSuggestions(
                date: "",
                height: MediaQuery.of(context).size.height * 0.28,
                location: widget.controller.packageDetailsResponse
                    .packageStay[index].location,
                id: widget
                    .controller.packageDetailsResponse.packageStay[index].nights
                    .toString(),
                imageName: widget
                    .controller.packageDetailsResponse.packageStay[index].image,
                initalRating: widget
                    .controller.packageDetailsResponse.packageStay[index].rating
                    .toDouble(),
                packageName: widget
                    .controller.packageDetailsResponse.packageStay[index].hotel,
                price:
                    '${widget.controller.packageDetailsResponse.packageStay[index].nights.toString()} Night',
              );
            },
          ),
        ),
        Positioned(
          child: IconButton(
            color: ColorConstant.blueColor,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              _swiperController.next();
            },
          ),
          top: MediaQuery.of(context).size.height * 0.68,
          right: 20,
        ),
      ],
    );
  }
}
