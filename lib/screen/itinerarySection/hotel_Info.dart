import 'package:flutter/material.dart';
import 'package:poorvaholiday/constant/constant_size.dart';
import 'package:poorvaholiday/models/hotel_response.dart';
import 'hotel_single_item.dart';

class HotelInfo extends StatelessWidget {
  HotelInfo({Key? key, required this.hotelList}) : super(key: key);
  List<HotelResponse> hotelList;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
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
          transport: hotelList[index].hotelTransportAvailability == 1
              ? ' : Yes'
              : ' :No',
          hotelType: hotelList[index].hotelCity,
          hotel_gallery_link: hotelList[index].hotelGalleryLink,
          myColor: Colors.orangeAccent,
        ),
      ),
    );
  }
}
//
