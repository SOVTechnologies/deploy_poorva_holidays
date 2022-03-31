import 'package:get/get.dart';
import 'package:poorvaholiday/models/about_us.dart';
import 'package:poorvaholiday/remote_services/api.dart';
import 'package:poorvaholiday/remote_services/api_calling.dart';

class ProfileController extends GetxController {

  var i =0.obs;

  final _dataAvailable = false.obs;
  bool get dataAvailable => _dataAvailable.value;


  @override
  void onInit() {

  }

  void onClick(int selection){
    i.value = selection;
    update();
  }
}
