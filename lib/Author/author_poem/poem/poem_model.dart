// To parse this JSON data, do
//
//     final cardPoemModel = cardPoemModelFromJson(jsonString);

import 'dart:convert';

List<CardPoemModel> cardPoemModelFromJson(String str) =>
    List<CardPoemModel>.from(
        json.decode(str).map((x) => CardPoemModel.fromJson(x)));

String cardPoemModelToJson(List<CardPoemModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CardPoemModel {
  CardPoemModel({
    required this.lines,
  });

  List<String> lines;

  factory CardPoemModel.fromJson(Map<String, dynamic> json) => CardPoemModel(
        lines: List<String>.from(json["lines"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "lines": List<dynamic>.from(lines.map((x) => x)),
      };
}
