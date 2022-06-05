// To parse this JSON data, do
//
//     final ingredientsModel = ingredientsModelFromJson(jsonString);

import 'dart:convert';

IngredientsModel ingredientsModelFromJson(String str) => IngredientsModel.fromJson(json.decode(str));

String ingredientsModelToJson(IngredientsModel data) => json.encode(data.toJson());

class IngredientsModel {
  IngredientsModel({
    required this.ingredients,
  });

  List<Ingredient> ingredients;

  factory IngredientsModel.fromJson(Map<String, dynamic> json) => IngredientsModel(
    ingredients: List<Ingredient>.from(json["ingredients"].map((x) => Ingredient.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
  };
}

class Ingredient {
  Ingredient({
    required this.name,
    required this.image,
    required this.amount,
  });

  String name;
  String image;
  Amount amount;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
    name: json["name"],
    image: json["image"],
    amount: Amount.fromJson(json["amount"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "amount": amount.toJson(),
  };
}

class Amount {
  Amount({
    required this.metric,
    required this.us,
  });

  Metric metric;
  Metric us;

  factory Amount.fromJson(Map<String, dynamic> json) => Amount(
    metric: Metric.fromJson(json["metric"]),
    us: Metric.fromJson(json["us"]),
  );

  Map<String, dynamic> toJson() => {
    "metric": metric.toJson(),
    "us": us.toJson(),
  };
}

class Metric {
  Metric({
    required this.value,
    required this.unit,
  });

  double value;
  String unit;

  factory Metric.fromJson(Map<String, dynamic> json) => Metric(
    value: json["value"].toDouble(),
    unit: json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "unit": unit,
  };
}
