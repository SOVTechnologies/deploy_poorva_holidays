import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:poorvaholiday/remote_services/api.dart';
import 'package:poorvaholiday/remote_services/api_calling.dart';
import 'package:poorvaholiday/models/banner_response.dart';

class BannerController extends GetxController {
  late PaletteColor paletteColor;
  List<Color> palleteColor = <Color>[].obs;

  final _dataAvailable = false.obs;
  bool get isBannerDataAvailable => _dataAvailable.value;

  var bannerresponse;
  BannerResponse get bannerResponse => bannerresponse;

  final swiperIndex = 0.obs;
  int get swiperIndexs => swiperIndex.value;

  updateIndex(int i) {
    swiperIndex.value = i;
  }

  @override
  void onInit() {
    getBannerList();
  }

  getBannerList() {
    ApiCalling().getResponse(Api.mainUrl + Api.banner).then(
      (value) {
        int code = value.statusCode;
        if (code == 200 || code == 201) {
          bannerresponse = bannerResponseFromJson(value.body);
          bannerResponse.data.forEach((element) async {

          });
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
