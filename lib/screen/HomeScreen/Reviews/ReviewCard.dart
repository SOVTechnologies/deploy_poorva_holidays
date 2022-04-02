import 'package:flutter/material.dart';
import 'package:poorvaholiday/constant/color_constant.dart';

import 'package:poorvaholiday/models/review_response.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

class ReviewCard extends StatelessWidget {
  final ReviewResponse reviewResponse;
  const ReviewCard({
    Key? key,
    required this.reviewResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Avatar
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              // image: DecorationImage(
              //   image: NetworkImage(reviewResponse.imageLink),
              //   fit: BoxFit.cover,
              // ),
            ),
            child: TextView(
              value: '"',
              style: TextView.headerStyle(
                size: 80,
                weight: FontWeight.w600,
                color: ColorConstant.blueColor,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  value: reviewResponse.name,
                  align: TextAlign.left,
                  style: TextView.headerStyle(
                    size: 20,
                    weight: FontWeight.w600,
                    color: ColorConstant.blueColor,
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: TextView(
                    value: reviewResponse.description,
                    align: TextAlign.left,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    customColor: ColorConstant.blackColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
