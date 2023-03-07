// To parse this JSON data, do
//
//     final pokemon = pokemonFromMap(jsonString);

import 'dart:convert';

class PokemonFromApi {
  PokemonFromApi({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory PokemonFromApi.fromJson(String str) =>
      PokemonFromApi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PokemonFromApi.fromMap(Map<String, dynamic> json) => PokemonFromApi(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}
