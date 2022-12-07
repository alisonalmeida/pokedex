import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';

void rightPokemonDialog(BuildContext context, Pokemon rightPokemon) {
  var img =
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${rightPokemon.id}.png';
  showDialog(
    context: context,
    builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        child: Container(
          color: Colors.lightGreenAccent,
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Text(
                  rightPokemon.name!.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
              Image.network(img),
              Text(
                'AH, MIZERAVI! ACERTOU',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )),
  );
}

void wrongPokemonDialog(BuildContext context, Pokemon rightPokemon) {
  var img =
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${rightPokemon.id}.png';
  showDialog(
    context: context,
    builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        child: Container(
          color: Colors.redAccent,
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Text(
                  rightPokemon.name!.toUpperCase(),textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
              Image.network(img),
              Text(
                'ERROU',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )),
  );
}
