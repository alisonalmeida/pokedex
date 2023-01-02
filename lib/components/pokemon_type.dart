// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokemonTypeSvg extends StatelessWidget {
  PokemonTypeSvg({super.key, required this.pokemonType});
  PokemonType pokemonType;

  @override
  Widget build(BuildContext context) {
    Color color = Colors.yellow.shade100;
    if (pokemonType.name == 'bug') {
      color = Colors.purpleAccent.shade100;
    } else if (pokemonType.name == 'dark') {
      color = Colors.deepPurple;
    } else if (pokemonType.name == 'dragon') {
      color = Colors.yellow.shade700;
    } else if (pokemonType.name == 'earth') {
      color = Colors.brown;
    } else if (pokemonType.name == 'electric') {
      color = Colors.amber;
    } else if (pokemonType.name == 'fairy') {
      color = Colors.cyan.shade200;
    } else if (pokemonType.name == 'fight') {
      color = Colors.orange;
    } else if (pokemonType.name == 'fire') {
      color = Colors.red;
    } else if (pokemonType.name == 'ghost') {
      color = Colors.purple;
    } else if (pokemonType.name == 'grass') {
      color = Colors.green;
    } else if (pokemonType.name == 'ice') {
      color = Colors.cyan;
    } else if (pokemonType.name == 'fairy') {
      color = Colors.cyan;
    } else if (pokemonType.name == 'poison') {
      color = Colors.purple.shade500;
    } else if (pokemonType.name == 'psychic') {
      color = Colors.deepOrange;
    } else if (pokemonType.name == 'rock') {
      color = Colors.grey;
    } else if (pokemonType.name == 'steel') {
      color = Colors.blueGrey;
    } else if (pokemonType.name == 'water') {
      color = Colors.blueAccent;
    } else if (pokemonType.name == 'flying') {
      color = Colors.white;
    }

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
            color: color,
            boxShadow: [BoxShadow(color: Colors.black, offset: Offset(3, 3))],
            border: Border.all(),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'lib/assets/pokemon_types/${pokemonType.name}.svg',
              height: 20,
              width: 20,
            ),
            Text(
              ' ${pokemonType.name.toUpperCase()}',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
