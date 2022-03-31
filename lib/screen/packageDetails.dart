import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/constant/constant_size.dart';
import 'package:poorvaholiday/controller/download_broucher.dart';
import 'package:poorvaholiday/controller/package_controller.dart';
import 'package:poorvaholiday/controller/single_package_info.dart';
import 'package:poorvaholiday/remote_services/api.dart';
import 'package:poorvaholiday/models/package_details.dart';
import 'package:poorvaholiday/routes/routes.dart';
import 'package:poorvaholiday/utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'footer/footer.dart';
import 'header/appbar.dart';
import 'itinerarySection/cancellation_policy.dart';
import 'itinerarySection/costing_details.dart';
import 'itinerarySection/hotel_Info.dart';
import 'itinerarySection/inclusion_and_exclusion.dart';
import 'itinerarySection/iteneraryDetails.dart';
import 'widgets/container_button.dart';
import 'widgets/custom_divider.dart';
import 'widgets/imagedecoration.dart';
import 'widgets/text_with_Icon.dart';
import 'widgets/custom_text.dart';
import 'dart:html' as html;

class PackagesDetails extends StatefulWidget {
  const PackagesDetails({Key? key}) : super(key: key);

  @override
  _PackagesDetailsState createState() => _PackagesDetailsState();
}

class _PackagesDetailsState extends State<PackagesDetails> {
  var packageid = Get.arguments;
  late var costID;
  int index = 0;
  List<Widget> myWidget = [];

  DownloadBroucher downloadBroucher = Get.put(DownloadBroucher());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 150),
        child: const PoorvaAppBar(),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin:
              EdgeInsets.all(ConstantSize().iteneraryContentMargin(context)),
          child: GetBuilder<SinglePackgeInfo>(
              init: SinglePackgeInfo(packageid: packageid),
              builder: (controller) {
                costID = controller.packageDetailsResponse.packageCost;
                myWidget = [
                  IteneraryDetails(
                      dayActivityResponse: controller.dayActivityResponse),
                  HotelInfo(hotelList: controller.hotelList),
                  CostingDetails(
                    costResponse: controller.costResponse,
                  ),
                  InclusionAndExclusion(
                      itenaryInclusion:
                          controller.packageDetailsResponse.itenaryInclusion,
                      itenaryExclusion:
                          controller.packageDetailsResponse.itenaryExclusion),
                  CancellationPolicy(
                      packageCancellationPolicy: controller
                          .packageDetailsResponse.packageCancellationPolicy),
                ];
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //TODO add this to swiper
                        ContainerImageDecorations(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: ConstantSize().getiteneraryTourHeight(context),
                          imageName: controller.packageDetailsResponse.packageThumbailLink,
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          opacity: 0,
                          child: Container(),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        tourDetails(context, controller.packageDetailsResponse),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal, child: tabs()),
                    CustomDivier(
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        customColor: ColorConstant.blueColor,
                        edgeInsets: EdgeInsets.zero),
                    myWidget[index],

                  ],
                );
              }),
        ),
      ),
    );
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
                SizedBox(width: 8,),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: TextView(
                      customColor: ColorConstant.blackColor,
                      value: 'Itinerary',
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
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
                SizedBox(width: 8,),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: TextView(
                      customColor: ColorConstant.blackColor,
                      value: 'Hotel Info',
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
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
                SizedBox(width: 8,),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: TextView(
                      customColor: ColorConstant.blackColor,
                      value: 'Cost and Other Details',
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
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
                SizedBox(width: 8,),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: TextView(
                      customColor: ColorConstant.blackColor,
                      value: 'Inclusion and Exclusion',
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
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
                SizedBox(width: 8,),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: TextView(
                      customColor: ColorConstant.blackColor,
                      value: 'Cancellation Policy',
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
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
      width: MediaQuery.of(context).size.width * 0.5,
      height: ConstantSize().getiteneraryTourHeight(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextView(
              customColor: ColorConstant.blackColor,
              value:
                  '${packageDetailsResponse.packageTotalDays} days ${packageDetailsResponse.packageTotalNight} nights in ${packageDetailsResponse.packageTitle}',
              fontSize: ConstantSize().packageDetailMainTitle(context),
              fontWeight: FontWeight.bold),
          CustomDivier(
              width: 150,
              height: 2,
              customColor: ColorConstant.blueColor,
              edgeInsets: EdgeInsets.zero),

          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Reponsivenes.isLargeScreen(context)
                ? Row(
                    children: [
                      TextWithIcon(
                          icon: Icons.location_on,
                          title: packageDetailsResponse.packageCity),
                      const SizedBox(
                        width: 15,
                      ),
                      RatingBar.builder(
                        initialRating: packageDetailsResponse
                            .packageAverageRating
                            .toDouble(),
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
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextWithIcon(
                          icon: Icons.location_on,
                          title: packageDetailsResponse.packageCity),
                      const SizedBox(
                        height: 5,
                      ),
                      RatingBar.builder(
                        initialRating: packageDetailsResponse
                            .packageAverageRating
                            .toDouble(),
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
                  ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: TextView(
                customColor: ColorConstant.blueColor,
                value:packageDetailsResponse.packageInfo,
                fontSize: 13,
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 15,
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
          Reponsivenes.isLargeScreen(context)
              ? Row(
                  children: [
                    rowDep(packageDetailsResponse),
                    const SizedBox(
                      width: 30,
                    ),
                    rowAReturn(packageDetailsResponse),
                  ],
                )
              : Column(
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
          Reponsivenes.isLargeScreen(context)
              ? Row(
                  children: [
                    ContainerButton(
                      onTap: () {
                        String url = Api.mainUrl + Api.file + packageid;
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
                              arguments: [packageid, costID]);
                        },
                        title: "Book Now",
                        backGroundColor: ColorConstant.blueColor),
                  ],
                )
              : Column(
                  children: [
                    ContainerButton(
                      onTap: () {
                        String url = Api.mainUrl + Api.file + packageid;
                        _launchURL(url);
                      },
                      title: "Download Broucher",
                      backGroundColor: ColorConstant.orangeColor,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ContainerButton(
                        onTap: () {
                          Get.toNamed(Routes.preBookingPackageDetails,
                              arguments: [packageid, costID]);
                        },
                        title: "Book Now",
                        backGroundColor: ColorConstant.blueColor),
                  ],
                ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.10,
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: packageDetailsResponse.packageGalleryLink.length,
              itemBuilder: (BuildContext context, int index) =>
                  gestureDetector(index, packageDetailsResponse),
            ),
          )
        ],
      ),
    );
  }

  GestureDetector gestureDetector(int index, PackageDetailsResponse packageDetailsResponse) {
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
              control: SwiperControl(),
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
