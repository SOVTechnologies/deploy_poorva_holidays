import 'dart:html';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:poorvaholiday/utils/UiFake.dart' as ui;

class Webpayment extends StatelessWidget {
  final double amount;
  final String orderId;
  final String personalName;
  final String personalEmail;
  final String personalMobileNumber;
  final String? redirectLocation;
  const Webpayment({
    Key? key,
    required this.amount,
    required this.orderId,
    required this.personalName,
    required this.personalEmail,
    required this.personalMobileNumber,
    this.redirectLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ui.platformViewRegistry.registerViewFactory("rzp-html", (int viewId) {
      IFrameElement element = IFrameElement();
      window.onMessage.forEach((element) {
        if (element.data == 'MODAL_CLOSED') {
          Fluttertoast.showToast(
            msg: 'Payment failed',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 3,
            textColor: Colors.white,
            webBgColor: 'linear-gradient(to right, #FF0000, #FF0000)',
            fontSize: 16.0,
          );
          Navigator.pop(context);
        } else if (element.data == 'SUCCESS') {
          Fluttertoast.showToast(
            msg: 'Payment success',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 3,
            textColor: Colors.white,
            webBgColor: 'linear-gradient(to right, #4BB543, #4BB543)',
            fontSize: 16.0,
          );
          if (redirectLocation != null) {
            Beamer.of(context).popToNamed(redirectLocation!);
          } else {
            Beamer.of(context).popRoute();
          }
        }
      });

      element.src =
          'assets/html/payment.html?amount=$amount&orderId=$orderId&name=$personalName&email=$personalEmail&mobile=$personalMobileNumber';

      element.style.width = '100%';
      element.style.height = '100%';
      element.style.backgroundColor = '#ffffff';
      element.style.background = '#ffffff';
      element.style.border = 'none';

      return element;
    });
    return Scaffold(body: Builder(builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const HtmlElementView(viewType: 'rzp-html'),
      );
    }));
  }
}
