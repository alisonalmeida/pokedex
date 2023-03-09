import 'package:flutter/material.dart';
import 'package:pokedex/components/pokemon_number.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokemonTile extends StatelessWidget {
  PokemonTile({super.key, required this.pokemon});
  PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: GridTile(
        footer: Text(
          pokemon.name[0].toUpperCase() +
              pokemon.name.substring(1, pokemon.name.length),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 10, left: 10, child: PokemonNumber(pokemon: pokemon)),
            Image.asset('lib/assets/pokemon_gif/${pokemon.id}front.gif'),
          ],
        ),
      ),
    );
  }
}
