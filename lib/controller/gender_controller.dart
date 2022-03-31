import 'package:get/get.dart';

class GenderController extends GetxController{

  var userSelectedGender = "Male";
  List<String> spinnerItems = ['Select Gender', 'Male', 'Female'].obs;

}