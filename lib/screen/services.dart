import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/constant/constant_size.dart';
import 'package:poorvaholiday/controller/services_controller.dart';
import 'package:poorvaholiday/screen/widgets/custom_divider.dart';
import 'package:poorvaholiday/screen/widgets/price_design.dart';

import 'widgets/imagedecoration.dart';
import 'widgets/custom_text.dart';
class Services extends StatelessWidget {
  Services({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: MouseRegion(
              child: TextView(
                  customColor: ColorConstant.blackColor,
                  value: 'Services',
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
          ),
          CustomDivier(
            edgeInsets: const EdgeInsets.only(left:20,right: 10),
            customColor: ColorConstant.blueColor,
            width: 60,
            height: 3,
          ),
          const SizedBox(height: 20,),
          SizedBox(

            height: ConstantSize().getTourHeight(context),
            child: GetX<ServiceController>(
              init: ServiceController(),
              builder: (servicesController) {
                return ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: servicesController.servicesDetails.length,
                  itemBuilder: (BuildContext context, int index) => MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: ContainerImageDecorations(
                          //todo add key here
                          imageName:servicesController.servicesDetails[index].imageLink,
                          child: Positioned(
                            top: 0,
                            right: 0,
                            child: PriceDesign(
                              price:servicesController.servicesDetails[index].name,
                              bottomLeft: 20.0,
                              bottomRight: 0.0,
                              topRight: 20.0,
                              topLeft: 0.0,
                            ),
                          ),
                          width: ConstantSize().getServicesWidth(context),
                          height: ConstantSize().getServicesHeight(context),
                          opacity: 0,
                          borderRadius: const BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
