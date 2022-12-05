import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokedex/utils/colors.dart';

class PokedexScreen extends StatelessWidget {
  PokedexScreen({super.key, required this.pokemon});
  Pokemon? pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  decoration: screenDecoration,
                  child: Text(
                    pokemon!.name == '' ? '-' : pokemon!.name!.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 250,
                  decoration: screenDecoration,
                  child: Opacity(
                    opacity: 1,
                    child: Image.network(pokemon!.sprites!.frontDefault!,
                        filterQuality: FilterQuality.high,
                        color: Colors.black,
                        fit: BoxFit.fitHeight),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                  child: Container(
                decoration: screenDecoration,
                child: Text(
                  '  #${pokemon!.id} - Altura: ${pokemon!.height! * 2.54} cm - Peso: ${pokemon!.weight! * 453 / 1000} kg',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ))
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                  child: Container(
                decoration: screenDecoration,
                child: Text(
                  pokemon!.forms.toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
