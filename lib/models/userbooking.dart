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
    required this.packageTitle,
    required this.packageCity,
    required this.packageCountry,
    required this.packageStartDate,
    required this.packageEndDate,
  });

  String bookingId;
  String bookingPaymentStatus;
  String bookingDate;
  int bookingRate;
  String bookingUserId;
  String bookingPackageId;
  String bookingMethod;
  String bookingStatus;
  String packageTitle;
  String packageCity;
  String packageCountry;
  String packageStartDate;
  String packageEndDate;

  factory Userbooking.fromJson(Map<String, dynamic> json) => Userbooking(
        bookingId: json["booking_id"],
        bookingPaymentStatus: json["booking_payment_status"],
        bookingDate: json["booking_date"],
        bookingRate: json["booking_rate"],
        bookingUserId: json["booking_user_id"],
        bookingPackageId: json["booking_package_id"],
        bookingMethod: json["booking_method"],
        bookingStatus: json["booking_status"],
        packageTitle: json["package_title"],
        packageCity: json["package_city"],
        packageCountry: json["package_country"],
        packageStartDate: json["package_start_date"],
        packageEndDate: json["package_end_date"],

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
