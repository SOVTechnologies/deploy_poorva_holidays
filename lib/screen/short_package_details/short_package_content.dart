import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/remote_services/api.dart';
import 'package:poorvaholiday/models/package_details.dart';
import 'package:poorvaholiday/routes/routes.dart';

import 'package:poorvaholiday/screen/widgets/container_button.dart';
import 'package:poorvaholiday/screen/widgets/custom_divider.dart';
import 'package:poorvaholiday/screen/widgets/text_with_Icon.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../packageDetails.dart';

class ShortPackageContent extends StatelessWidget {
  final PackageDetailsResponse packagesDetails;
  const ShortPackageContent({Key? key, required this.packagesDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 90, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              style: TextView.headerStyle(
                size: 30,
                weight: FontWeight.bold,
                color: ColorConstant.blueColor,
              ),
              value:
                  '${packagesDetails.packageTotalDays} days ${packagesDetails.packageTotalNight} in ${packagesDetails.packageTitle}',
            ),
            const SizedBox(height: 5),
            RatingBar.builder(
              initialRating: packagesDetails.packageAverageRating.toDouble(),
              itemCount: 5,
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
            const SizedBox(
              height: 5,
            ),
            CustomDivier(
                width: 150,
                height: 2,
                customColor: ColorConstant.blueColor,
                edgeInsets: EdgeInsets.zero),
            const SizedBox(
              height: 5,
            ),
            TextWithIcon(
                icon: Icons.location_on, title: packagesDetails.packageCity),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: TextView(
                  customColor: ColorConstant.blueColor,
                  value: packagesDetails.packageInfo,
                  fontSize: 13,
                  align: TextAlign.left,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 10,
            ),
            TextWithIcon(
                icon: Icons.family_restroom_sharp,
                title: packagesDetails.packageTheme[0]),
            const SizedBox(height: 10),
            TextWithIcon(
                icon: FontAwesomeIcons.rainbow,
                title: packagesDetails.packageSeason),
            const SizedBox(height: 10),
            TextWithIcon(
                icon: Icons.date_range_outlined,
                title: packagesDetails.packageStartDate),
            const SizedBox(height: 10),
            TextWithIcon(
                icon: Icons.local_activity_outlined,
                title: "No Activity Included"),
            const SizedBox(height: 15),
            Row(
              children: [
                ContainerButton(
                  onTap: () {
                    String url =
                        Api.mainUrl + Api.file + packagesDetails.packageId;
                    _launchURL(url);
                  },
                  title: "Download Boucher",
                  backGroundColor: ColorConstant.orangeColor,
                ),
                SizedBox(
                  width: 20,
                ),
                ContainerButton(
                    onTap: () {
                      Beamer.of(context).beamToNamed(
                          '${Routes.packagesdetails}?id=${packagesDetails.packageId}&title=${packagesDetails.packageTitle}');
                    },
                    title: "Details Itinerary",
                    backGroundColor: ColorConstant.blueColor),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
