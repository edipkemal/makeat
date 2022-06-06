// To parse this JSON data, do
//
//     final instructionModel = instructionModelFromJson(jsonString);

import 'dart:convert';

List<InstructionModel> instructionModelFromJson(String str) => List<InstructionModel>.from(json.decode(str).map((x) => InstructionModel.fromJson(x)));

String instructionModelToJson(List<InstructionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InstructionModel {
  InstructionModel({
    required this.name,
    required this.steps,
  });

  String name;
  List<Step> steps;

  factory InstructionModel.fromJson(Map<String, dynamic> json) => InstructionModel(
    name: json["name"],
    steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
  };
}

class Step {
  Step({
    required this.number,
    required this.step,
    required this.ingredients,
    required this.equipment,
    this.length,
  });

  int number;
  String step;
  List<Ent> ingredients;
  List<Ent> equipment;
  Length? length;

  factory Step.fromJson(Map<String, dynamic> json) => Step(
    number: json["number"],
    step: json["step"],
    ingredients: List<Ent>.from(json["ingredients"].map((x) => Ent.fromJson(x))),
    equipment: List<Ent>.from(json["equipment"].map((x) => Ent.fromJson(x))),
    length: json["length"] == null ? null : Length.fromJson(json["length"]),
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "step": step,
    "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
    "equipment": List<dynamic>.from(equipment.map((x) => x.toJson())),
    "length": length == null ? null : length!.toJson(),
  };
}

class Ent {
  Ent({
    required this.id,
    required this.name,
    required this.localizedName,
    required this.image,
  });

  int id;
  String name;
  String localizedName;
  String image;

  factory Ent.fromJson(Map<String, dynamic> json) => Ent(
    id: json["id"],
    name: json["name"],
    localizedName: json["localizedName"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "localizedName": localizedName,
    "image": image,
  };
}

class Length {
  Length({
    required this.number,
    required this.unit,
  });

  int number;
  String unit;

  factory Length.fromJson(Map<String, dynamic> json) => Length(
    number: json["number"],
    unit: json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "unit": unit,
  };
}
