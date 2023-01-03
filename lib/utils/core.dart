import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/model/pokemon_from_api.dart';
import 'package:pokedex/model/pokemon_information.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/utils/consts.dart';

Directory? directoryApp;
String path = '';
String pokemonSvgPath = '';
final Dio dio = Dio();

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
  pokemonSvgPath = '$path\\svg';
}

Future downloadPokemonData() async {
  for (var i = 1; i <= maxPokemonNumber; i++) {
    if (!await containSvgPokemonData(i)) {
      await dio.download(
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/$i.svg',
        '$pokemonSvgPath\\$i.svg'
      );
    }

    if (!containDbPokemonData(i)) {
      var pokeResponse = await dio.get('https://pokeapi.co/api/v2/pokemon/$i/',);

      PokemonFromApi pokemonFromApi = PokemonFromApi.fromMap(pokeResponse.data);

      var speciesResponse = await dio.get(pokemonFromApi.species.url);

      Information information = Information.fromMap(speciesResponse.data);
      String string =
          information.flavorTextEntries.first.flavorText.replaceAll('\n', ' ');
      string = string.replaceAll('\f', ' ');

      Pokemon newPokemon = Pokemon(
          id: pokemonFromApi.id,
          name: pokemonFromApi.name,
          height: pokemonFromApi.height,
          weight: pokemonFromApi.weight,
          photoPath: '$pokemonSvgPath\\$i.svg',
          informations: string);

      for (var element in pokemonFromApi.types) {
        PokemonType pokemonType = PokemonType(name: element.type.name);

        newPokemon.types.add(pokemonType);
      }

      objectbox.insertPokemon(newPokemon);
    }

    EasyLoading.showProgress(i / maxPokemonNumber,
        status:
            'Atualizando: ${(i / maxPokemonNumber * 100).roundToDouble()}%');
  }
  EasyLoading.dismiss();
}

Future<bool> containSvgPokemonData(int index) async {
  var v = await File('$pokemonSvgPath\\$index.svg').exists();
  return v;
}

bool containDbPokemonData(int index) {
  return objectbox.containPokemon(index);
}

Future<bool> checkAppData() async {
  bool isAppCompleted = true;
  for (var i = 1; i <= maxPokemonNumber; i++) {
    isAppCompleted = containDbPokemonData(i);
    if (!isAppCompleted) {
      break;
    }

    isAppCompleted = await containSvgPokemonData(i);

    if (!isAppCompleted) {
      break;
    }
  }
  return isAppCompleted;
}
