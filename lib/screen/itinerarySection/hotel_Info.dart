import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/constant/constant_size.dart';
import 'package:poorvaholiday/controller/single_package_info.dart';
import 'package:poorvaholiday/models/hotel_response.dart';
import 'package:poorvaholiday/screen/widgets/imagedecoration.dart';
import 'package:poorvaholiday/screen/widgets/text_with_Icon.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

import 'hotel_single_item.dart';

class HotelInfo extends StatelessWidget {
   HotelInfo({Key? key , required this.hotelList}) : super(key: key);
  List<HotelResponse> hotelList;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(ConstantSize().iteneraryContentMargin(context)),
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: hotelList.length,
        itemBuilder: (BuildContext context, int index) => HotelSingleItem(
          imageName: hotelList[index].hotelThumbnailLink,
          hotelName: hotelList[index].hotelName,
          hotelRating: hotelList[index].hotelRating.toDouble(),
          stayinHotel: hotelList[index].hotelBrand,
          transport: hotelList[index].hotelTransportAvailability ==1?' : Yes':' :No',
          hotelType: hotelList[index].hotelCity,
          hotel_gallery_link: hotelList[index].hotelGalleryLink,
          myColor: Colors.orangeAccent,
        ),
      ),
    );
  }
}
//
