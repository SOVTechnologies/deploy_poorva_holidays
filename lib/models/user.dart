// To parse this JSON data, do
//
//     final getUser = getUserFromJson(jsonString);

import 'dart:convert';

GetUser getUserFromJson(String str) => GetUser.fromJson(json.decode(str));

String getUserToJson(GetUser data) => json.encode(data.toJson());

class GetUser {
  GetUser({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.userAge,
    required this.userCity,
    required this.userDob,
    required this.userCountry,
    required this.userGender,
    required this.userProfilePicLink,
  });

  String userId;
  String userName;
  String userEmail;
  int userPhone;
  int userAge;
  String userCity;
  DateTime userDob;
  String userCountry;
  String userGender;
  String userProfilePicLink;

  factory GetUser.fromJson(Map<String, dynamic> json) => GetUser(
        userId: json["user_id"],
        userName: json["user_name"],
        userEmail: json["user_email"],
        userPhone: json["user_phone"],
        userAge: json["user_age"],
        userCity: json["user_city"],
        userDob: DateTime.parse(json["user_dob"]),
        userCountry: json["user_country"],
        userGender: json["user_gender"],
        userProfilePicLink: json["user_profile_pic_link"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_name": userName,
        "user_email": userEmail,
        "user_phone": userPhone,
        "user_age": userAge,
        "user_city": userCity,
        "user_dob":
            "${userDob.year.toString().padLeft(4, '0')}-${userDob.month.toString().padLeft(2, '0')}-${userDob.day.toString().padLeft(2, '0')}",
        "user_country": userCountry,
        "user_gender": userGender,
        "user_profile_pic_link": userProfilePicLink,
      };
}
