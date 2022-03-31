// To parse this JSON data, do
//
//     final hotelResponse = hotelResponseFromJson(jsonString);

import 'dart:convert';

HotelResponse hotelResponseFromJson(String str) =>
    HotelResponse.fromJson(json.decode(str));

String hotelResponseToJson(HotelResponse data) => json.encode(data.toJson());

class HotelResponse {
  HotelResponse({
    required this.hotelId,
    required this.hotelName,
    required this.hotelInfo,
    required this.hotelBrand,
    required this.hotelCity,
    required this.hotelCountry,
    required this.hotelAddress,
    required this.hotelRating,
    required this.hotelCheckInTime,
    required this.hotelCheckOutTime,
    required this.hotelThumbnailLink,
    required this.hotelPrivacyPolicy,
    required this.hotelReview,
    required this.hotelCoupleFriendly,
    required this.hotelRooms,
    required this.hotelOffer,
    required this.hotelGalleryLink,
    required this.hotelCancellationTerms,
    required this.hotelLandmarks,
    required this.hotelTransportAvailability,
    required this.hotelAvailability,
    required this.hotelAmenities,
  });

  String hotelId;
  String hotelName;
  String hotelInfo;
  String hotelBrand;
  String hotelCity;
  String hotelCountry;
  String hotelAddress;
  int hotelRating;
  int hotelCheckInTime;
  int hotelCheckOutTime;
  String hotelThumbnailLink;
  String hotelPrivacyPolicy;
  List<String> hotelReview;
  int hotelCoupleFriendly;
  List<String> hotelRooms;
  List<String> hotelOffer;
  List<String> hotelGalleryLink;
  int hotelCancellationTerms;
  List<String> hotelLandmarks;
  int hotelTransportAvailability;
  List<String> hotelAvailability;
  List<String> hotelAmenities;

  factory HotelResponse.fromJson(Map<String, dynamic> json) => HotelResponse(
        hotelId: json["hotel_id"],
        hotelName: json["hotel_name"],
        hotelInfo: json["hotel_info"],
        hotelBrand: json["hotel_brand"],
        hotelCity: json["hotel_city"],
        hotelCountry: json["hotel_country"],
        hotelAddress: json["hotel_address"],
        hotelRating: json["hotel_rating"],
        hotelCheckInTime: json["hotel_check_in_time"],
        hotelCheckOutTime: json["hotel_check_out_time"],
        hotelThumbnailLink: json["hotel_thumbnail_link"],
        hotelPrivacyPolicy: json["hotel_privacy_policy"],
        hotelReview: List<String>.from(json["hotel_review"].map((x) => x)),
        hotelCoupleFriendly: json["hotel_couple_friendly"],
        hotelRooms: List<String>.from(json["hotel_rooms"].map((x) => x)),
        hotelOffer: List<String>.from(json["hotel_offer"].map((x) => x)),
        hotelGalleryLink:
            List<String>.from(json["hotel_gallery_link"].map((x) => x)),
        hotelCancellationTerms: json["hotel_cancellation_terms"],
        hotelLandmarks:
            List<String>.from(json["hotel_landmarks"].map((x) => x)),
        hotelTransportAvailability: json["hotel_transport_availability"],
        hotelAvailability:
            List<String>.from(json["hotel_availability"].map((x) => x)),
        hotelAmenities:
            List<String>.from(json["hotel_amenities"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "hotel_id": hotelId,
        "hotel_name": hotelName,
        "hotel_info": hotelInfo,
        "hotel_brand": hotelBrand,
        "hotel_city": hotelCity,
        "hotel_country": hotelCountry,
        "hotel_address": hotelAddress,
        "hotel_rating": hotelRating,
        "hotel_check_in_time": hotelCheckInTime,
        "hotel_check_out_time": hotelCheckOutTime,
        "hotel_thumbnail_link": hotelThumbnailLink,
        "hotel_privacy_policy": hotelPrivacyPolicy,
        "hotel_review": List<dynamic>.from(hotelReview.map((x) => x)),
        "hotel_couple_friendly": hotelCoupleFriendly,
        "hotel_rooms": List<dynamic>.from(hotelRooms.map((x) => x)),
        "hotel_offer": List<dynamic>.from(hotelOffer.map((x) => x)),
        "hotel_gallery_link":
            List<dynamic>.from(hotelGalleryLink.map((x) => x)),
        "hotel_cancellation_terms": hotelCancellationTerms,
        "hotel_landmarks": List<dynamic>.from(hotelLandmarks.map((x) => x)),
        "hotel_transport_availability": hotelTransportAvailability,
        "hotel_availability":
            List<dynamic>.from(hotelAvailability.map((x) => x)),
        "hotel_amenities": List<dynamic>.from(hotelAmenities.map((x) => x)),
      };
}
