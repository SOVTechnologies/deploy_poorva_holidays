import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/constant/constant_size.dart';
import 'package:poorvaholiday/controller/package_controller.dart';
import 'package:poorvaholiday/controller/top_controller.dart';
import 'package:poorvaholiday/models/packages_list_response.dart';
import 'package:poorvaholiday/screen/tours/tour_suggestions.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';
import 'package:palette_generator/palette_generator.dart';

import '../widgets/custom_divider.dart';
import '../widgets/imagedecoration.dart';

class OfferSections extends StatefulWidget {
  String name;
  String type;
  EdgeInsets edgeInsets;
  double height;
  CrossAxisAlignment crossAxisAlignment;
  List<String> tourList;
  OfferSections({Key? key, required this.crossAxisAlignment,required this.name, required this.type, required this.tourList,required this.edgeInsets, required this.height}) : super(key: key);

  @override
  _OfferSectionsState createState() => _OfferSectionsState();
}

class _OfferSectionsState extends State<OfferSections> {
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

        SizedBox(height: 20,),
        SizedBox(
          height:widget.height ,
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.tourList.length,
            itemBuilder: (BuildContext context, int index) => MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                margin: widget.edgeInsets,
                child: ContainerImageDecorations(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  imageName: widget.tourList[index],
                  opacity: 0.5,
                  width: ConstantSize().getTourWidht(context),
                  height: widget.height,
                  child: Text(""),

                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
