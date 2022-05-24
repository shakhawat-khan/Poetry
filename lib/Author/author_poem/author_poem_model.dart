// To parse this JSON data, do
//
//     final authorPoemModel = authorPoemModelFromJson(jsonString);

import 'dart:convert';

List<AuthorPoemModel> authorPoemModelFromJson(String str) =>
    List<AuthorPoemModel>.from(
        json.decode(str).map((x) => AuthorPoemModel.fromJson(x)));

String authorPoemModelToJson(List<AuthorPoemModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AuthorPoemModel {
  AuthorPoemModel({
    required this.title,
    required this.author,
    required this.lines,
    required this.linecount,
  });

  String title;
  String author;
  List<String> lines;
  String linecount;

  factory AuthorPoemModel.fromJson(Map<String, dynamic> json) =>
      AuthorPoemModel(
        title: json["title"],
        author: json["author"],
        lines: List<String>.from(json["lines"].map((x) => x)),
        linecount: json["linecount"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "author": author,
        "lines": List<dynamic>.from(lines.map((x) => x)),
        "linecount": linecount,
      };
}
