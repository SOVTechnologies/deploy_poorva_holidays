import 'package:flutter/cupertino.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/constant/constant_size.dart';
import 'package:poorvaholiday/models/day_activity_response.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

import 'itenerary.dart';

class IteneraryDetails extends StatelessWidget {
  late List<DayActivityResponse> dayActivityResponse;
  IteneraryDetails({Key? key, required this.dayActivityResponse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(ConstantSize().iteneraryContentMargin(context)),
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: dayActivityResponse.length,
        itemBuilder: (BuildContext context, int index) => ItenerarySection(
            attraction: dayActivityResponse[index].attraction,
            note: dayActivityResponse[index].note,
            day: '${dayActivityResponse[index].day}',
            title: dayActivityResponse[index].title,
            desc: ListView.builder(
              itemCount: dayActivityResponse[index].plan.length,
              itemBuilder:(BuildContext context, int innerIndex){
                return TextView(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    value: '${dayActivityResponse[index].plan[innerIndex].startTime}-${dayActivityResponse[index].plan[innerIndex].endTime} : ${dayActivityResponse[index].plan[innerIndex].description}',
                    customColor: ColorConstant.blackColor);
              } ,
            )
        ),
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return GetX<SinglePackgeInfo>(
//     init: SinglePackgeInfo(packageid: '1'),
//     builder: (controller) {
//       return ListView.builder(
//         physics: const ClampingScrollPhysics(),
//         shrinkWrap: true,
//         scrollDirection: Axis.vertical,
//         itemCount: controller.dayActivityResponse.length,
//         itemBuilder: (BuildContext context, int index) => ItenerarySection(
//           attraction: controller.dayActivityResponse[index].attraction,
//           note: controller.dayActivityResponse[index].note,
//           day: '${controller.dayActivityResponse[index].day}',
//           title: controller.dayActivityResponse[index].title,
//           desc: ListView.builder(
//             itemCount: controller.dayActivityResponse[index].plan.length,
//             itemBuilder:(BuildContext context, int innerIndex){
//               return TextView(
//                   fontSize: 12,
//                   fontWeight: FontWeight.normal,
//                   value: '${controller.dayActivityResponse[index].plan[innerIndex].startTime} " ${controller.dayActivityResponse[index].plan[innerIndex].description}',
//                   customColor: ColorConstant.blackColor);
//             } ,
//           )
//         ),
//       );
//     },
//   );
// }