// To parse this JSON data, do
//
//     final searchInstructionModel = searchInstructionModelFromJson(jsonString);

import 'dart:convert';

List<SearchInstructionModel> searchInstructionModelFromJson(String str) => List<SearchInstructionModel>.from(json.decode(str).map((x) => SearchInstructionModel.fromJson(x)));

String searchInstructionModelToJson(List<SearchInstructionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchInstructionModel {
  SearchInstructionModel({
    required this.id,
    required this.title,
    required this.image,
    required this.imageType,
    required this.usedIngredientCount,
    required this.missedIngredientCount,
    required this.missedIngredients,
    required this.usedIngredients,
    required this.unusedIngredients,
    required this.likes,
  });

  int id;
  String title;
  String image;
  String imageType;
  int usedIngredientCount;
  int missedIngredientCount;
  List<SedIngredient> missedIngredients;
  List<SedIngredient> usedIngredients;
  List<dynamic> unusedIngredients;
  int likes;

  factory SearchInstructionModel.fromJson(Map<String, dynamic> json) => SearchInstructionModel(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    imageType: json["imageType"],
    usedIngredientCount: json["usedIngredientCount"],
    missedIngredientCount: json["missedIngredientCount"],
    missedIngredients: List<SedIngredient>.from(json["missedIngredients"].map((x) => SedIngredient.fromJson(x))),
    usedIngredients: List<SedIngredient>.from(json["usedIngredients"].map((x) => SedIngredient.fromJson(x))),
    unusedIngredients: List<dynamic>.from(json["unusedIngredients"].map((x) => x)),
    likes: json["likes"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "imageType": imageType,
    "usedIngredientCount": usedIngredientCount,
    "missedIngredientCount": missedIngredientCount,
    "missedIngredients": List<dynamic>.from(missedIngredients.map((x) => x.toJson())),
    "usedIngredients": List<dynamic>.from(usedIngredients.map((x) => x.toJson())),
    "unusedIngredients": List<dynamic>.from(unusedIngredients.map((x) => x)),
    "likes": likes,
  };
}

class SedIngredient {
  SedIngredient({
    required this.id,
    required this.amount,
    required this.unit,
    required this.unitLong,
    required this.unitShort,
    required this.aisle,
    required this.name,
    required this.original,
    required this.originalName,
    required this.meta,
    required this.image,
    required this.extendedName,
  });

  int id;
  double amount;
  String unit;
  String unitLong;
  String unitShort;
  String aisle;
  String name;
  String original;
  String originalName;
  List<String> meta;
  String image;
  String extendedName;

  factory SedIngredient.fromJson(Map<String, dynamic> json) => SedIngredient(
    id: json["id"],
    amount: json["amount"].toDouble(),
    unit: json["unit"],
    unitLong: json["unitLong"],
    unitShort: json["unitShort"],
    aisle: json["aisle"],
    name: json["name"],
    original: json["original"],
    originalName: json["originalName"],
    meta: List<String>.from(json["meta"].map((x) => x)),
    image: json["image"],
    extendedName: json["extendedName"] == null ? null : json["extendedName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "amount": amount,
    "unit": unit,
    "unitLong": unitLong,
    "unitShort": unitShort,
    "aisle": aisle,
    "name": name,
    "original": original,
    "originalName": originalName,
    "meta": List<dynamic>.from(meta.map((x) => x)),
    "image": image,
    "extendedName": extendedName == null ? null : extendedName,
  };
}
