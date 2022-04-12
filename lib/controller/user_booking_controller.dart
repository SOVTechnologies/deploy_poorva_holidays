import 'dart:async';

import 'package:get/get.dart';
import 'package:poorvaholiday/models/about_us.dart';
import 'package:poorvaholiday/models/userbooking.dart';
import 'package:poorvaholiday/remote_services/api.dart';
import 'package:poorvaholiday/remote_services/api_calling.dart';

class UserBookingController extends GetxController {
  final _dataAvailable = false.obs;
  bool get dataAvailable => _dataAvailable.value;
  late List<Userbooking> userbooking;
  getAllBooking(var bookingID) {
    var url = Api.mainUrl + Api.booking + '/$bookingID';
    print("Obje : ${url}");
    ApiCalling().getResponse(url).then((value) {
      userbooking = userbookingFromJson(value.body);
      _dataAvailable.value = true;
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
    });
  }
}
