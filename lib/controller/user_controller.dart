import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/constant/firebase_constants.dart';
import 'package:poorvaholiday/models/poorvauser.dart';
import 'package:poorvaholiday/models/user.dart';
import 'package:poorvaholiday/remote_services/api.dart';
import 'package:poorvaholiday/remote_services/api_calling.dart';

import 'auth_controller.dart';

class UserController extends GetxController {

  TextEditingController myDate = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController emailID = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController panNumber = TextEditingController();
  TextEditingController adhaarNumber = TextEditingController();
  TextEditingController passportNumber = TextEditingController();
  TextEditingController drivingLicense = TextEditingController();
  AuthController authController = Get.put(AuthController());


  late GetUser user;
  final _userDataAvailable = false.obs;
  bool get isUserDataAvailable => _userDataAvailable.value;

  RxBool status = false.obs;

  var _userSelectedGender;
  get userSelectedGender => _userSelectedGender;

  set userSelectedGender(value) {
    _userSelectedGender = value;
  }

  final _dataAvailable = false.obs;
  bool get isBannerDataAvailable => _dataAvailable.value;


  getUserByID(String id) {
    if(auth.currentUser.isNull){
      emailID.text = '';
    }else{
      emailID.text = authController.firebaseUser.value!.email.toString();
    }

    // userController.emailID
    ApiCalling().getResponse(Api.mainUrl + Api.user + '/${id}').then(
      (value) {
        code = value.statusCode;
        user = getUserFromJson(value.body);
        firstName.text =user.userName;
        myDate.text =user.userDob.toString();
        mobileNumber.text =user.userPhone.toString();

        city.text =user.userCity;

        //update();
      },
    ).onError((error, stackTrace) {
      snackbar(error);
    });
  }

  int code = 0;
  void createUser(PoorvaUser poorvaUser) {
    if (auth != null) {
      poorvaUser.id = auth.currentUser!.uid;
      if (poorvaUser.name.toString().isEmpty) {
        snackbar("Please enter name!!!");
        return;
      }
      if (poorvaUser.phone.toString().isEmpty) {
        snackbar("Please enter phone number!!!");
        return;
      }
      if (poorvaUser.name.toString().isEmpty) {
        snackbar("Please enter name!!!");
        return;
      }
      if (poorvaUser.dob.toString().isEmpty) {
        snackbar("Please enter DOB!!!");
        return;
      }
      if (poorvaUser.gender == null ||
          poorvaUser.gender.toString().isEmpty ||
          poorvaUser.gender.toString() == 'Select Gender') {
        snackbar("Please select gender!!!");
        return;
      }
      if (poorvaUser.city.toString().isEmpty) {
        snackbar("Please enter city!!!");
        return;
      }
      if (poorvaUser.country.toString().isEmpty) {
        snackbar("Please select country!!!");
        return;
      }

      var body = jsonEncode(poorvaUser);
      print(body);

      ApiCalling().postResponse(Api.mainUrl + Api.user, body).then(
        (value) {
          code = value.statusCode;
          print('code $code');
        },
      ).whenComplete(
        () => Timer(
          Duration(seconds: 3),
          () async {
            if (code == 200 || code == 201) {
              _dataAvailable.value = true;
            } else {
              _dataAvailable.value = false;
            }
          },
        ),
      );
    } else {
      snackbar("Please login or register!!!");
    }
  }

  SnackbarController snackbar(var message) {
    return Get.snackbar("Info", message,
        maxWidth: 500,
        backgroundColor: ColorConstant.blueColor,
        colorText: ColorConstant.whiteColor,
        margin: const EdgeInsets.all(20),
        snackPosition: SnackPosition.BOTTOM);
  }

  int age =0;
  DateTime currentDate = DateTime.now();
  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(5050));
    if (pickedDate != null && pickedDate != currentDate) {
      myDate.text =
      '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
      age = currentDate.year - pickedDate.year;
    }
  }
  // contactUs(var url, var email) {
  //   bool emailValid = OtherConstant().emailValid.hasMatch(email);
  //   if (emailValid) {
  //     var body = jsonEncode(
  //       <String, String>{
  //         'id': 'email3',
  //         'email': email.text,
  //       },
  //     );
  //     return ApiCalling().postResponse(url, body);
  //   }
  //   return Get.snackbar("Email", "Invalid Email Address",
  //       maxWidth: 500,
  //       backgroundColor: ColorConstant.blueColor,
  //       colorText: ColorConstant.whiteColor,
  //       margin: const EdgeInsets.all(20),
  //       snackPosition: SnackPosition.BOTTOM);
  // }
}
