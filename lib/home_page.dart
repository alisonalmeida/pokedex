// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:io';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pokedex/error_pokedex_screen.dart';
import 'package:pokedex/loading_pokedex_screen.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/pokemon_model.dart';
import 'package:pokedex/utils/colors.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool downloading = false;
  String progressString = "";
  Dio dio = Dio();
  bool isInitialized = false;
  int maxPokemonNumber = 151;

  @override
  void initState() {
    super.initState();
  }

  Future downloadData() async {
    final dir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    var path = dir!.path;

    for (var i = 1; i <= maxPokemonNumber; i++) {
      await dio.download(
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/$i.svg',
          '$path\\pokemon\\svg\\$i.svg');
      var v = await dio.get('https://pokeapi.co/api/v2/pokemon/$i/');
      EasyLoading.showProgress(i / maxPokemonNumber,
          status:
              'progresso: ${(i / maxPokemonNumber * 100).roundToDouble()}%');

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
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[400],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      for (var element in objectbox.getPokemons()) {
                        print(element);
                      }
                    },
                    child: Text('data'))
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset('lib/assets/img/pokebola.png'),
          ),
          onPressed: () async {
            downloadData();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Column(
            children: [
              Container(
                color: Colors.black,
                height: 10,
              ),
              BottomAppBar(
                shape: CircularNotchedRectangle(),
                elevation: 0,
                child: Container(
                  color: redColor,
                  height: 50,
                ),
                color: Colors.transparent,
              )
            ],
          ),
        ));
  }
}
