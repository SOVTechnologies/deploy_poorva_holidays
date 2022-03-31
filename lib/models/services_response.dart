// To parse this JSON data, do
//
//     final servicesResponse = servicesResponseFromJson(jsonString);

import 'dart:convert';

List<ServicesResponse> servicesResponseFromJson(String str) => List<ServicesResponse>.from(json.decode(str).map((x) => ServicesResponse.fromJson(x)));

String servicesResponseToJson(List<ServicesResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServicesResponse {
  ServicesResponse({
    required this.name,
    required this.imageLink,
    required this.description,
  });

  String name;
  String imageLink;
  String description;

  factory ServicesResponse.fromJson(Map<String, dynamic> json) => ServicesResponse(
    name: json["name"],
    imageLink: json["image_link"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image_link": imageLink,
    "description": description,
  };
}
