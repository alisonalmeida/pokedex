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
        Image.asset('lib/assets/pokemon_gif/${pokemon.id}front.gif'),
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25))),
        ),
        Positioned(top: 1, left: 1, child: PokemonNumber(pokemon: pokemon)),
        Positioned(
          bottom: 10,
          left: 10,
          child: Text(
            pokemon.name[0].toUpperCase() +
                pokemon.name.substring(1, pokemon.name.length),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
