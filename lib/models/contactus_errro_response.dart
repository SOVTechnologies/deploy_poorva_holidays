// To parse this JSON data, do
//
//     final contactusErrroResponse = contactusErrroResponseFromJson(jsonString);

import 'dart:convert';

ContactusErrroResponse contactusErrroResponseFromJson(String str) => ContactusErrroResponse.fromJson(json.decode(str));

String contactusErrroResponseToJson(ContactusErrroResponse data) => json.encode(data.toJson());

class ContactusErrroResponse {
  ContactusErrroResponse({
    required this.detail,
  });

  List<Detail> detail;

  factory ContactusErrroResponse.fromJson(Map<String, dynamic> json) => ContactusErrroResponse(
    detail: List<Detail>.from(json["detail"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "detail": List<dynamic>.from(detail.map((x) => x.toJson())),
  };
}

class Detail {
  Detail({
    required this.loc,
    required this.msg,
    required this.type,
  });

  List<String> loc;
  String msg;
  String type;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    loc: List<String>.from(json["loc"].map((x) => x)),
    msg: json["msg"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "loc": List<dynamic>.from(loc.map((x) => x)),
    "msg": msg,
    "type": type,
  };
}