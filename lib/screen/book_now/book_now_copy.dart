import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/controller/price_list_controller.dart';
import 'package:poorvaholiday/controller/single_package_info.dart';
import 'package:poorvaholiday/screen/header/appbar.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

import 'add_travel.dart';
import 'personal_details.dart';
import 'child_details.dart';
import 'extraBed.dart';

class BookNow extends StatefulWidget {
  const BookNow({Key? key}) : super(key: key);

  @override
  _BookNowState createState() => _BookNowState();
}

class _BookNowState extends State<BookNow> {
  final priceController = Get.put(PriceController());
  var packageID  = Get.arguments;

  List<Widget> addTravler = [];
  int selectedAmountPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 150),
        child: const PoorvaAppBar(),
      ),
      body: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(30),
            width: MediaQuery.of(context).size.width * 0.70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                PersonalDetails(),
                const SizedBox(
                  height: 20,
                ),
                TextView(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    value: "Travel Details",
                    customColor: ColorConstant.blackColor),
                const SizedBox(
                  height: 10,
                ),
                AddTravellers(),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<PriceController>(
                  // specify type as Controller
                  init: PriceController(), // intialize with the Controller
                  builder: (value) {
                    if (value.counter == 1) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              value: "Travel Extra Bed Details",
                              customColor: ColorConstant.blackColor),
                          const SizedBox(
                            height: 10,
                          ),
                          ExtraBed(),
                        ],
                      );
                    } else if (value.counter == 2) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              value: "Travel Child Details",
                              customColor: ColorConstant.blackColor),
                          const SizedBox(
                            height: 10,
                          ),
                          ChildDetails(),
                        ],
                      );
                    } else if (value.counter == 3) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              value: "Travel Child Details",
                              customColor: ColorConstant.blackColor),
                          const SizedBox(
                            height: 10,
                          ),
                          ChildDetails(),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),



          SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 50, right: 50),
                width: MediaQuery.of(context).size.width * 0.20,
                child: GetX<SinglePackgeInfo>(
                  init: SinglePackgeInfo(packageid:packageID),
                  builder: (singlePackage) {
                    return singlePackage.dataAvailable == true ?
                             ListView.builder(
                      itemCount: singlePackage.customCost.length, //controller.priceList.length,
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
                                    GetBuilder<PriceController>(
                                        init: PriceController(),
                                        builder: (priceController) {
                                          return Checkbox(
                                              value: true,
                                              onChanged: (value) {
                                                priceController.setSelcetion(
                                                    int.parse(value.toString()));
                                              },);
                                        }),
                                    TextView(
                                      customColor: ColorConstant.blueColor,
                                      value: '${singlePackage.customCost[index].costResponse.price}',
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
                                  value: singlePackage.customCost[index].costResponse.description,
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ):Center(child: CircularProgressIndicator(),);
                  }
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
