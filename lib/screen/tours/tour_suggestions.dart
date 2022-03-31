import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/constant/constant_size.dart';
import 'package:poorvaholiday/routes/routes.dart';
import 'package:poorvaholiday/screen/packageDetails.dart';
import 'package:poorvaholiday/screen/widgets/container_radius_boxdecorations.dart';
import 'package:poorvaholiday/screen/widgets/imagedecoration.dart';
import 'package:poorvaholiday/screen/widgets/price_design.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';
import 'package:poorvaholiday/utils/responsive.dart';

class TourSuggestions extends StatefulWidget {
  String imageName;
  String packageName;
  double initalRating;
  String id;
  String price;
  String location;
  double height;
  String date;

  TourSuggestions(

      {Key? key,
        required this.date,
      required this.height,
      required this.location,
      required this.id,
      required this.imageName,
      required this.initalRating,
      required this.packageName,
      required this.price})
      : super(key: key);

  @override
  _TourSuggestionsState createState() => _TourSuggestionsState();
}

class _TourSuggestionsState extends State<TourSuggestions> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
       cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.shortpackagesdetails, arguments: widget.id);
        },
        child: ContainerImageDecorations(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          imageName: widget.imageName,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: ContainerBoxradiusDecorations(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: ColorConstant.whiteColor,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextView(
                                customColor: ColorConstant.whiteColor,
                                value: widget.location,
                                fontSize: 10,
                                fontWeight: FontWeight.w300),
                          ],
                        ),
                        widget.date.isNotEmpty ?TextView(
                            customColor: ColorConstant.whiteColor,
                            value: widget.date,
                            fontSize: 10,
                            fontWeight: FontWeight.w300):Container(),
                        RatingBar.builder(
                          initialRating: widget.initalRating,
                          itemCount: widget.initalRating.toInt(),
                          glow: true,
                          itemSize: 15.0,
                          allowHalfRating: true,
                          updateOnDrag: false,
                          itemBuilder: (BuildContext context, int index) {
                            return Icon(
                              Icons.star,
                              color: ColorConstant.orangeColor,
                            );
                          },
                          onRatingUpdate: (double value) {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: PriceDesign(
                  price: widget.price,
                  bottomLeft: 20.0,
                  bottomRight: 0.0,
                  topRight: 20.0,
                  topLeft: 0.0,
                ),
              )
            ],
          ),
          opacity: 0.3,
          width: ConstantSize().getTourWidht(context),
          height: widget.height,
        ),
      ),
    );
  }
}
