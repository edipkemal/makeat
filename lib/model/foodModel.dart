// To parse this JSON data, do
//
//     final foodModel = foodModelFromJson(jsonString);

import 'dart:convert';

FoodModel foodModelFromJson(String str) => FoodModel.fromJson(json.decode(str));

String foodModelToJson(FoodModel data) => json.encode(data.toJson());

class FoodModel {
  FoodModel({
    required this.results,
    required this.offset,
    required this.number,
    required this.totalResults,
  });

  late List<Result> results;
  int offset;
  int number;
  int totalResults;

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    offset: json["offset"],
    number: json["number"],
    totalResults: json["totalResults"],
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "offset": offset,
    "number": number,
    "totalResults": totalResults,
  };
}

class Result {
  Result({
    required this.id,
    required this.title,
    required this.image,
    required this.imageType,
  });

  int id;
  String title;
  String image;
  String imageType;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    imageType: json["imageType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "imageType": imageType,
  };
}
