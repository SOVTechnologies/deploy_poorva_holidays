import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:poorvaholiday/constant/color_constant.dart';

import 'package:poorvaholiday/models/services_response.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

class ServiceCard extends StatelessWidget {
  final ServicesResponse service;
  const ServiceCard({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 80,
            width: 80,
            child: CachedNetworkImage(
              imageUrl: service.imageLink.trim(),
            ),
          ),
          SizedBox(height: 10),
          TextView(
            value: service.name,
            align: TextAlign.center,
            style: TextView.headerStyle(
              size: 20,
              weight: FontWeight.w600,
              color: ColorConstant.blueColor,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: TextView(
              value: service.description,
              align: TextAlign.center,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              customColor: ColorConstant.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
