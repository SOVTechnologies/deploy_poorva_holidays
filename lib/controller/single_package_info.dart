import 'dart:async';

import 'package:get/get.dart';
import 'package:poorvaholiday/models/cost.dart';
import 'package:poorvaholiday/models/customcost.dart';
import 'package:poorvaholiday/models/day_activity_response.dart';
import 'package:poorvaholiday/remote_services/api.dart';
import 'package:poorvaholiday/remote_services/api_calling.dart';
import 'package:poorvaholiday/models/hotel_response.dart';
import 'package:poorvaholiday/models/package_details.dart';

class SinglePackgeInfo extends GetxController {
  String packageid;
  SinglePackgeInfo({required this.packageid});

  List<HotelResponse> hotelList = <HotelResponse>[].obs;
  List<DayActivityResponse> dayActivityResponse = <DayActivityResponse>[].obs;
  List<CustomCost> customCost = <CustomCost>[].obs;

  late PackageDetailsResponse _packageDetailsResponse;
  PackageDetailsResponse get packageDetailsResponse => _packageDetailsResponse;

  var costresponse;
  CostResponse get costResponse => costresponse;

  final _dataAvailable = false.obs;
  bool get dataAvailable => _dataAvailable.value;

  @override
  void onInit() {
    getPackageList();
  }

  getPackageList() {
    ApiCalling()
        .getResponse(Api.mainUrl + Api.singlePackage + '${packageid}')
        .then(
      (value) {
        int code = value.statusCode;
        if (code == 200 || code == 201) {
          _packageDetailsResponse = packageDetailsResponseFromJson(value.body);

          _packageDetailsResponse.packageHotel.forEach((element) {
            ApiCalling()
                .getResponse(Api.mainUrl + Api.hotel + '$element')
                .then((value) {
              hotelList.add(hotelResponseFromJson(value.body));
            });
          });
          _packageDetailsResponse.dayActivites.forEach((element) {
            ApiCalling()
                .getResponse(Api.mainUrl + Api.activity + '$element')
                .then((value) {
              DayActivityResponse dayActivity =
                  dayActivityResponseFromJson(value.body);
              dayActivityResponse.add(dayActivity);
              dayActivityResponse.sort((a, b) => a.day.compareTo(b.day));
            });
          });

          ApiCalling()
              .getResponse(
                  Api.mainUrl + Api.cost + _packageDetailsResponse.packageCost)
              .then((value) {
            costresponse = costResponseFromJson(value.body);
          });
        }
      }, //
    ).whenComplete(() {

      print('dayActivityResponse : {$dayActivityResponse}');
      Timer(
        Duration(seconds: 1),
        () async {
          _dataAvailable.value = true;
        },
      );
    });
  }
}
