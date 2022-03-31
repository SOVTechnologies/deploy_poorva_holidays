import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/constant/constant_size.dart';
import 'package:poorvaholiday/controller/single_package_info.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

class InclusionAndExclusion extends StatelessWidget {
  List<String> itenaryInclusion;
  List<String> itenaryExclusion;
  InclusionAndExclusion({Key? key, required this.itenaryInclusion, required this.itenaryExclusion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(ConstantSize().iteneraryContentMargin(context)),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: TextView(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                value: 'Inclusion',
                customColor: ColorConstant.blackColor),
          ),
          SizedBox(
              width: 100,
              child: Divider(
                color: ColorConstant.blueColor,
              )),
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
                    value:
                    '• ${itenaryInclusion[index]}',
                    customColor: ColorConstant.blackColor),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: TextView(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                value: 'Exclusion',
                customColor: ColorConstant.blackColor),
          ),
          SizedBox(
              width: 100,
              child: Divider(
                color: ColorConstant.blueColor,
              )),
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
                    value:
                    '• ${itenaryExclusion[index]}',
                    customColor: ColorConstant.blackColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
