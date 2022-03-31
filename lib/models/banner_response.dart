// To parse this JSON data, do
//
//     final bannerResponse = bannerResponseFromJson(jsonString);

import 'dart:convert';

BannerResponse bannerResponseFromJson(String str) => BannerResponse.fromJson(json.decode(str));

String bannerResponseToJson(BannerResponse data) => json.encode(data.toJson());

class BannerResponse {
  BannerResponse({
    required this.category,
    required this.data,
  });

  String category;
  List<String> data;

  factory BannerResponse.fromJson(Map<String, dynamic> json) => BannerResponse(
    category: json["category"],
    data: List<String>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}

