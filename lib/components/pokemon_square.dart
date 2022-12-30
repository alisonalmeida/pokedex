import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:pokedex/components/red_ball.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/utils/colors.dart';
import 'package:pokedex/utils/consts.dart';

class PokemonSquare extends StatelessWidget {
  PokemonSquare({super.key, required this.pokemon});

  Pokemon pokemon;
  NumberFormat formatter = NumberFormat('000');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const  EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade100,
              border: Border.all(width: 2),
              boxShadow: [
                BoxShadow(offset: const Offset(2, 3), color: Colors.blue.shade700)
              ]),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RedBall(height: height, width: width),
                  RedBall(height: height, width: width),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [BoxShadow(offset: Offset(2, 2))],
                      color: blueColor,
                      border: Border.all()),
                  child: FractionallySizedBox(
                    heightFactor: 0.8,
                    widthFactor: 0.8,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(kpathPokeballBackground),
                        ),
                      ),
                      child: FractionallySizedBox(
                        heightFactor: 0.8,
                        widthFactor: 0.8,
                        child: Hero(
                          tag: pokemon.photoPath!,
                          child: SvgPicture.file(
                            File(pokemon.photoPath!),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RedBall(height: height, width: width),
                  const Icon(Icons.menu, size: 30)
                ],
              ),
            ],
          ),
        ),

        //Pokemon Number
        Positioned(
          right: 20,
          top: 0,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                border: Border.all(),
                boxShadow:const  [
                  BoxShadow(offset: Offset(2, 3), color: Colors.black)
                ]),
            child: Text(
              '  #${formatter.format(pokemon.id)}  ',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        )
      ],
    );
  }
}
