// To parse this JSON data, do
//
//     final author = authorFromJson(jsonString);

import 'dart:convert';

Author authorFromJson(String str) => Author.fromJson(json.decode(str));

String authorToJson(Author data) => json.encode(data.toJson());

class Author {
  Author({
    required this.authors,
  });

  List<String> authors;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        authors: List<String>.from(json["authors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "authors": List<dynamic>.from(authors.map((x) => x)),
      };
}
