import 'package:beamer/beamer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/routes/routes.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

class HotelSuggestions extends StatefulWidget {
  String imageName;
  String packageName;
  double initalRating;
  String id;
  String price;
  String location;
  double height;
  String date;

  HotelSuggestions(
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
  _HotelSuggestionsState createState() => _HotelSuggestionsState();
}

class _HotelSuggestionsState extends State<HotelSuggestions> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            print(widget.id);
            Beamer.of(context).beamToNamed(
                '${Routes.shortpackagesdetails}?id=${widget.id}&title=${widget.packageName}');
          },
          child: Container(
            margin: const EdgeInsets.only(
              bottom: 20,
              top: 20,
              right: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Stack(
              children: [
                SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: widget.imageName,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(0.3),
                          Colors.transparent,
                          Colors.transparent,
                        ]),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.packageName,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
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
                        widget.date.isNotEmpty
                            ? TextView(
                                customColor: ColorConstant.whiteColor,
                                value: widget.date,
                                fontSize: 10,
                                fontWeight: FontWeight.w300)
                            : Container(),
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
                      ]),
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 80,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.0)),
                          color: ColorConstant.blueColor),
                      child: TextView(
                          customColor: ColorConstant.whiteColor,
                          value: widget.price,
                          fontSize: 10,
                          fontWeight: FontWeight.normal),
                    ))
              ],
            ),
          ),
        ));
  }
}
