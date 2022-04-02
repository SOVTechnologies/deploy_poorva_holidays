import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';

import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/controller/services_controller.dart';

import 'package:poorvaholiday/screen/HomeScreen/widget/OurServices/ServiceCard.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

class OurServices extends StatefulWidget {
  const OurServices({
    Key? key,
  }) : super(key: key);

  @override
  State<OurServices> createState() => _OurServicesState();
}

class _OurServicesState extends State<OurServices> {
  final SwiperController _controller = SwiperController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      color: ColorConstant.blueColor.withOpacity(0.1),
      child: Column(
        children: [
          SizedBox(height: 20),
          TextView(
            customColor: ColorConstant.blueColor,
            value: 'Our Services',
            align: TextAlign.right,
            style: TextView.headerStyle(
              size: 30,
              weight: FontWeight.w600,
              color: ColorConstant.blueColor,
            ),
          ),
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 40),
          //   child: Row(
          //     children: [
          //       TextView(
          //         customColor: ColorConstant.blueColor,
          //         value: 'Our Services',
          //         align: TextAlign.right,
          //         style: TextView.headerStyle(
          //           size: 30,
          //           weight: FontWeight.w600,
          //           color: ColorConstant.blueColor,
          //         ),
          //       ),
          //       const Spacer(),
          //       Row(
          //         children: [
          //           InkWell(
          //             onTap: () {
          //               _controller.previous();
          //             },
          //             borderRadius: BorderRadius.circular(100),
          //             child: Container(
          //               width: 40,
          //               height: 40,
          //               decoration: BoxDecoration(
          //                 color: ColorConstant.blueColor,
          //                 shape: BoxShape.circle,
          //               ),
          //               child: Center(
          //                 child: Icon(
          //                   Icons.arrow_back_ios,
          //                   size: 20,
          //                   color: ColorConstant.whiteColor,
          //                 ),
          //               ),
          //             ),
          //           ),
          //           const SizedBox(
          //             width: 10,
          //           ),
          //           InkWell(
          //             onTap: () {
          //               _controller.next();
          //             },
          //             borderRadius: BorderRadius.circular(100),
          //             child: Container(
          //               width: 40,
          //               height: 40,
          //               decoration: BoxDecoration(
          //                 color: ColorConstant.blueColor,
          //                 shape: BoxShape.circle,
          //               ),
          //               child: Center(
          //                 child: Icon(
          //                   Icons.arrow_forward_ios,
          //                   size: 20,
          //                   color: ColorConstant.whiteColor,
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          Expanded(
            flex: 3,
            child: GetX<ServiceController>(
                init: ServiceController(),
                builder: (servicesController) {
                  return Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: servicesController.servicesDetails
                          .map((e) => ServiceCard(
                                service: e,
                              ))
                          .toList(),
                    ),
                  );
                  // Swiper(
                  //     controller: _controller,
                  //     loop: true,
                  //     viewportFraction: 0.3,
                  //     itemCount: servicesController.servicesDetails.length,
                  //     itemBuilder: (context, index) {
                  //       return ServiceCard(
                  //         service: servicesController.servicesDetails[index],
                  //       );
                  //     });
                }),
          ),
          // Expanded(
          //     flex: 1,
          //     child: Container(
          //       padding: const EdgeInsets.only(right: 40),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.end,
          //         children: [
          //           TextView(
          //             customColor: ColorConstant.blueColor,
          //             value: 'Our Services',
          //             align: TextAlign.right,
          //             style: TextView.headerStyle(
          //               size: 30,
          //               weight: FontWeight.w600,
          //               color: ColorConstant.blueColor,
          //             ),
          //           ),
          //         ],
          //       ),
          //     )),
        ],
      ),
    );
  }
}
