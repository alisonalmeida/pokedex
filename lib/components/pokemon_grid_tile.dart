// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pokedex/components/pokemon_number.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokemonTile extends StatelessWidget {
  PokemonTile({super.key, required this.pokemon});
  PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Opacity(
            opacity: 0.05,
            child: Image.asset('lib/assets/img/pokebola.png'),
          ),
        ),
        Image.asset('lib/assets/pokemon_gif/${pokemon.id}front.gif'),
        Positioned(top: 1, left: 1, child: PokemonNumber(pokemon: pokemon)),
        Positioned(
          bottom: 10,
          child: Text(
            pokemon.name[0].toUpperCase() +
                pokemon.name.substring(1, pokemon.name.length),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
