import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/pokemon_model.dart';
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
          '$pokemonSvgPath\\$i.svg');
    }

    if (!containDbPokemonData(i)) {
      var v = await dio.get('https://pokeapi.co/api/v2/pokemon/$i/');

      Pokemon p = Pokemon.fromMap(v.data);

      Pokemon pokemon = Pokemon(
        id: p.id,
        name: p.name,
        height: p.height,
        weight: p.weight,
        photoPath: '$pokemonSvgPath\\$i.svg',
      );
      objectbox.insertPokemon(pokemon);
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

    
    isAppCompleted = await containSvgPokemonData(i);
    if (!isAppCompleted) {
      break;
    }
    if (!isAppCompleted) {
      break;
    }
  }
  return isAppCompleted;
}
