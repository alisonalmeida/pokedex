// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokeapi/model/game/pokedex.dart';
import 'package:pokeapi/model/item/item-category.dart';
import 'package:pokeapi/model/pokemon/characteristic.dart';
import 'package:pokeapi/model/pokemon/gender.dart';
import 'package:pokeapi/model/pokemon/nature.dart';
import 'package:pokeapi/model/pokemon/pokeathlon-stat.dart';
import 'package:pokeapi/model/pokemon/pokemon-color.dart';
import 'package:pokeapi/model/pokemon/pokemon-specie.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/model/utils/common.dart';
import 'package:pokeapi/pokeapi.dart';
import 'package:pokedex/utils/colors.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Pokemon? pokemon;
  bool isInitialized = false;

  int maxPokemonNumber = 151;

  @override
  void initState() {
    super.initState();
  }

  Future pickPokemon() async {
    Random random = Random();
    print('object');
    pokemon = await PokeAPI.getObject(random.nextInt(maxPokemonNumber + 1));

    var v = await PokeAPI.getObject<Characteristic>(1);
    print('-------------');
    print(v);
    //AASSSISTE ALGUMA AULA DE POKEAPI NA NET
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 10),
                Text(
                  'Quem é esse Pokemon?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FutureBuilder(
                  future: pickPokemon(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        snapshot.connectionState == ConnectionState.none) {
                      return Expanded(
                        child: Container(
                          color: Colors.grey[300],
                          child: Center(
                              child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Lottie.asset(
                                'lib/assets/animations/pokeball-animation.json'),
                          )),
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return ListView(
                        children: [
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Text(
                                    pokemon!.name == ''
                                        ? '-'
                                        : pokemon!.name!.toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  height: 40,
                                  decoration: screenDecoration,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Image.network(
                                      pokemon!.sprites!.frontDefault!,
                                      fit: BoxFit.fitHeight),
                                  height: 250,
                                  decoration: screenDecoration,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Text(
                                  '  #${pokemon!.id} - Altura: ${pokemon!.height! * 2.54} cm - Peso: ${pokemon!.weight! * 453 / 1000} kg',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                decoration: screenDecoration,
                              ))
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Text(
                                  pokemon!.forms.toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                decoration: screenDecoration,
                              ))
                            ],
                          ),
                        ],
                      );
                    } else {
                      return Center(
                        child: Text('ERRO'),
                      );
                    }
                  },
                ),
              ],
            )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset('lib/assets/img/pokebola.png'),
          ),
          onPressed: () async {
            await pickPokemon();
            setState(() {});
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
