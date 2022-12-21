// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';
import 'package:pokedex/error_pokedex_screen.dart';
import 'package:pokedex/loading_pokedex_screen.dart';
import 'package:pokedex/pokedex_screen.dart';
import 'package:pokedex/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Pokemon? rightPokemon;
  late Pokemon? otherPokemon1;
  late Pokemon? otherPokemon2;
  bool isInitialized = false;

  int maxPokemonNumber = 151;

  @override
  void initState() {
    super.initState();
  }

  Future pickPokemon() async {
    Random random = Random();
    int numberRightPokemon = random.nextInt(maxPokemonNumber + 1);

    rightPokemon = await PokeAPI.getObject(numberRightPokemon);
    otherPokemon1 =
        await PokeAPI.getObject(random.nextInt(maxPokemonNumber + 1));
    otherPokemon2 =
        await PokeAPI.getObject(random.nextInt(maxPokemonNumber + 1));

    String audioasset = 'lib/assets/audio/quem-e-esse-pokemon.ogg';

    AudioPlayer player = AudioPlayer();
    ByteData bytes = await rootBundle.load(audioasset); //load audio from assets
    Uint8List audiobytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

    await player.play(BytesSource(audiobytes));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[400],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all()),
                  child: Text(
                    'Quem é esse Pokemon?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FutureBuilder(
                  future: pickPokemon(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        snapshot.connectionState == ConnectionState.none ||
                        snapshot.connectionState == ConnectionState.active) {
                      return LoadingPokedexScreen();
                    } else if (snapshot.connectionState ==
                            ConnectionState.done &&
                        snapshot.hasData) {
                      return PokedexScreen(
                        rightPokemon: rightPokemon,
                        otherPokemon1: otherPokemon1,
                        otherPokemon2: otherPokemon2,
                      );
                    } else {
                      return ErrorPokedexScreen();
                    }
                  },
                ),
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
          onPressed: () {
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
