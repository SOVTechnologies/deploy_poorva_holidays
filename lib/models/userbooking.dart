// To parse this JSON data, do
//
//     final userbooking = userbookingFromJson(jsonString);

import 'dart:convert';

List<Userbooking> userbookingFromJson(String str) => List<Userbooking>.from(
    json.decode(str).map((x) => Userbooking.fromJson(x)));

String userbookingToJson(List<Userbooking> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Userbooking {
  Userbooking({
    required this.bookingId,
    required this.bookingPaymentStatus,
    required this.bookingDate,
    required this.bookingRate,
    required this.bookingUserId,
    required this.bookingPackageId,
    required this.bookingMethod,
    required this.bookingStatus,
    //required   this.bookingGuestDetails,
  });

  String bookingId;
  String bookingPaymentStatus;
  String bookingDate;
  int bookingRate;
  String bookingUserId;
  String bookingPackageId;
  String bookingMethod;
  String bookingStatus;
  //List<BookingGuestDetail> bookingGuestDetails;

  factory Userbooking.fromJson(Map<String, dynamic> json) => Userbooking(
        bookingId: json["booking_id"],
        bookingPaymentStatus: json["booking_payment_status"],
        bookingDate: json["booking_date"],
        bookingRate: json["booking_rate"],
        bookingUserId: json["booking_user_id"],
        bookingPackageId: json["booking_package_id"],
        bookingMethod: json["booking_method"],
        bookingStatus: json["booking_status"],
        // bookingGuestDetails: List<BookingGuestDetail>.from(json["booking_guest_details"].map((x) => BookingGuestDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "booking_id": bookingId,
        "booking_payment_status": bookingPaymentStatus,
        "booking_date": bookingDate,
        "booking_rate": bookingRate,
        "booking_user_id": bookingUserId,
        "booking_package_id": bookingPackageId,
        "booking_method": bookingMethod,
        "booking_status": bookingStatus,
       // "booking_guest_details": List<dynamic>.from(bookingGuestDetails.map((x) => x.toJson())),
      };
}

class BookingGuestDetail {
  BookingGuestDetail({
    required this.personalEmail,
    required this.personalPanCard,
    required this.personalLastName,
    required this.personalFirstName,
    required this.personalSuggestion,
    required this.personalMobileNumber,
    required this.travellerDob,
    required this.travellerName,
    required this.travellerGender,
    required this.travellerPanCard,
  });

  String personalEmail;
  String personalPanCard;
  String personalLastName;
  String personalFirstName;
  String personalSuggestion;
  String personalMobileNumber;
  String travellerDob;
  String travellerName;
  String travellerGender;
  String travellerPanCard;

  factory BookingGuestDetail.fromJson(Map<String, dynamic> json) =>
      BookingGuestDetail(
        personalEmail: json["personalEmail"],
        personalPanCard: json["personalPanCard"],
        personalLastName: json["personalLastName"],
        personalFirstName: json["personalFirstName"],
        personalSuggestion: json["personalSuggestion"],
        personalMobileNumber: json["personalMobileNumber"],
        travellerDob: json["travellerDOB"],
        travellerName: json["travellerName"],
        travellerGender: json["travellerGender"],
        travellerPanCard: json["travellerPanCard"],
      );

  Map<String, dynamic> toJson() => {
        "personalEmail": personalEmail,
        "personalPanCard": personalPanCard,
        "personalLastName": personalLastName,
        "personalFirstName": personalFirstName,
        "personalSuggestion": personalSuggestion,
        "personalMobileNumber": personalMobileNumber,
        "travellerDOB": travellerDob,
        "travellerName": travellerName,
        "travellerGender": travellerGender,
        "travellerPanCard": travellerPanCard,
      };
}
