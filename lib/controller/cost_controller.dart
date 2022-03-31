import 'package:get/get.dart';
import 'package:poorvaholiday/models/cost.dart';
import 'package:poorvaholiday/models/customcost.dart';
import 'package:poorvaholiday/remote_services/api.dart';
import 'package:poorvaholiday/remote_services/api_calling.dart';
import 'package:poorvaholiday/models/hotel_response.dart';
import 'package:poorvaholiday/models/package_details.dart';

class CostController extends GetxController {
  String costID;
  CostController({required this.costID});

  final _listItem = false.obs;
  bool get dataAvailable => _dataAvailable.value;

  final _dataAvailable = false.obs;
  bool get listItem => _listItem.value;

  var costresponse;
  CostResponse get costResponse => costresponse;
  var customCost = <CustomCost>[].obs;

  double get totalPrice => customCost.fold(0, (sum, item) {
    if(item.isSelected ==true){
      sum =  sum + item.costResponse.price;
    }
    return sum;
  });

  @override
  void onInit() {
    getPackageList();
  }

  getPackageList() {
    ApiCalling().getResponse(Api.mainUrl + Api.cost+'${costID}').then((value) {
      costresponse = costResponseFromJson(value.body);
      costResponse.costPlan.forEach((element) {
        customCost.add(CustomCost(element));
      });
      },
    ).whenComplete(() => _dataAvailable.value = true);
  }
}
