// To parse this JSON data, do
//
//     final types = typesFromMap(jsonString);

import 'dart:convert';


import 'package:objectbox/objectbox.dart';
import 'package:pokedex/model/pokemon_model.dart';


PokemonType typesFromMap(String str) => PokemonType.fromMap(json.decode(str));

String typesToMap(PokemonType data) => json.encode(data.toMap());

@Entity()
class PokemonType {
  PokemonType({
    int id = 0,
    required this.name,
    required this.url,
  });
  int id = 0;
  final String name;
  final String url;
  final pokemonModel = ToOne<Pokemon>();

  factory PokemonType.fromMap(Map<String, dynamic> json) => PokemonType(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };

  @override
  String toString() {
    
    return '$name, $url';
  }
}
