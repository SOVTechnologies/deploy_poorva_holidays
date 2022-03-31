import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ExtraBedController extends GetxController {
  var userSelectedGender = "Male";
  List<String> spinnerItems = ['Male', 'Female'].obs;

  void setselection(String userSelection) {
    userSelectedGender = userSelection;
    update();
  }

  String fname = "";
  void setFname(String val) {
    fname = val;
    update();
  }

  String lname = "";
  void setLname(String val) {
    lname = val;
    update();
  }

  String panCard ="";
  void setPancard(String val) {
    panCard = val;
    update();
  }

}
