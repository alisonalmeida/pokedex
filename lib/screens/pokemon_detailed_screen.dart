// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:pokedex/components/pokemon_square.dart';
import 'package:pokedex/model/pokemon_model.dart';

class DetailedPokemonPage extends StatelessWidget {
  Pokemon pokemon;

  DetailedPokemonPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var widht = size.width;
    var height = size.height;
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
      body: ListView(
        children: [
          SizedBox(child: PokemonSquare(pokemon: pokemon)),
          Text('data')
        ],
      ),
    );
  }
}
