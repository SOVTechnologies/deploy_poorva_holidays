// To parse this JSON data, do
//
//     final costResponse = costResponseFromJson(jsonString);

import 'dart:convert';

CostResponse costResponseFromJson(String str) => CostResponse.fromJson(json.decode(str));

String costResponseToJson(CostResponse data) => json.encode(data.toJson());

class CostResponse {
  CostResponse({
    required this.costId,
    required this.costPlan,
  });

  String costId;
  List<CostPlan> costPlan;

  factory CostResponse.fromJson(Map<String, dynamic> json) => CostResponse(
    costId: json["cost_id"],
    costPlan: List<CostPlan>.from(json["cost_plan"].map((x) => CostPlan.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cost_id": costId,
    "cost_plan": List<dynamic>.from(costPlan.map((x) => x.toJson())),
  };
}

class CostPlan {
  CostPlan({
    required this.price,
    required this.description,
  });

  int price;
  String description;

  factory CostPlan.fromJson(Map<String, dynamic> json) => CostPlan(
    price: json["price"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "price": price,
    "description": description,
  };
}
