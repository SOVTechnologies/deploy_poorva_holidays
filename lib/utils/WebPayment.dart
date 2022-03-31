import 'dart:html';
import 'dart:ui' as ui;
// import 'package:autofystore/utils/UiFake.dart' if (dart.library.html) 'dart:ui'
//     as ui;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/routes/routes.dart';

class RazorPayWeb extends StatelessWidget {
  RazorPayWeb();

  var arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    ui.platformViewRegistry.registerViewFactory("rzp-html", (int viewId) {
      IFrameElement element = IFrameElement();
      window.onMessage.forEach((element) {
        print('Event Received in callback: ${element.data}');
        if (element.data == 'MODAL_CLOSED') {
          Navigator.pop(context);
        } else if (element.data == 'SUCCESS') {
          Get.defaultDialog(
              title: "Payment",
              middleText: "Payment Successful",
              confirmTextColor: ColorConstant.whiteColor,
              onConfirm: () {
                Get.toNamed(Routes.home);
              });
        }
      });
      element.requestFullscreen();
      element.src =
          'assets/html/payment.html?orderId=${arguments[0]}&name=${arguments[1]}&email=${arguments[2]}&amount=${arguments[3]}&mobile=${arguments[4]}';
      element.style.border = 'none';
      return element;
    });
    return Scaffold(body: Builder(builder: (BuildContext context) {
      return Container(
        child: HtmlElementView(viewType: 'rzp-html'),
      );
    }));
  }
}
