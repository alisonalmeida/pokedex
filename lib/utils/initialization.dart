import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/pokemon_model.dart';

Directory? directoryApp;
int maxPokemonNumber = 251;
// limit from API: 10249
Dio dio = Dio();

Future initAppConfigurations() async {
  await getAppDirectory();
}

Future getAppDirectory() async {
  directoryApp = Platform.isAndroid
      ? await getExternalStorageDirectory()
      : await getApplicationDocumentsDirectory();
}

Future downloadPokemonData() async {
  String path = directoryApp!.path;
  String pokemonSvgPath = '$path\\pokemon\\svg\\';

  for (var i = 1; i <= maxPokemonNumber; i++) {
    bool alreadyExistsSvg = await File('$pokemonSvgPath$i.svg').exists();
    bool alreadyExistsPokemonData = objectbox.containPokemon(i);

    if (!alreadyExistsSvg) {
      await dio.download(
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/$i.svg',
          '$path/pokemon/svg/$i.svg');
    }
    if (!alreadyExistsPokemonData) {
      var v = await dio.get('https://pokeapi.co/api/v2/pokemon/$i/');

      Pokemon p = Pokemon.fromMap(v.data);

      Pokemon pokemon = Pokemon(
        id: p.id,
        name: p.name,
        height: p.height,
        weight: p.weight,
        photoPath: '$path\\pokemon\\svg\\$i.svg',
      );
      objectbox.insertPokemon(pokemon);
    }

    EasyLoading.showProgress(i / maxPokemonNumber,
        status:
            'Atualizando: ${(i / maxPokemonNumber * 100).roundToDouble()}%');
  }
  EasyLoading.dismiss();
}
