import 'package:objectbox/objectbox.dart';

@Entity()
class PokemonModel {
  @Id(assignable: true)
  int id;
  String name;

  @Backlink()
  final types = ToMany<PokemonType>();

  PokemonModel({
    required this.id,
    required this.name,
  });
}

@Entity()
class PokemonType {
  int id = 0;
  String name;
  final type = ToOne<PokemonModel>();

  PokemonType({required this.name});
}
