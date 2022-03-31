// To parse this JSON data, do
//
//     final reviewResponse = reviewResponseFromJson(jsonString);

import 'dart:convert';

List<ReviewResponse> reviewResponseFromJson(String str) =>
    List<ReviewResponse>.from(
        json.decode(str).map((x) => ReviewResponse.fromJson(x)));

String reviewResponseToJson(List<ReviewResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReviewResponse {
  ReviewResponse({
    required this.name,
    required this.profile,
    required this.rating,
    required this.description,
  });

  String name;
  String profile;
  int rating;
  String description;

  factory ReviewResponse.fromJson(Map<String, dynamic> json) => ReviewResponse(
        name: json["name"],
        profile: json["profile"],
        rating: json["rating"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "profile": profile,
        "rating": rating,
        "description": description,
      };
}
