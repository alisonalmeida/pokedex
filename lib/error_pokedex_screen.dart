import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokedex/utils/colors.dart';

class ErrorPokedexScreen extends StatelessWidget {
  ErrorPokedexScreen({super.key});

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
                  height: 250,
                  decoration: screenDecoration,
                  child: const Center(
                    child: SizedBox(
                      height: 50,
                      child: Text('ERRO')
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
