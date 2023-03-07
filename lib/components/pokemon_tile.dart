import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokemonTile extends StatelessWidget {
  PokemonTile({super.key, required this.formatter, required this.pokemon});
  PokemonModel pokemon;
  NumberFormat formatter = NumberFormat('000');

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(pokemon.name),
      leading: Image.asset(pokemon.photoPath!),
    );
  }
}
