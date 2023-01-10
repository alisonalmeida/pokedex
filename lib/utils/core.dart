import 'dart:async';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:pokeapi/model/pokemon/pokemon-specie.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/utils/consts.dart';
import 'package:pokeapi/pokeapi.dart';

Directory? directoryApp;
String path = '';
String pokemonSvgPath = '';
final Dio dio = Dio();
double progress = 0;
NumberFormat formatter = NumberFormat('000');
String imagePokemon = 'https://assets.pokemon.com/assets/cms2/img/pokedex/full';

class CheckPokemonData {
  int minRange = 0;
  int maxRange = 0;
  CheckPokemonData({required this.maxRange, required this.minRange});

  Stream<double?> downloadPokemonData() async* {
    for (var i = 1; i <= maxPokemonNumber; i++) {
      if (!await _containSvgPokemonData(i)) {
        await dio.download(
            deleteOnError: false,
            options: Options(receiveTimeout: 0),
            '$imagePokemon/${formatter.format(i)}.png',
            '$pokemonSvgPath\\$i.png');
      }

      if (!_containDbPokemonData(i)) {
        var apiPokemon = await PokeAPI.getObject<Pokemon>(i);

        var apiSpecies = await PokeAPI.getObject<PokemonSpecie>(i);

        var pokemonInformation = apiSpecies!.flavorTextEntries!
            .firstWhere((element) => element.language!.name == 'en');
        var information = pokemonInformation.flavorText!.replaceAll('\n', ' ');
        information = information.replaceAll('\f', ' ');

        PokemonModel newPokemon = PokemonModel(
            id: apiPokemon!.id!,
            name: apiPokemon.name!,
            height: apiPokemon.height!,
            weight: apiPokemon.weight!,
            photoPath: '$pokemonSvgPath\\$i.png',
            informations: information);

        for (var element in apiPokemon.types!) {
          PokemonType pokemonType = PokemonType(name: element.type!.name!);
          newPokemon.types.add(pokemonType);
        }
        objectbox.insertPokemon(newPokemon);
      }

      progress = i / maxPokemonNumber;

      yield progress;
    }
  }

  Future<bool> _containSvgPokemonData(int index) async {
    var v = await File('$pokemonSvgPath\\$index.png').exists();
    return v;
  }

  bool _containDbPokemonData(int index) {
    return objectbox.containPokemon(index);
  }

  Future<bool> checkAppData() async {
    bool isAppCompleted = true;
    for (var i = 1; i <= maxPokemonNumber; i++) {
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
  await getAppDirectory();
}

Future getAppDirectory() async {
  Directory? tempDir = Platform.isAndroid
      ? await getExternalStorageDirectory()
      : await getApplicationDocumentsDirectory();
  directoryApp = Directory('${tempDir!.path}\\$appName');

  await directoryApp!.create();
  path = directoryApp!.path;
  pokemonSvgPath = '$path\\png';
}
