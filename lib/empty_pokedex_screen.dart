import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokedex/utils/colors.dart';

class EmptyPokedexScreen extends StatelessWidget {
  EmptyPokedexScreen({super.key});

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
                  child: const Text(
                    '',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
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
                  child: Lottie.asset(
                      'lib/assets/animations/pokeball-animation.json'),
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
                child: const Text(
                  '',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                child: const Text(
                  '',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
