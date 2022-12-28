// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/pokemon_model.dart';

class DetailedPokemonPage extends StatelessWidget {
  Pokemon pokemon;

  DetailedPokemonPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    print(pokemon);
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
            child: Icon(
              Icons.catching_pokemon_sharp,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 300,
            width: 300,
            child: Hero(
              tag: pokemon.photoPath!,
              child: SvgPicture.file(
                File(pokemon.photoPath!),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Text('data'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
