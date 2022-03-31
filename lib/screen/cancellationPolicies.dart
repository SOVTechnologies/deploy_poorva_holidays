import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

import '../constant/color_constant.dart';

class CancellationPolicies extends StatelessWidget {
  const CancellationPolicies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  value: 'Cancellation & Refund Policies - Poorva Holidays',
                  customColor: ColorConstant.blueColor),
              const SizedBox(height: 8),
              TextView(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  value:
                  'If the Guest decides to cancel the tour for any reason whatsoever then he/she shall give a written application to the company within specified time limit along with original receipt issued by the Company. Such cancellatin will attract Cancellation charges stated hereunder.\nCancellation charges will be calculated on gross tour cost and the cancellation charges shall depend on date of departure and date of cancellation.\n\nCancellation charges for any type of transport ticket are applicable as per the rules of the concerned authority.\n\nAir tickets issued on special fares are NON REFUNDABLE and Guest shall bear cancellation charges.\n\nAny refund payable to the Guest will be paid after the Company recieves refund from the respective authorities. The Company deducts processing charges from the refund to be paid to Guest.',
                  customColor: ColorConstant.blueColor),
              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}
