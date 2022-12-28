// To parse this JSON data, do
//
//     final types = typesFromMap(jsonString);

import 'dart:convert';

Type typesFromMap(String str) => Type.fromMap(json.decode(str));

String typesToMap(Type data) => json.encode(data.toMap());

class Type {
  Type({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory Type.fromMap(Map<String, dynamic> json) => Type(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}
