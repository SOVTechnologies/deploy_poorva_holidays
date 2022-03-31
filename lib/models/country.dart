// To parse this JSON data, do
//
//     final countryList = countryListFromJson(jsonString);

import 'dart:convert';

List<Country> countryListFromJson(String str) => List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

String countryListToJson(List<Country> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Country {
  Country({
    required this.name,
    required this.code,
  });

  String name;
  String code;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    name: json["name"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
  };
}