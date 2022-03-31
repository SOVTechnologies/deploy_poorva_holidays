import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/constant/constant_size.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

class ItenerarySection extends StatelessWidget {
  String day;
  String title;
  Widget desc;
  String attraction;
  String note;

  ItenerarySection(
      {Key? key,
      required this.day,
      required this.title,
      required this.desc,
      required this.attraction,
      required this.note})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(12),
            child: TextView(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                value: day,
                customColor: ColorConstant.whiteColor),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: ColorConstant.blueColor),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
              width: ConstantSize().getiteneraryWidth(context),
                child: TextView(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    value: title,
                    customColor: ColorConstant.blackColor),
              ),
              SizedBox(
                width: ConstantSize().getiteneraryWidth(context),
                height:ConstantSize().getiteneraryHeight(context),
                child: desc,
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              attraction.isNotEmpty ? GestureDetector(
                onTap: () {
                  Get.defaultDialog(
                      radius: 20.0,
                      title: "Info",
                      titlePadding: const EdgeInsets.all(10),
                      content: SizedBox(
                        width: 500,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextView(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              value: attraction,
                              customColor: ColorConstant.blackColor),
                        ),
                      ));
                },
                child: TextView(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    value: 'Info',

                    customColor: ColorConstant.blueColor),
              ):Container(),
              SizedBox(width: 30),
              note.isNotEmpty ? GestureDetector(
                onTap: () {
                  Get.defaultDialog(
                      radius: 20.0,
                      title: "Note",
                      titlePadding: const EdgeInsets.all(10),
                      content: SizedBox(
                        width: 500,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextView(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              value: note,
                              customColor: ColorConstant.blackColor),
                        ),
                      ));
                },
                child: TextView(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    value: 'Note',
                    customColor: ColorConstant.orangeColor),
              ):Container(),
            ],
          )
        ],
      ),
    );
  }
}
