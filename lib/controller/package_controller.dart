import 'dart:async';

import 'package:get/get.dart';
import 'package:poorvaholiday/remote_services/api.dart';
import 'package:poorvaholiday/remote_services/api_calling.dart';
import 'package:poorvaholiday/models/package_details.dart';

class PackageController extends GetxController {
  List<PackageDetailsResponse> packagesDetails = <PackageDetailsResponse>[].obs;

  @override
  void onInit() {
    getPackageList();
  }

  final _dataAvailable = false.obs;
  bool get dataAvailable => _dataAvailable.value;

  getPackageList() {
    ApiCalling().getResponse(Api.mainUrl + Api.allPackage).then(
      (value) {
        int code = value.statusCode;
        if (code == 200 || code == 201) {
          packagesDetails.add(packageDetailsResponseFromJson(value.body));
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
