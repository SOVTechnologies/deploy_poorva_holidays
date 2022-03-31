// To parse this JSON data, do
//
//     final dayActivityResponse = dayActivityResponseFromJson(jsonString);

import 'dart:convert';

DayActivityResponse dayActivityResponseFromJson(String str) =>
    DayActivityResponse.fromJson(json.decode(str));

String dayActivityResponseToJson(DayActivityResponse data) =>
    json.encode(data.toJson());

class DayActivityResponse {
  DayActivityResponse({
    required this.dayActivityId,
    required this.date,
    required this.day,
    required this.plan,
    required this.title,
    required this.attraction,
    required this.note,
  });

  String dayActivityId;
  DateTime date;
  int day;
  List<Plan> plan;
  String title;
  String attraction;
  String note;

  factory DayActivityResponse.fromJson(Map<String, dynamic> json) =>
      DayActivityResponse(
        dayActivityId: json["day_activity_id"],
        date: DateTime.parse(json["date"]),
        day: json["day"],
        plan: List<Plan>.from(json["plan"].map((x) => Plan.fromJson(x))),
        title: json["title"],
        attraction: json["attraction"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "day_activity_id": dayActivityId,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "day": day,
        "plan": List<dynamic>.from(plan.map((x) => x.toJson())),
        "title": title,
        "attraction": attraction,
        "note": note,
      };
}

class Plan {
  Plan({
    required this.endTime,
    required this.startTime,
    required this.description,
  });

  String endTime;
  String startTime;
  String description;

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        endTime: json["end_time"],
        startTime: json["start_time"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "end_time": endTime,
        "start_time": startTime,
        "description": description,
      };
}
