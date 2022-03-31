import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ChildController extends GetxController{

  var userSelectedGender = "Male";
  List<String> spinnerItems = ['Male','Female'].obs;

  void setselectioin(String userSelection){
    userSelectedGender = userSelection;
    update();
  }

  String name = "";
  void setname(String val) {
    name = val;
    update();
  }

  String dob ="";
  void setDob(String val) {
    dob = val;
    update();
  }
}

