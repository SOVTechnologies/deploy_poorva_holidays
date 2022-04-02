import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/controller/review_controller.dart';
import 'package:poorvaholiday/screen/HomeScreen/Reviews/ReviewCard.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

class ReviewsSection extends StatefulWidget {
  const ReviewsSection({Key? key}) : super(key: key);

  @override
  State<ReviewsSection> createState() => _ReviewsSectionState();
}

class _ReviewsSectionState extends State<ReviewsSection> {
  final SwiperController _controller = SwiperController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          TextView(
            customColor: ColorConstant.blueColor,
            value: 'Reviews',
            align: TextAlign.right,
            style: TextView.headerStyle(
              size: 30,
              weight: FontWeight.w600,
              color: ColorConstant.blueColor,
            ),
          ),
          Expanded(
            child: GetX<ReviewController>(
                init: ReviewController(),
                builder: (reviewController) {
                  if (reviewController.reviewList.isNotEmpty) {
                    return SizedBox(
                      width: double.infinity,
                      child: Swiper(
                          loop: true,
                          autoplay: true,
                          controller: _controller,
                          viewportFraction: 0.5,
                          itemCount: reviewController.reviewList.length,
                          itemBuilder: (context, index) {
                            return ReviewCard(
                              reviewResponse:
                                  reviewController.reviewList[index],
                            );
                          }),
                    );
                  }

                  return Container();
                }),
          ),
        ],
      ),
    );
  }
}
