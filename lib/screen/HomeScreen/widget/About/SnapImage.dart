import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

class SnapImage extends StatelessWidget {
  final String imageUrl;
  final int index;
  const SnapImage({
    Key? key,
    required this.imageUrl,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 100, left: 60, right: 60),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                customColor: ColorConstant.blueColor,
                value: '#${index + 1}',
                align: TextAlign.left,
                style: TextView.headerStyle(
                  size: 60,
                  weight: FontWeight.w600,
                  color: ColorConstant.blueColor,
                ),
              ),
              Container(
                height: 20,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
