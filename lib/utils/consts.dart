// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

const appName = 'pokedex';

const int maxPokemonNumber = 10;

const kpathPokemonLogo = 'lib/assets/img/pokemon-logo.png';
const kpathPokeballLottie = 'lib/assets/animations/pokeball-animation.json';
const kpathPokeballBackground = 'lib/assets/img/background-pokemon.png';

List<String> listTypes = [
  'grass',
  'poison',
  'fire',
  'flying',
  'water',
  'bug',
  'normal',
  'electric',
  'ground',
  'fairy',
  'fighting',
  'psychic',
  'rock',
  'steel',
  'ice',
  'ghost',
  'dragon',
  'dark'
];

Future<bool> showAlertDownloadMessage(BuildContext context) async {
  bool wantDownload = false;
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
        title: Text(
            'É necessário fazer o download de dados da internet para o funcionamento do aplicativo! Você autoriza?'),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                wantDownload = true;
              },
              child: Text('Sim')),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Não')),
        ]),
  );
  return wantDownload;
}
