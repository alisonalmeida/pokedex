import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/utils/colors.dart';

class LoadingPokedexScreen extends StatelessWidget {
  LoadingPokedexScreen({super.key});

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
                  child: SizedBox(
                    height: 50,
                    child: Lottie.asset(
                        'lib/assets/animations/pokeball-animation.json'),
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
