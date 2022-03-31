import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:poorvaholiday/models/price.dart';

class PriceController extends GetxController {



  int counter = -1;

  void setSelcetion(int selection) {
    counter =selection;
    update(); // look here!
  }

}
