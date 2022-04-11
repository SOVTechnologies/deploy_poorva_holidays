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
    return Container(
        padding: const EdgeInsets.all(5.0),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                TextView(
                    style: TextView.headerStyle(
                      size: 20,
                      weight: FontWeight.bold,
                      color: ColorConstant.blueColor,
                    ),
                    align: TextAlign.left,
                    value: hotelName,
                    customColor: ColorConstant.blackColor),
                const SizedBox(
                  width: 10,
                ),
                RatingBar.builder(
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
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextWithIcon(icon: Icons.hotel, title: stayinHotel),
                ),
                TextView(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    value: 'transport : $transport',
                    customColor: ColorConstant.blackColor),
                const SizedBox(
                  width: 10,
                ),
                TextView(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    value: 'City : $hotelType',
                    customColor: ColorConstant.blackColor),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Swiper(
                        itemCount: hotel_gallery_link.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(hotel_gallery_link[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        pagination: SwiperPagination(
                          alignment: Alignment.bottomCenter,
                          margin: const EdgeInsets.all(5.0),
                          builder: DotSwiperPaginationBuilder(
                            color: ColorConstant.whiteColor,
                            activeColor: ColorConstant.blueColor,
                            size: 8.0,
                            activeSize: 8.0,
                          ),
                        ),
                        autoplay: true,
                        autoplayDelay: 5000,
                        autoplayDisableOnInteraction: true,
                        loop: true,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Wrap(
                      children: List.generate(
                        hotel_gallery_link.length,
                        (index) {
                          return buildGestureDetector(context, index);
                        },
                      ),
                    ),
                  ),
                  // GallerySection(),
                ],
              ),
            ),
          ],
        ));
  }

  GestureDetector buildGestureDetector(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        showDialog(
          builder: (BuildContext context) {
            return AlertDialog(
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
          context: context,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10, bottom: 10),
        child: ContainerImageDecorations(
          borderRadius: const BorderRadius.all(Radius.circular(0)),
          opacity: 0,
          width: 120,
          height: 120,
          imageName: hotel_gallery_link[index],
          child: Container(),
        ),
      ),
    );
  }
}
