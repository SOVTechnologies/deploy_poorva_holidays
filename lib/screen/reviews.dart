import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/constant/constant_size.dart';
import 'package:poorvaholiday/controller/review_controller.dart';
import 'package:poorvaholiday/models/review_item.dart';
import 'package:poorvaholiday/screen/widgets/container_radius_boxdecorations.dart';
import 'package:poorvaholiday/screen/widgets/gesturedectector_text_black.dart';

import 'widgets/custom_divider.dart';
import 'widgets/custom_text.dart';

class Reviews extends StatelessWidget {
  Reviews({Key? key}) : super(key: key);

  List<ReviewItem> myReview = [];

  @override
  Widget build(BuildContext context) {
    return GetX<ReviewController>(
      init: ReviewController(),
      builder: (reviewController) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextView(
                    customColor: ColorConstant.blackColor,
                    value: 'Reviews',
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
              CustomDivier(
                edgeInsets: const EdgeInsets.only(left:20,right: 10),
                customColor: ColorConstant.blueColor,
                width: 60,
                height: 3,
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: ConstantSize().getReviewHeight(context),
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: reviewController.reviewList.length,
                  itemBuilder: (BuildContext context, int index) => Container(
                    margin: const EdgeInsets.only(left: 8.0),
                    child: ContainerBoxradiusDecorations(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                          bottomLeft: Radius.circular(40.0)),
                      child: SingleChildScrollView(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: TextView(
                                    value:
                                        reviewController.reviewList[index].name,
                                    customColor: ColorConstant.whiteColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              CustomDivier(
                                  width: 150,
                                  height: 2,
                                  customColor: ColorConstant.whiteColor,
                                  edgeInsets: EdgeInsets.only(left: 10)),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: SizedBox(
                                  width: ConstantSize().getReviewWidth(context),
                                  child: TextView(
                                      value: reviewController
                                          .reviewList[index].description,
                                      customColor: ColorConstant.whiteColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
