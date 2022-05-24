/*
class RandomPoem {
  String title;
  String author;
  List<String> lines;
  String linecount;

  RandomPoem(
      {required this.title,
      required this.author,
      required this.lines,
      required this.linecount});

  factory RandomPoem.fromJson(Map<String, dynamic> json) {
    return RandomPoem(
      title: json['title'],
      author: json['author'],
      lines: json['lines'],
      linecount: json['linecount'],
    );
  }
}
*/
/*
class Class {
  String title;
  String author;
  List<String> lines;
  String linecount;

  Class(
      {required this.title,
      required this.author,
      required this.lines,
      required this.linecount});

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
      title: json['title'],
      author: json['author'],
      lines: json['lines'],
      linecount: json['linecount'],
    );
  }
}

class Test {
  List<Class> classes;

  Test({required this.classes});

  factory Test.fromJson(List<dynamic> json) {
    List<Class> classes = <Class>[];
    classes = json.map((i) => Class.fromJson(i)).toString() as List<Class>;

    return Test(classes: classes);
  }
}
*/

import 'dart:convert';

List<Poem> poemFromJson(String str) =>
    List<Poem>.from(json.decode(str).map((x) => Poem.fromJson(x)));

String poemToJson(List<Poem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Poem {
  Poem({
    required this.title,
    required this.author,
    required this.lines,
    required this.linecount,
  });

  String title;
  String author;
  List<String> lines;
  String linecount;

  factory Poem.fromJson(Map<String, dynamic> json) => Poem(
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
