import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:poorvaholiday/remote_services/api.dart';
import 'package:poorvaholiday/remote_services/api_calling.dart';

class DownloadBroucher extends GetxController {

  Future downloadBroucher(var url) {
    return ApiCalling()
        .getResponse(Api.mainUrl + Api.file + url)
        .then((value) {});
  }
}
