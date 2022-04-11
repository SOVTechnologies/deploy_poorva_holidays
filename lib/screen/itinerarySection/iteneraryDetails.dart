import 'package:flutter/cupertino.dart';

import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/constant/constant_size.dart';
import 'package:poorvaholiday/models/day_activity_response.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

import 'itenerary.dart';

class IteneraryDetails extends StatelessWidget {
  late List<DayActivityResponse> dayActivityResponse;
  IteneraryDetails({Key? key, required this.dayActivityResponse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: dayActivityResponse.length,
        itemBuilder: (BuildContext context, int index) =>
            buildItem(context, index),
      ),
    );
  }

  Widget buildItem(BuildContext context, int index) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.4,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            if (index.isEven) ...[
              Expanded(
                  child: DayView(
                day: dayActivityResponse[index].day.toString(),
              )),
              Expanded(
                  child: Column(
                children: [
                  TextView(
                      style: TextView.headerStyle(
                        size: 20,
                        weight: FontWeight.bold,
                        color: ColorConstant.blueColor,
                      ),
                      align: TextAlign.right,
                      value: dayActivityResponse[index].title,
                      customColor: ColorConstant.blackColor),
                  const SizedBox(height: 10),
                  Expanded(
                      child: TextView(
                    style: TextView.defaultStyle(
                      size: 16,
                      color: ColorConstant.blackColor,
                    ),
                    value: dayActivityResponse[index]
                        .plan
                        .map(
                            (e) => '${e.startTime}${e.endTime}${e.description}')
                        .toList()
                        .join('\n'),
                    customColor: ColorConstant.blackColor,
                  ))
                ],
              )),
            ],
            if (index.isOdd) ...[
              Expanded(
                  child: Column(
                children: [
                  TextView(
                      style: TextView.headerStyle(
                        size: 20,
                        weight: FontWeight.bold,
                        color: ColorConstant.blueColor,
                      ),
                      value: dayActivityResponse[index].title,
                      customColor: ColorConstant.blackColor),
                  const SizedBox(height: 10),
                  Expanded(
                      child: TextView(
                    style: TextView.defaultStyle(
                      size: 16,
                      color: ColorConstant.blackColor,
                    ),
                    value: dayActivityResponse[index]
                        .plan
                        .map(
                            (e) => '${e.startTime}${e.endTime}${e.description}')
                        .toList()
                        .join('\n'),
                    customColor: ColorConstant.blackColor,
                  ))
                ],
              )),
              Expanded(
                  child: DayView(
                day: dayActivityResponse[index].day.toString(),
              )),
            ]
          ],
        ));
  }
}

class DayView extends StatelessWidget {
  final String day;
  const DayView({
    Key? key,
    required this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 60,
          child: TextView(
            fontSize: 60,
            fontWeight: FontWeight.bold,
            value: 'DAY',
            customColor: ColorConstant.blueColor.withOpacity(0.4),
          ),
        ),
        Positioned(
          top: 10,
          left: 140,
          child: TextView(
            fontSize: 120,
            fontWeight: FontWeight.bold,
            value: day,
            customColor: ColorConstant.blueColor,
          ),
        ),
      ],
    );
  }
}


// ItenerarySection(
//             attraction: dayActivityResponse[index].attraction,
//             note: dayActivityResponse[index].note,
//             day: '${dayActivityResponse[index].day}',
//             title: dayActivityResponse[index].title,
//             // desc: Text('')
//             desc: ListView.builder(
//               itemCount: dayActivityResponse[index].plan.length,
//               itemBuilder: (BuildContext context, int innerIndex) {
//                 return TextView(
//                     fontSize: 13,
//                     fontWeight: FontWeight.normal,
//                     value:
//                         '${dayActivityResponse[index].plan[innerIndex].startTime}${dayActivityResponse[index].plan[innerIndex].endTime}${dayActivityResponse[index].plan[innerIndex].description}',
//                     customColor: ColorConstant.blackColor);
//               },
//             )),
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