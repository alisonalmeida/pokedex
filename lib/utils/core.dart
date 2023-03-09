import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/objectbox_helper.dart';
import 'package:pokedex/utils/consts.dart';

Directory? directoryApp;
String pokemonSvgPath = '';
final Dio dio = Dio();
double progress = 0;
NumberFormat formatter = NumberFormat('000');
String imagePokemon = 'https://assets.pokemon.com/assets/cms2/img/pokedex/full';

class PokemonData {
  Future<bool> _containSvgPokemonData(int index) async {
    var v = await File('$pokemonSvgPath\\$index.svg').exists();
    return v;
  }

  bool _containDbPokemonData(int index) {
    return objectbox.containPokemon(index);
  }

  Future<bool> checkAppData(int min, int max) async {
    bool isAppCompleted = true;
    for (var i = min; i <= max; i++) {
      isAppCompleted = _containDbPokemonData(i);
      if (!isAppCompleted) {
        break;
      }

      isAppCompleted = await _containSvgPokemonData(i);

      if (!isAppCompleted) {
        break;
      }
    }

    return isAppCompleted;
  }
}

Future initAppConfigurations() async {
  await setAppDirectory();
  await setPokemonDatabase();
}

Future setPokemonDatabase() async {
  objectbox = await Objectbox.init();
  if (objectbox.isEmpty()) {
    final stringData = await File('lib/assets/pokemons.json').readAsString();

    var json = jsonDecode(stringData);
    for (var i = 0; i < maxPokemonNumber; i++) {
      PokemonModel pokemon =
          PokemonModel(id: json[i]['id'], name: json[i]['name']);
      objectbox.insertPokemon(pokemon);
    }
  }
}

Future setAppDirectory() async {
  Directory? tempDir = Platform.isAndroid
      ? await getExternalStorageDirectory()
      : await getApplicationDocumentsDirectory();
  directoryApp = Directory('${tempDir!.path}\\$appName');

  await directoryApp!.create();
  var svgDirectory = Directory('${directoryApp!.path}\\svg');
  await svgDirectory.create();

  pokemonSvgPath = svgDirectory.path;
}
