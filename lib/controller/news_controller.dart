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

class NewsController extends GetxController {


  RxBool status = false.obs;

  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  contactUs(var url, var email) {
    String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    bool emailValid = OtherConstant().emailValid.hasMatch(email);
    if (emailValid) {
      var body = jsonEncode(
        <String, String>{
          'id': getRandomString(4),
          'email': email,
        },
      );
      print(body);
      ApiCalling().postResponse(url, body).then((value) {
        Get.snackbar("Email", value.body,
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
      Get.snackbar("Email", "Invalid Email Address",
          maxWidth: 500,
          backgroundColor: ColorConstant.blueColor,
          colorText: ColorConstant.whiteColor,
          margin: const EdgeInsets.all(20),
          snackPosition: SnackPosition.BOTTOM);
    }

  }
}
