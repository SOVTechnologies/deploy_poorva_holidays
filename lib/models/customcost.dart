import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'cost.dart';
class CustomCost{
  late CostPlan costResponse;
  var isSelected = false.obs;

  CustomCost(this.costResponse);
}