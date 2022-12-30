// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/components/pokemon_square.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/utils/colors.dart';
import 'package:pokedex/utils/consts.dart';

class DetailedPokemonPage extends StatelessWidget {
  Pokemon pokemon;

  DetailedPokemonPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          pokemon.name.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.catching_pokemon_sharp),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: height * 0.9,
                width: width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [BoxShadow(offset: Offset(5, 5))],
                    color: blueColor,
                    border: Border.all()),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(kpathPokeballBackground),
                    ),
                  ),
                  child: Hero(
                    tag: pokemon.photoPath!,
                    child: FractionallySizedBox(
                      heightFactor: 0.8,
                      widthFactor: 0.8,
                      child: SvgPicture.file(
                        File(pokemon.photoPath!),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                  color: blueColor,
                  boxShadow: [
                    BoxShadow(color: Colors.black, offset: Offset(3, 3))
                  ],
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(18)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.pin_drop),
                  Text(' Agua'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
