import 'dart:async';

import 'package:get/get.dart';
import 'package:poorvaholiday/models/about_us.dart';
import 'package:poorvaholiday/remote_services/api.dart';
import 'package:poorvaholiday/remote_services/api_calling.dart';

class AboutUsController extends GetxController {

  final _dataAvailable = false.obs;
  bool get dataAvailable => _dataAvailable.value;

  List<AboutUsResponse> aboutUs = <AboutUsResponse>[].obs;
  @override
  void onInit() {
    getBannerList();
  }

  getBannerList() {
    ApiCalling().getResponse(Api.mainUrl + Api.about).then(
      (value) {
        int code = value.statusCode;
        if (code == 200 || code == 201) {
          var aboutUsFrom = aboutUsFromJson(value.body);
          aboutUs.addAll(aboutUsFrom);
        }
      },
    ).whenComplete(
          () => Timer(
        Duration(seconds: 3),
            () async {
          _dataAvailable.value = true;
        },
      ),
    );
  }
}
