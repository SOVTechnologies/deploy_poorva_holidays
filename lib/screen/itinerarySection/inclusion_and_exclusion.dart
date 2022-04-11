import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/constant/constant_size.dart';
import 'package:poorvaholiday/controller/single_package_info.dart';
import 'package:poorvaholiday/screen/widgets/custom_divider.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

class InclusionAndExclusion extends StatelessWidget {
  List<String> itenaryInclusion;
  List<String> itenaryExclusion;
  InclusionAndExclusion(
      {Key? key,
      required this.itenaryInclusion,
      required this.itenaryExclusion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(ConstantSize().iteneraryContentMargin(context)),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextView(
              style: TextView.headerStyle(
                size: 20,
                weight: FontWeight.bold,
                color: ColorConstant.blueColor,
              ),
              align: TextAlign.left,
              value: 'Inclusion',
              customColor: ColorConstant.blackColor),
          CustomDivier(
              width: 160,
              height: 5,
              customColor: ColorConstant.blueColor,
              edgeInsets: const EdgeInsets.only(top: 10, bottom: 10)),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: itenaryInclusion.length,
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextView(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    value: '• ${itenaryInclusion[index]}',
                    customColor: ColorConstant.blackColor),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextView(
              style: TextView.headerStyle(
                size: 20,
                weight: FontWeight.bold,
                color: ColorConstant.blueColor,
              ),
              align: TextAlign.left,
              value: 'Exclusion',
              customColor: ColorConstant.blackColor),
          CustomDivier(
              width: 160,
              height: 5,
              customColor: ColorConstant.blueColor,
              edgeInsets: const EdgeInsets.only(top: 10, bottom: 10)),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: itenaryExclusion.length,
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextView(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    value: '• ${itenaryExclusion[index]}',
                    customColor: ColorConstant.blackColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
