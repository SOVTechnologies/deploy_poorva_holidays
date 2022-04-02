// ignore_for_file: prefer_const_constructors

import 'package:beamer/beamer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/helpers/Seo/renderers/image_renderer/image_renderer_web.dart';
import 'package:poorvaholiday/helpers/Seo/renderers/link_renderer/link_renderer_web.dart';

import 'package:poorvaholiday/models/packages_list_response.dart';
import 'package:poorvaholiday/routes/routes.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

class TourCard extends StatelessWidget {
  final PackagesListResponse tour;
  const TourCard({
    Key? key,
    required this.tour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          right: 60,
          bottom: 40,
          top: MediaQuery.of(context).size.height * 0.08,
        ),
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            Beamer.of(context).beamToNamed(
                '${Routes.shortpackagesdetails}?id=${tour.packageId}&title=${tour.packageTitle}');
          },
          child: LinkRenderer(
            href:
                '${Routes.shortpackagesdetails}?id=${tour.packageId}&title=${tour.packageTitle}',
            text: 'tour.packageTitle',
            child: Stack(
              children: [
                SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return ImageRenderer(
                        alt: tour.packageTitle,
                        src: tour.packageThumbailLink,
                        child: SizedBox(
                          height: constraints.maxHeight,
                          width: constraints.maxWidth,
                          child: CachedNetworkImage(
                            imageUrl: tour.packageThumbailLink,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.8),
                    ],
                  )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //add price per person to right side
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: ColorConstant.whiteColor.withOpacity(0.45),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: TextView(
                              customColor: ColorConstant.whiteColor,
                              value: '₹ ${tour.packageRatePerPerson}/-',
                              style: TextView.headerStyle(
                                size: 20,
                                weight: FontWeight.w600,
                                color: ColorConstant.blackColor,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Spacer(),
                      TextView(
                          value: tour.packageTitle,
                          style: TextView.headerStyle(
                              color: Colors.white, weight: FontWeight.w600)),
                      RatingBar.builder(
                        initialRating: tour.packageAverageRating.toDouble(),
                        itemCount: 5,
                        glow: true,
                        unratedColor: Colors.white.withOpacity(0.25),
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
                      //add location
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 12,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          TextView(
                              customColor: Colors.white,
                              value: tour.packageCity,
                              fontSize: 10,
                              fontWeight: FontWeight.w300),
                        ],
                      ),
                      // add departure date

                      TextView(
                          customColor: Colors.white,
                          value: ' Departure Date ${tour.packageStartDate}',
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
