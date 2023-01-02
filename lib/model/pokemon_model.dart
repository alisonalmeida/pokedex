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

  @Backlink()
  final types = ToMany<PokemonType>();

  Pokemon({
    required this.id,
    required this.name,
    this.photoPath,
    required this.height,
    required this.weight,
  });
  factory Pokemon.fromJson(String str) => Pokemon.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  factory Pokemon.fromMap(Map<String, dynamic> json) => Pokemon(
        height: json["height"],
        id: json["id"],
        name: json["name"],
        weight: json["weight"],
      );

  Map<String, dynamic> toMap() => {
        "height": height,
        "id": id,
        "name": name,
        "weight": weight,
        "types": types,
      };
}

@Entity()
class PokemonType {
  int id = 0;
  String name;
  final type = ToOne<Pokemon>();

  PokemonType({required this.name});
}

/**@Entity()
class PokemonType {
  PokemonType({
    required this.name,
  });
  int id = 0;
  final String name;
  final pokemon = ToOne<Pokemon>();

  factory PokemonType.fromJson(String str) =>
      PokemonType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PokemonType.fromMap(Map<String, dynamic> json) =>
      PokemonType(name: json["name"]);

  Map<String, dynamic> toMap() => {"name": name};
}
 */
