import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/controller/single_package_info.dart';
import 'package:poorvaholiday/models/cost.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

class CostingDetails extends StatelessWidget {
  CostingDetails({
    Key? key,
    required this.costResponse,
  }) : super(key: key);

  CostResponse costResponse;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(50),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.50,
      child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          itemCount: costResponse.costPlan.length,
          itemBuilder: (BuildContext context, int index) {
            return buildCard(costResponse.costPlan[index]);
          }),
    );
  }

  Card buildCard(CostPlan costPlan) {
    return Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //'\u{20B9} ${NumberFormat('##,###,###', 'en_US').format(int.parse(price))}',
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 15),
                child: TextView(
                    customColor: ColorConstant.blackColor,
                    value: '\u{20B9}${NumberFormat('##,###,###', 'en_US').format(costPlan.price)}',
                    fontSize: 13,
                    fontWeight: FontWeight.normal)),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextView(
                  customColor: ColorConstant.blackColor,
                  value: 'Per person',
                  fontSize: 10,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 5, bottom: 15),
          child: TextView(
              customColor: ColorConstant.blackColor,
              value: costPlan.description,
              fontSize: 12,
              fontWeight: FontWeight.normal),
        ),
      ],
    ));
  }
}
