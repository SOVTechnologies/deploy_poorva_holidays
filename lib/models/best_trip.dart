// To parse this JSON data, do
//
//     final besttripResponse = besttripResponseFromJson(jsonString);

import 'dart:convert';

BesttripResponse besttripResponseFromJson(String str) => BesttripResponse.fromJson(json.decode(str));

String besttripResponseToJson(BesttripResponse data) => json.encode(data.toJson());

class BesttripResponse {
  BesttripResponse({
    required this.category,
    required this.data,
  });

  String category;
  Data data;

  factory BesttripResponse.fromJson(Map<String, dynamic> json) => BesttripResponse(
    category: json["category"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.packageId,
    required this.description,
    required this.galleryLink,
  });

  String packageId;
  String description;
  List<String> galleryLink;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    packageId: json["package_id"],
    description: json["description"],
    galleryLink: List<String>.from(json["gallery_link"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "package_id": packageId,
    "description": description,
    "gallery_link": List<dynamic>.from(galleryLink.map((x) => x)),
  };
}
