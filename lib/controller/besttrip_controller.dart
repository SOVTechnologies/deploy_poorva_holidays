import 'dart:async';

import 'package:get/get.dart';
import 'package:poorvaholiday/models/best_trip.dart';
import 'package:poorvaholiday/remote_services/api.dart';
import 'package:poorvaholiday/remote_services/api_calling.dart';
import 'package:poorvaholiday/models/banner_response.dart';

class BestTripController extends GetxController {
  var besttrip;
  BesttripResponse get bestTrip => besttrip;

  final _dataAvailable = false.obs;
  bool get dataAvailable => _dataAvailable.value;

  @override
  void onInit() {
    getBannerList();
  }

  getBannerList() {
    ApiCalling()
        .getResponse(Api.mainUrl + Api.bestTrip)
        .whenComplete(
          () => Timer(
            Duration(seconds: 3),
            () async {
              _dataAvailable.value = true;
            },
          ),
        )
        .then(
      (value) {
        int code = value.statusCode;
        if (code == 200 || code == 201) {
          besttrip = besttripResponseFromJson(value.body);
        }
      },
    );
  }
}
