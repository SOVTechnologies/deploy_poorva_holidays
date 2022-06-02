import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/models/booking_child_detatils.dart';
import 'package:poorvaholiday/models/booking_extra_bed_detatils.dart';
import 'package:poorvaholiday/models/booking_personal_detatils.dart';
import 'package:poorvaholiday/models/booking_traveler_detatils.dart';
import 'package:poorvaholiday/models/boookinID.dart';
import 'package:poorvaholiday/models/customcost.dart';
import 'package:poorvaholiday/models/order_response.dart';
import 'package:poorvaholiday/payment/payment.dart';
import 'package:poorvaholiday/remote_services/api.dart';
import 'package:poorvaholiday/remote_services/api_calling.dart';

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

  getBookingID(double totalPrice, String argument, User user,
      RxList<CustomCost> customCost, BuildContext context,
      {String? redirectLocation}) async {
    if (costID.isEmpty && customCost[0].isSelected.isFalse) {
      snackbar(
        'Please select one package to proceed',
      );
      return;
    }

    DateTime currentDate = DateTime.now();
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
        '{"booking_payment_status":"created","booking_date":"$date","booking_rate":$totalPrice,"booking_user_id":"${user.uid}","booking_package_id":"$argument","booking_method":"upi","booking_status":"active",'
        '"booking_guest_details":$jsonString}';

    // print(body);
    await ApiCalling().postResponse(Api.mainUrl + Api.booking, body).then(
      (value) {
        _isPaymentGatewayCalled.value = true;

        int code = value.statusCode;
        if (code == 200 || code == 201) {
          final boookinId = boookinIdFromJson(value.body);

          generateOrder(argument, boookinId.bookingId, totalPrice, context,
              redirectLocation: redirectLocation);
        } else {
          snackbar(value.body);
          _isPaymentGatewayCalled.value = false;
        }
      },
    ).whenComplete(() => _dataAvailable.value = true);
  }

  generateOrder(String argument, String boookinId, double totalPrice,
      BuildContext context,
      {String? redirectLocation}) async {
    var body =
        '{ "package_id": "$argument","cost": [1], "booking_id": "$boookinId"}';
    // print('package_id ${body}');

    await ApiCalling().postResponse(Api.mainUrl + Api.order, body).then(
      (value) {
        int code = value.statusCode;
        if (code == 200 || code == 201) {
          final orderResponse = orderResponseFromJson(value.body);

          _isPaymentGatewayCalled.value = false;
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Webpayment(
                    amount: 1,
                    orderId: orderResponse.id,
                    personalEmail: bookingPersonalDetails.personalEmail,
                    personalMobileNumber:
                        bookingPersonalDetails.personalMobileNumber,
                    personalName: bookingPersonalDetails.personalName,
                    redirectLocation: redirectLocation,
                  )));
        } else {
          snackbar(value.body);
          _isPaymentGatewayCalled.value = false;
        }
      },
    ).whenComplete(() => _dataAvailable.value = true);
  }

  snackbar(String e) {
    Fluttertoast.showToast(
      msg: e,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      textColor: Colors.white,
      webBgColor: 'linear-gradient(to right, #FF0000, #FF0000)',
      fontSize: 16.0,
    );
  }
}
