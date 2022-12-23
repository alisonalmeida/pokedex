import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pokedex/utils/colors.dart';
import 'package:pokedex/utils/consts.dart';
import 'package:pokedex/utils/custom_choice_button.dart';

class PokedexScreen extends StatelessWidget {
  PokedexScreen(
      {super.key,});
  

  @override
  Widget build(BuildContext context) {
    List<Widget> listNames = [];
    listNames.addAll([
      CustomChoiceButton(
          name: 'rightPokemon!.name!',
          callback: () {
          }),
      CustomChoiceButton(
          name: 'otherPokemon1!.name!',
          callback: () {
          }),
      CustomChoiceButton(
          name: 'otherPokemon2',
          callback: () {
          })
    ]);

    listNames.shuffle();

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
                  child: Image.network('rightPokemon',
                      color: Colors.black, fit: BoxFit.fitHeight),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: listNames,
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
