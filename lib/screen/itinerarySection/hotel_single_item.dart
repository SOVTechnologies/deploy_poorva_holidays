import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/constant/constant_size.dart';
import 'package:poorvaholiday/screen/widgets/imagedecoration.dart';
import 'package:poorvaholiday/screen/widgets/text_with_Icon.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

class HotelSingleItem extends StatelessWidget {
  String imageName;
  String hotelName;
  String stayinHotel;
  String transport;
  String hotelType;
  Color myColor;
  double hotelRating;
  List<String> hotel_gallery_link;
  HotelSingleItem(
      {Key? key,
      required this.hotelRating,
      required this.imageName,
      required this.hotelName,
      required this.stayinHotel,
      required this.transport,
      required this.hotelType,
      required this.myColor,
      required this.hotel_gallery_link})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContainerImageDecorations(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              opacity: 0,
              width: ConstantSize().getHotelInfoSingleItem(context),
              height: ConstantSize().getHotelInfoSingleItem(context),
              imageName: imageName, //'egypt.jpeg',
              child: Container(),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextView(
                        fontSize: ConstantSize().hotelInfoFontSize(context),
                        fontWeight: FontWeight.bold,
                        value: hotelName,
                        customColor: ColorConstant.blackColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: RatingBar.builder(
                    initialRating: hotelRating,
                    itemCount: hotelRating.toInt(),
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
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextWithIcon(icon: Icons.hotel, title: stayinHotel),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      TextView(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          value: 'Transport',
                          customColor: ColorConstant.blackColor),
                      TextView(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          value: transport,
                          customColor: ColorConstant.blackColor),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextView(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      value: 'City : $hotelType',
                      customColor: ColorConstant.blackColor),
                ),
              ],
            ),
            // GallerySection(),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              height: ConstantSize().hotelItemGallery(context),
              child: GridView.count(
                padding: const EdgeInsets.all(5),
                crossAxisCount: ConstantSize().hotelInfoGridCount(context),
                crossAxisSpacing: 3.0,
                mainAxisSpacing: 3.0,
                children: List.generate(
                  hotel_gallery_link.length,
                  (index) {
                    return buildGestureDetector(context, index);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector buildGestureDetector(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Get.defaultDialog(
          radius: 20.0,
          title: "Gallery",
          content: Container(
            width: ConstantSize().hotelItemGallery(context),
            height: ConstantSize().hotelItemGallery(context),
            child: Swiper(
              itemWidth: 520,
              index: index,
              itemHeight: 520,
              control: SwiperControl(),
              itemCount: hotel_gallery_link.length,
              layout: SwiperLayout.DEFAULT,
              itemBuilder: (context, index) {
                return ContainerImageDecorations(
                  width: ConstantSize().hotelItemGallery(context),
                  height: ConstantSize().hotelItemGallery(context),
                  borderRadius: const BorderRadius.all(Radius.circular(0)),
                  imageName: hotel_gallery_link[index],
                  opacity: 0,
                  child: Container(),
                );
              },
            ),
          ),
        );
      },
      child: ContainerImageDecorations(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        opacity: 0,
        width: 100,
        height: 100,
        imageName: hotel_gallery_link[index],
        child: Container(),
      ),
    );
  }
}
