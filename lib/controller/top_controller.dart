import 'dart:async';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:poorvaholiday/remote_services/api.dart';
import 'package:poorvaholiday/remote_services/api_calling.dart';
import 'package:poorvaholiday/models/packages_list_response.dart';

class TopController extends GetxController {
  List<PackagesListResponse> domestic = <PackagesListResponse>[].obs;
  List<PackagesListResponse> internationals = <PackagesListResponse>[].obs;
  List<PackagesListResponse> offer = <PackagesListResponse>[].obs;
  List<PackagesListResponse> top = <PackagesListResponse>[].obs;

  final _dataAvailable = false.obs;
  bool get dataAvailable => _dataAvailable.value;

  @override
  void onInit() {
    getPackageList();
    gettopPackageList();
  }

  gettopPackageList() {
    ApiCalling().getResponse(Api.mainUrl + Api.top).then(
      (value) {
        int code = value.statusCode;
        if (code == 200 || code == 201) {
          List<PackagesListResponse> packageList = packagesListResponseFromJson(value.body);
          top.addAll(packageList);
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

  void getPackageList() {
    ApiCalling().getResponse(Api.mainUrl + Api.allPackage).then(
          (value) {
        int code = value.statusCode;
        if (code == 200 || code == 201) {
          List<PackagesListResponse> packageList = packagesListResponseFromJson(value.body);
          packageList.forEach((element) {
              if (element.packageLocation == 'International') {
                internationals.add(element);
              } else if (element.packageLocation == 'Domestic') {
                domestic.add(element);
              } else {
                offer.add(element);
              }
            },
          );
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
