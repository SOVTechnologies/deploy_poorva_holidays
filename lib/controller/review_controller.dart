import 'package:get/get.dart';
import 'package:poorvaholiday/remote_services/api.dart';
import 'package:poorvaholiday/remote_services/api_calling.dart';
import 'package:poorvaholiday/models/package_details.dart';
import 'package:poorvaholiday/models/review_response.dart';

class ReviewController extends GetxController {
  List<ReviewResponse> reviewList = <ReviewResponse>[].obs;


  @override
  void onInit() {
    getPackageList();
  }

  getPackageList() {
    ApiCalling().getResponse(Api.mainUrl + Api.reviews).then((value) {
      int code = value.statusCode;
      if (code == 200 || code == 201) {
        reviewList.addAll(reviewResponseFromJson(value.body));
      }
    },);
  }
}
