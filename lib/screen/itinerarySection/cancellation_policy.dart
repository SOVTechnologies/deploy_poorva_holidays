import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/controller/single_package_info.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

class CancellationPolicy extends StatelessWidget {
  List<String> packageCancellationPolicy;
   CancellationPolicy({Key? key, required this.packageCancellationPolicy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(50),
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: packageCancellationPolicy.length,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextView(
              fontSize: 13,
              fontWeight: FontWeight.normal,
              value: '• ${packageCancellationPolicy[index]}',
              customColor: ColorConstant.blackColor),
        ),
      ),
    );
  }
}
