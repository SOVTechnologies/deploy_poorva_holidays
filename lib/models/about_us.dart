// To parse this JSON data, do
//
//     final aboutUs = aboutUsFromJson(jsonString);

import 'dart:convert';

List<AboutUsResponse> aboutUsFromJson(String str) => List<AboutUsResponse>.from(json.decode(str).map((x) => AboutUsResponse.fromJson(x)));

String aboutUsToJson(List<AboutUsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AboutUsResponse {
  AboutUsResponse({
    required this.name,
    required this.description,
  });

  String name;
  String description;

  factory AboutUsResponse.fromJson(Map<String, dynamic> json) => AboutUsResponse(
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
  };
}
