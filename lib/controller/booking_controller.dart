import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/models/booking_child_detatils.dart';
import 'package:poorvaholiday/models/booking_extra_bed_detatils.dart';
import 'package:poorvaholiday/models/booking_personal_detatils.dart';
import 'package:poorvaholiday/models/booking_traveler_detatils.dart';
import 'package:poorvaholiday/models/boookinID.dart';
import 'package:poorvaholiday/models/customcost.dart';
import 'package:poorvaholiday/models/order_response.dart';
import 'package:poorvaholiday/remote_services/api.dart';
import 'package:poorvaholiday/remote_services/api_calling.dart';
import 'package:poorvaholiday/routes/routes.dart';
import 'package:poorvaholiday/utils/WebPayment.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookingController extends GetxController {
  final _dataAvailable = false.obs;
  bool get dataAvailable => _dataAvailable.value;

  final _bookingPersonalDetails = BookingPersonalDetails();
  final _bookingTravellerDetails = BookingTravellerDetails();
  final _bookingExtraBedDetails = BookingExtraBedDetails();
  final _bookingChildDetails = BookingChildDetails();

  final _isPaymentGatewayCalled = false.obs;
  bool get isPaymentGatewayCalled => _isPaymentGatewayCalled.value;

  BookingPersonalDetails get bookingPersonalDetails => _bookingPersonalDetails;
  BookingTravellerDetails get bookingTravellerDetails =>
      _bookingTravellerDetails;
  BookingExtraBedDetails get bookingExtraBedDetails => _bookingExtraBedDetails;
  BookingChildDetails get bookingChildDetails => _bookingChildDetails;
  List<String> jsonString = [];
  List<String> costID = [];

  @override
  void onInit() {}

  getBookingID(double totalPrice, String argument, User user, RxList<CustomCost> customCost) {

    DateTime currentDate = new DateTime.now();
    var date = '${currentDate.year}-${currentDate.month}-${currentDate.day}';

    if (customCost[0].isSelected.isTrue) {
      if (bookingPersonalDetails.personalName.trim().isEmpty) {
        snackbar('Enter Name in Personal Detail');
        return;
      }
      if (bookingPersonalDetails.personalGender.trim().isEmpty) {
        snackbar('Select gender in Personal Detail');
        return;
      }
      if (bookingPersonalDetails.personalDOB.trim().isEmpty) {
        snackbar('Enter dob in Personal Detail');
        return;
      }
      if (bookingPersonalDetails.personalEmail.trim().isEmpty) {
        snackbar('Enter email in Personal Detail');
        return;
      }
      if (bookingPersonalDetails.personalPanCard.trim().isEmpty) {
        snackbar('Enter pancard in Personal Detail');
        return;
      }
      if (bookingPersonalDetails.personalMobileNumber.trim().isEmpty) {
        snackbar('Enter mobile number in Personal Detail');
        return;
      }
      if (bookingTravellerDetails.travellerName.trim().isEmpty) {
        snackbar('Enter Name in Traveller Detail');
        return;
      }
      if (bookingTravellerDetails.travellerGender.trim().isEmpty) {
        snackbar('Select Gender in Traveller Detail');
        return;
      }
      if (bookingTravellerDetails.travellerPanCard.trim().isEmpty) {
        snackbar('Enter Pancard in Traveller Detail');
        return;
      }
      if (bookingTravellerDetails.travellerDOB.trim().isEmpty) {
        snackbar('Enter DOB in Traveller Detail');
        return;
      }

      jsonString.add(jsonEncode(bookingPersonalDetails));
      jsonString.add(jsonEncode(bookingTravellerDetails));
    }
    if (customCost[1].isSelected.isTrue) {
      if (bookingExtraBedDetails.extraBedName.trim().isEmpty) {
        snackbar('Enter Name in Extra Bed Detail');
        return;
      }
      if (bookingExtraBedDetails.extraBedGender.trim().isEmpty) {
        snackbar('Select Gender in Extra Bed Detail');
        return;
      }
      if (bookingExtraBedDetails.extraBedDOB.trim().isEmpty) {
        snackbar('Enter DOB in Extra Bed Detail');
        return;
      }
      jsonString.add(jsonEncode(bookingExtraBedDetails));
    }

    if (customCost[2].isSelected.isTrue) {
      if (bookingChildDetails.childName.trim().isEmpty) {
        snackbar('Enter Name in Child Detail');
        return;
      }
      if (bookingChildDetails.childGender.trim().isEmpty) {
        snackbar('Select Gender in Child Detail');
        return;
      }
      if (bookingChildDetails.childDOB.trim().isEmpty) {
        snackbar('Enter DOB in Child Detail');
        return;
      }
      jsonString.add(jsonEncode(bookingChildDetails));
    }

    if (customCost[3].isSelected.isTrue) {
      if (bookingChildDetails.childName.trim().isEmpty) {
        snackbar('Enter Name in Child Detail');
        return;
      }
      if (bookingChildDetails.childGender.trim().isEmpty) {
        snackbar('Select Gender in Child Detail');
        return;
      }
      if (bookingChildDetails.childDOB.trim().isEmpty) {
        snackbar('Enter DOB in Child Detail');
        return;
      }
      jsonString.add(jsonEncode(bookingChildDetails));
    }

    var body =
        '{"booking_payment_status":"created","booking_date":"${date}","booking_rate":$totalPrice,"booking_user_id":"${user.uid}","booking_package_id":"$argument","booking_method":"upi","booking_status":"active",'
        '"booking_guest_details":$jsonString}';

    print(body);
    ApiCalling().postResponse(Api.mainUrl + Api.booking, body).then(
      (value) {
        _isPaymentGatewayCalled.value = true;
        print(value.body);
        int code = value.statusCode;
        if (code == 200 || code == 201) {
          final boookinId = boookinIdFromJson(value.body);
          print(value.body);
          generateOrder(argument, boookinId.bookingId,totalPrice);
        } else {
          snackbar(value.body);
          _isPaymentGatewayCalled.value = false;
        }
      },
    ).whenComplete(() => _dataAvailable.value = true);
  }

  generateOrder(String argument, String boookinId, double totalPrice) {
    var body = '{ "package_id": "${argument}","cost": [1], "booking_id": "${boookinId}"}';
    print('package_id ${body}');

    ApiCalling().postResponse(Api.mainUrl + Api.order, body).then(
      (value) {
        int code = value.statusCode;
        if (code == 200 || code == 201) {
          final orderResponse = orderResponseFromJson(value.body);
          _isPaymentGatewayCalled.value = false;
          Get.toNamed(Routes.razorPay,arguments:[orderResponse.id,bookingPersonalDetails.personalName,
            bookingPersonalDetails.personalEmail,totalPrice.toString(),
            bookingPersonalDetails.personalMobileNumber] );
        } else {
          snackbar(value.body);
        }
      },
    ).whenComplete(() => _dataAvailable.value = true);
  }


  SnackbarController snackbar(String e) {
    return Get.snackbar("Error", e,
        maxWidth: 500,
        backgroundColor: ColorConstant.blueColor,
        colorText: ColorConstant.whiteColor,
        margin: const EdgeInsets.all(20),
        snackPosition: SnackPosition.BOTTOM);
  }


}