import 'dart:html' as html;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/screen/widgets/Loader/AnimatedLoader.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/constant/constant_size.dart';
import 'package:poorvaholiday/controller/download_broucher.dart';
import 'package:poorvaholiday/controller/package_controller.dart';
import 'package:poorvaholiday/controller/single_package_info.dart';
import 'package:poorvaholiday/models/package_details.dart';
import 'package:poorvaholiday/remote_services/api.dart';
import 'package:poorvaholiday/routes/routes.dart';
import 'package:poorvaholiday/utils/responsive.dart';

import '../../footer/footer.dart';
import '../../header/appbar.dart';
import '../../itinerarySection/cancellation_policy.dart';
import '../../itinerarySection/costing_details.dart';
import '../../itinerarySection/hotel_Info.dart';
import '../../itinerarySection/inclusion_and_exclusion.dart';
import '../../itinerarySection/iteneraryDetails.dart';
import '../container_button.dart';
import '../custom_divider.dart';
import '../custom_text.dart';
import '../imagedecoration.dart';
import '../text_with_Icon.dart';

class PackagesDetails extends StatefulWidget {
  final String packageId;
  const PackagesDetails({
    Key? key,
    required this.packageId,
  }) : super(key: key);

  @override
  _PackagesDetailsState createState() => _PackagesDetailsState();
}

class _PackagesDetailsState extends State<PackagesDetails> {
  late var costID;
  int index = 0;
  List<Widget> myWidget = [];

  DownloadBroucher downloadBroucher = Get.put(DownloadBroucher());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<SinglePackgeInfo>(
          init: SinglePackgeInfo(packageid: widget.packageId),
          builder: (controller) {
            return controller.dataAvailable == true
                ? buildBody(context, controller)
                : const Center(child: AnimatedLoader());
          }),
    );
  }

  buildBody(BuildContext context, SinglePackgeInfo controller) {
    costID = controller.packageDetailsResponse.packageCost;
    myWidget = [
      IteneraryDetails(dayActivityResponse: controller.dayActivityResponse),
      HotelInfo(hotelList: controller.hotelList),
      CostingDetails(
        costResponse: controller.costResponse,
      ),
      InclusionAndExclusion(
          itenaryInclusion: controller.packageDetailsResponse.itenaryInclusion,
          itenaryExclusion: controller.packageDetailsResponse.itenaryExclusion),
      CancellationPolicy(
          packageCancellationPolicy:
              controller.packageDetailsResponse.packageCancellationPolicy),
    ];

    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(children: [
            SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Stack(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: CachedNetworkImage(
                                imageUrl: controller
                                    .packageDetailsResponse.packageThumbailLink,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Center(child: Icon(Icons.error)),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.8),
                                    Colors.black.withOpacity(0.7),
                                    Colors.black.withOpacity(0.6),
                                    Colors.black.withOpacity(0.4),
                                    Colors.black.withOpacity(0.1),
                                    Colors.black.withOpacity(0.05),
                                    Colors.black.withOpacity(0.025),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                        Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(top: 100),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: tourDetails(context,
                                    controller.packageDetailsResponse))),
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        child: Swiper(
                          loop: false,
                          viewportFraction: 0.2,
                          itemCount: controller
                              .packageDetailsResponse.packageGalleryLink.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.only(
                                  right: 10, bottom: 10, top: 10),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                  ),
                                ],
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(controller
                                      .packageDetailsResponse
                                      .packageGalleryLink[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                )),
            PoorvaAppBar(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              textColor: ColorConstant.whiteColor,
              shortBackground: ColorConstant.blueColor,
            ),
          ]),
        ),
        const SizedBox(height: 80),
        SingleChildScrollView(scrollDirection: Axis.horizontal, child: tabs()),
        CustomDivier(
            width: MediaQuery.of(context).size.width,
            height: 2,
            customColor: ColorConstant.blueColor,
            edgeInsets: EdgeInsets.zero),
        const SizedBox(height: 40),
        myWidget[index],
        const SizedBox(height: 40),
      ],
    ));
  }

  Row tabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              index = 0;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: index == 0
                      ? ColorConstant.blueColor
                      : ColorConstant.orangeColor,
                  radius: 3,
                ),
                const SizedBox(
                  width: 8,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: TextView(
                    style: TextView.headerStyle(
                      size: 20,
                      weight: FontWeight.bold,
                      color: ColorConstant.blueColor,
                    ),
                    value: 'Itinerary',
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 25,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              index = 1;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: index == 1
                      ? ColorConstant.blueColor
                      : ColorConstant.orangeColor,
                  radius: 3,
                ),
                const SizedBox(
                  width: 8,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: TextView(
                    style: TextView.headerStyle(
                      size: 20,
                      weight: FontWeight.bold,
                      color: ColorConstant.blueColor,
                    ),
                    value: 'Hotel Info',
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 25,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              index = 2;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: index == 2
                      ? ColorConstant.blueColor
                      : ColorConstant.orangeColor,
                  radius: 3,
                ),
                const SizedBox(
                  width: 8,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: TextView(
                    style: TextView.headerStyle(
                      size: 20,
                      weight: FontWeight.bold,
                      color: ColorConstant.blueColor,
                    ),
                    value: 'Cost and Other Details',
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 25,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                index = 3;
              });
            },
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: index == 3
                      ? ColorConstant.blueColor
                      : ColorConstant.orangeColor,
                  radius: 3,
                ),
                const SizedBox(
                  width: 8,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: TextView(
                    style: TextView.headerStyle(
                      size: 20,
                      weight: FontWeight.bold,
                      color: ColorConstant.blueColor,
                    ),
                    value: 'Inclusion and Exclusion',
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 25,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                index = 4;
              });
            },
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: index == 4
                      ? ColorConstant.blueColor
                      : ColorConstant.orangeColor,
                  radius: 3,
                ),
                const SizedBox(
                  width: 8,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: TextView(
                    style: TextView.headerStyle(
                      size: 20,
                      weight: FontWeight.bold,
                      color: ColorConstant.blueColor,
                    ),
                    value: 'Cancellation Policy',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  SizedBox tourDetails(
      BuildContext context, PackageDetailsResponse packageDetailsResponse) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextView(
            style: TextView.headerStyle(
              size: 30,
              weight: FontWeight.bold,
              color: ColorConstant.blueColor,
            ),
            value:
                '${packageDetailsResponse.packageTotalDays} days ${packageDetailsResponse.packageTotalNight} nights in ${packageDetailsResponse.packageTitle}',
          ),
          const SizedBox(height: 5),
          CustomDivier(
              width: 150,
              height: 2,
              customColor: ColorConstant.blueColor,
              edgeInsets: EdgeInsets.zero),
          const SizedBox(height: 5),
          Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Row(
                children: [
                  TextWithIcon(
                      icon: Icons.location_on,
                      title: packageDetailsResponse.packageCity),
                  const SizedBox(
                    width: 15,
                  ),
                  RatingBar.builder(
                    initialRating:
                        packageDetailsResponse.packageAverageRating.toDouble(),
                    itemCount:
                        packageDetailsResponse.packageAverageRating.toInt(),
                    glow: true,
                    itemSize: 15.0,
                    allowHalfRating: true,
                    updateOnDrag: false,
                    itemBuilder: (BuildContext context, int index) {
                      return Icon(
                        Icons.star,
                        color: ColorConstant.orangeColor,
                      );
                    },
                    onRatingUpdate: (double value) {},
                  ),
                ],
              )),
          const SizedBox(
            height: 10,
          ),
          TextView(
              customColor: ColorConstant.blueColor,
              value: packageDetailsResponse.packageInfo,
              fontSize: 13,
              align: TextAlign.left,
              fontWeight: FontWeight.normal),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              TextWithIcon(
                  icon: Icons.bed_rounded,
                  title:
                      '${packageDetailsResponse.packageTotalDays} days ${packageDetailsResponse.packageTotalNight} nights'),
              const SizedBox(
                width: 30,
              ),
              TextWithIcon(icon: Icons.set_meal_rounded, title: 'Pure Veg'),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              rowDep(packageDetailsResponse),
              const SizedBox(
                width: 30,
              ),
              rowAReturn(packageDetailsResponse),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ContainerButton(
                onTap: () {
                  String url = Api.mainUrl + Api.file + widget.packageId;
                  _launchURL(url);
                },
                title: "Download Broucher",
                backGroundColor: ColorConstant.orangeColor,
              ),
              const SizedBox(
                width: 20,
              ),
              ContainerButton(
                  onTap: () {
                    Get.toNamed(Routes.preBookingPackageDetails,
                        arguments: [widget.packageId, costID]);
                  },
                  title: "Book Now",
                  backGroundColor: ColorConstant.blueColor),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          // SizedBox(
          //   width: MediaQuery.of(context).size.width * 0.5,
          //   height: MediaQuery.of(context).size.height * 0.10,
          //   child: ListView.builder(
          //     physics: const ClampingScrollPhysics(),
          //     shrinkWrap: true,
          //     scrollDirection: Axis.horizontal,
          //     itemCount: packageDetailsResponse.packageGalleryLink.length,
          //     itemBuilder: (BuildContext context, int index) =>
          //         gestureDetector(index, packageDetailsResponse),
          //   ),
          // )
        ],
      ),
    );
  }

  GestureDetector gestureDetector(
      int index, PackageDetailsResponse packageDetailsResponse) {
    return GestureDetector(
      onTap: () {
        Get.defaultDialog(
          radius: 20.0,
          title: "Gallery",
          content: Container(
            width: 550,
            height: 550,
            child: Swiper(
              itemWidth: 520,
              index: index,
              itemHeight: 520,
              control: const SwiperControl(),
              itemCount: packageDetailsResponse.packageGalleryLink.length,
              layout: SwiperLayout.DEFAULT,
              itemBuilder: (context, index) {
                return ContainerImageDecorations(
                  width: 500,
                  height: 500,
                  borderRadius: const BorderRadius.all(Radius.circular(0)),
                  imageName: packageDetailsResponse.packageGalleryLink[index],
                  opacity: 0,
                  child: Container(),
                );
              },
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: ContainerImageDecorations(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          opacity: 0,
          width: 65,
          height: 65,
          imageName: packageDetailsResponse.packageGalleryLink[index],
          child: Container(),
        ),
      ),
    );
  }

  Row rowAReturn(PackageDetailsResponse packageDetailsResponse) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.flight_land_sharp),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                  customColor: ColorConstant.blackColor,
                  value: 'RETURN DATE',
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
              Row(
                children: [
                  TextView(
                      customColor: ColorConstant.blackColor,
                      value: '${packageDetailsResponse.packageEndDate}',
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                  TextView(
                      customColor: ColorConstant.blueColor,
                      value: '. Journey End',
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row rowDep(PackageDetailsResponse packageDetailsResponse) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.flight_takeoff),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                  customColor: ColorConstant.blackColor,
                  value: 'DEPARTURE DATE',
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
              Row(
                children: [
                  TextView(
                      customColor: ColorConstant.blackColor,
                      value: '${packageDetailsResponse.packageStartDate}',
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                  TextView(
                      customColor: ColorConstant.blueColor,
                      value:
                          '. for ${packageDetailsResponse.packageTotalNight} night',
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
