import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/constant/firebase_constants.dart';
import 'package:poorvaholiday/constant/other_constant.dart';
import 'package:poorvaholiday/models/about_us.dart';
import 'package:poorvaholiday/remote_services/api.dart';
import 'package:poorvaholiday/remote_services/api_calling.dart';

class ContactUsController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController emailId = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController message = TextEditingController();

  RxBool status = false.obs;

  // final _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  // final Random _rnd = Random();
  // String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
  //     length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  var url = Api.mainUrl + Api.contact;

  contactUs() {
    bool emailValid = OtherConstant().emailValid.hasMatch(emailId.text);
    var body = jsonEncode(
      <String, String>{
        'name': name.text,
        'email_id': emailId.text,
        'phone_number': mobileNumber.text,
        'location': location.text,
        'message': message.text,
      },
    );

    if (name.text.isEmpty ||
        emailValid ||
        mobileNumber.text.isEmpty ||
        location.text.isEmpty ||
        message.text.isEmpty)
    {
      ApiCalling().postResponse(url, body).then((value) {
        name.text = "";
        emailId.text = "";
        mobileNumber.text = "";
        location.text = "";
        message.text = "";

        Get.snackbar("Success", value.body,
            maxWidth: 500,
            backgroundColor: ColorConstant.blueColor,
            colorText: ColorConstant.whiteColor,
            margin: const EdgeInsets.all(20),
            snackPosition: SnackPosition.BOTTOM);
      }).onError((error, stackTrace) {
        Get.snackbar("Error", error.toString(),
            maxWidth: 500,
            backgroundColor: ColorConstant.blueColor,
            colorText: ColorConstant.whiteColor,
            margin: const EdgeInsets.all(20),
            snackPosition: SnackPosition.BOTTOM);
      });
    } else {
      Get.snackbar("Error", "Enter Valid Email",
          maxWidth: 500,
          backgroundColor: ColorConstant.blueColor,
          colorText: ColorConstant.whiteColor,
          margin: const EdgeInsets.all(20),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}