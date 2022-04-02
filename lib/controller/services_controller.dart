import 'package:get/get.dart';
import 'package:poorvaholiday/models/services_response.dart';
import 'package:poorvaholiday/remote_services/api.dart';
import 'package:poorvaholiday/remote_services/api_calling.dart';
import 'package:poorvaholiday/models/package_details.dart';

class ServiceController extends GetxController {
  RxBool isLoading = false.obs;
  List<ServicesResponse> servicesDetails = <ServicesResponse>[].obs;

  @override
  void onInit() {
    getPackageList();
  }

  getPackageList() {
    isLoading.value = true;
    ApiCalling().getResponse(Api.mainUrl + Api.services).then(
      (value) {
        int code = value.statusCode;
        if (code == 200 || code == 201) {
          servicesDetails.addAll(servicesResponseFromJson(value.body));
          isLoading.value = false;
        }
      },
    );
  }
}
