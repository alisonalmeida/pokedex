import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokemonNumber extends StatelessWidget {
  PokemonNumber({Key? key, required this.pokemon}) : super(key: key);

  final PokemonModel pokemon;
  NumberFormat formatter = NumberFormat('000');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(),
          boxShadow: const [
            BoxShadow(offset: Offset(2, 3), color: Colors.black)
          ]),
      child: Text(
        '  #${formatter.format(pokemon.id)}  ',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
