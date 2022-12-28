import 'dart:convert';

import 'package:objectbox/objectbox.dart';

@Entity()
class Pokemon {
  @Id(assignable: true)
  int id;
  String name;
  String? photoPath;
  int height;
  int weight;
   String types;

  Pokemon({
    required this.id,
    required this.name,
    this.photoPath,
    required this.height,
    required this.weight,
    required this.types,
  });
  factory Pokemon.fromJson(String str) => Pokemon.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  factory Pokemon.fromMap(Map<String, dynamic> json) => Pokemon(
        height: json["height"],
        id: json["id"],
        name: json["name"],
        weight: json["weight"],
        types: json["types"].toString(),
      );

  Map<String, dynamic> toMap() => {
        "height": height,
        "id": id,
        "name": name,
        "weight": weight,
        "types": types,
      };

  
}
