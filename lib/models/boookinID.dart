// To parse this JSON data, do
//
//     final boookinId = boookinIdFromJson(jsonString);

import 'dart:convert';

BoookinId boookinIdFromJson(String str) => BoookinId.fromJson(json.decode(str));

String boookinIdToJson(BoookinId data) => json.encode(data.toJson());

class BoookinId {
  BoookinId({
    required this.bookingId,
  });

  String bookingId;

  factory BoookinId.fromJson(Map<String, dynamic> json) => BoookinId(
    bookingId: json["booking_id"],
  );

  Map<String, dynamic> toJson() => {
    "booking_id": bookingId,
  };
}
