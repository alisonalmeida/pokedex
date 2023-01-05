import 'package:objectbox/objectbox.dart';

@Entity()
class PokemonModel {
  @Id(assignable: true)
  int id;
  String name;
  String? photoPath;
  int height;
  int weight;
  String informations;

  @Backlink()
  final types = ToMany<PokemonType>();

  PokemonModel({
    required this.id,
    required this.name,
    this.photoPath,
    required this.height,
    required this.weight,
    this.informations = '',
  });
}

@Entity()
class PokemonType {
  int id = 0;
  String name;
  final type = ToOne<PokemonModel>();

  PokemonType({required this.name});
}
