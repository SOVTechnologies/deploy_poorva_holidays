import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/constant/constant_size.dart';
import 'package:poorvaholiday/controller/package_controller.dart';
import 'package:poorvaholiday/controller/top_controller.dart';
import 'package:poorvaholiday/models/packages_list_response.dart';
import 'package:poorvaholiday/screen/tours/tour_suggestions.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';
import 'package:palette_generator/palette_generator.dart';

import '../widgets/custom_divider.dart';

class Tours extends StatefulWidget {
  String name;
  String type;
  EdgeInsets edgeInsets;
  double height;
  CrossAxisAlignment crossAxisAlignment;
  List<PackagesListResponse> tourList;
  Tours({Key? key, required this.crossAxisAlignment,required this.name, required this.type, required this.tourList,required this.edgeInsets, required this.height}) : super(key: key);

  @override
  _ToursState createState() => _ToursState();
}

class _ToursState extends State<Tours> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:widget.crossAxisAlignment ,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: TextView(
                customColor: ColorConstant.blackColor,
                value: widget.name,
                fontSize: 30,
                fontWeight: FontWeight.w600),
          ),
        ),
        CustomDivier(
          edgeInsets: const EdgeInsets.only(left:20,right: 10),
          customColor: ColorConstant.blueColor,
          width: 60,
          height: 3,
        ),
        const SizedBox(height: 20,),
        SizedBox(
          height:widget.height ,
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.tourList.length,
            itemBuilder: (BuildContext context, int index) => Container(
              margin: widget.edgeInsets,
              child: TourSuggestions(
                date: widget.tourList[index].packageStartDate.toString(),
                height: widget.height,
                location: widget.tourList[index].packageCity,
                id: widget.tourList[index].packageId,
                imageName:
                widget.tourList[index].packageThumbailLink,
                initalRating: widget.tourList[index].packageAverageRating.toDouble(),
                packageName:widget.tourList[index].packageTitle,
                price:'\u{20B9} ${NumberFormat('##,###,###', 'en_US').format(widget.tourList[index].packageRatePerPerson)}',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
