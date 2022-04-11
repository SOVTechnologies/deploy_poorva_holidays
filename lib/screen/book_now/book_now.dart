import 'dart:html';
import 'dart:ui' as ui;

import 'package:beamer/beamer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/constant/constant_size.dart';
import 'package:poorvaholiday/controller/auth_controller.dart';
import 'package:poorvaholiday/controller/booking_controller.dart';
import 'package:poorvaholiday/controller/cost_controller.dart';
import 'package:poorvaholiday/routes/routes.dart';
import 'package:poorvaholiday/screen/header/appbar.dart';
import 'package:poorvaholiday/screen/widgets/Loader/custom_loader.dart';
import 'package:poorvaholiday/screen/widgets/container_button.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';
import 'package:poorvaholiday/utils/responsive.dart';

import 'add_travel.dart';
import 'child_details.dart';
import 'extraBed.dart';
import 'personal_details.dart';

class BookNow extends StatefulWidget {
  final String packageID;
  final String costId;
  final String? redirectLocation;
  const BookNow({
    Key? key,
    required this.packageID,
    required this.costId,
    this.redirectLocation,
  }) : super(key: key);

  @override
  _BookNowState createState() => _BookNowState();
}

class _BookNowState extends State<BookNow> {
  BookingController bookingController = Get.put(BookingController());
  AuthController registerController = Get.put(AuthController());
  @override
  void initState() {
    super.initState();
    Get.lazyPut(() => AuthController());
  }

  @override
  Widget build(BuildContext context) {
    print('redirect to: ${widget.redirectLocation}');
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 150),
        child: PoorvaAppBar(
          backgroundColor: ColorConstant.blueColor,
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
      body: GetX<CostController>(
        init: CostController(costID: widget.costId),
        builder: (singlePackage) {
          return singlePackage.dataAvailable == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 3,
                        child: registerController.dataAvailable &&
                                !registerController.isdataGeetingFetch
                            ? SingleChildScrollView(
                                child: buildPersonalExpanded(
                                    context, singlePackage))
                            : const Center(child: CustomLoader())),
                    Expanded(child: buildPriceExpanded(singlePackage)),
                  ],
                )
              // : SingleChildScrollView(
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         SizedBox(
              //             height: 180,
              //             child: buildPriceExpanded(singlePackage)),
              //         buildPersonalExpanded(context, singlePackage),
              //       ],
              //     ),
              //   )
              : Container();
        },
      ),
    );
  }

  Widget buildPersonalExpanded(
      BuildContext context, CostController singlePackage) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(ConstantSize().iteneraryContentMargin(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          PersonalDetails(),
          const SizedBox(
            height: 20,
          ),
          singlePackage.customCost[0].isSelected == true
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        value: "Travel Details",
                        customColor: ColorConstant.blackColor),
                    const SizedBox(
                      height: 10,
                    ),
                    AddTravellers(),
                  ],
                )
              : Container(),
          const SizedBox(
            height: 20,
          ),
          singlePackage.customCost[1].isSelected == true
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        value: "Travel Extra Bed Details",
                        customColor: ColorConstant.blackColor),
                    TextView(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        value: "*For Extra Bed",
                        customColor: ColorConstant.blackColor),
                    const SizedBox(
                      height: 10,
                    ),
                    ExtraBed(),
                  ],
                )
              : Container(),
          const SizedBox(
            height: 20,
          ),
          singlePackage.customCost[2].isSelected == true
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        value: "Travel Child Details",
                        customColor: ColorConstant.blackColor),
                    TextView(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        value: "*Child Below 11 Years Without Extra Bed",
                        customColor: ColorConstant.blackColor),
                    const SizedBox(
                      height: 10,
                    ),
                    ChildDetails(),
                  ],
                )
              : Container(),
          const SizedBox(
            height: 20,
          ),
          singlePackage.customCost[3].isSelected == true
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        value: "Travel Child Details",
                        customColor: ColorConstant.blackColor),
                    TextView(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        value: "*Child Upto 6 Years",
                        customColor: ColorConstant.blackColor),
                    const SizedBox(
                      height: 10,
                    ),
                    ChildDetails(),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  double finalPrice = 0;
  Widget buildPriceExpanded(CostController singlePackage) {
    return Container(
      margin: EdgeInsets.all(ConstantSize().iteneraryContentMargin(context)),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: singlePackage
                  .customCost.length, //controller.priceList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: singlePackage
                                  .customCost[index].isSelected.value,
                              onChanged: (value) {
                                singlePackage.customCost[index].isSelected
                                    .toggle();
                              },
                            ),
                            TextView(
                              customColor: ColorConstant.blueColor,
                              value:
                                  '\u{20B9} ${singlePackage.customCost[index].costResponse.price}',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            TextView(
                              customColor: ColorConstant.orangeColor,
                              value: "Per Person",
                              fontSize: 8,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                        TextView(
                          customColor: ColorConstant.blackColor,
                          value: singlePackage
                              .customCost[index].costResponse.description,
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          bookingController.isPaymentGatewayCalled == false
              ? ContainerButton(
                  onTap: () {
                    User? user = FirebaseAuth.instance.currentUser;
                    if (user != null) {
                      setState(() {
                        finalPrice = double.parse((singlePackage.totalPrice +
                                (singlePackage.totalPrice * 0.18))
                            .toStringAsFixed(2));
                      });
                      bookingController.getBookingID(
                          finalPrice,
                          widget.packageID,
                          user,
                          singlePackage.customCost,
                          context);
                    } else {
                      BeamState beamState = Beamer.of(context)
                          .currentBeamLocation
                          .state as BeamState;
                      Beamer.of(context).beamToNamed(
                          '${Routes.authentication}?type=Login',
                          data: beamState.uri.toString());
                    }
                  },
                  title: singlePackage.totalPrice == 0
                      ? 'Proceed For Payment '
                      : 'Proceed For Payment ${(singlePackage.totalPrice + (singlePackage.totalPrice * 0.18)).toStringAsFixed(2)} Including GST 18%',
                  backGroundColor: ColorConstant.blueColor)
              : Center(
                  child: CustomLoader(),
                )
        ],
      ),
    );
  }
}
