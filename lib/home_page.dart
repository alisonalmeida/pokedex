// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';
import 'package:pokedex/empty_pokedex_screen.dart';
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
        backgroundColor: Colors.grey[100],
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              pinned: true,
              elevation: 0,
              centerTitle: true,
              expandedHeight: 500,
              title: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'Quem é esse Pokemon?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                  background: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Image(
                  image: AssetImage(
                      'lib/assets/img/ash-ketchum-pokemon-champion-740x308.jpg'),
                  fit: BoxFit.cover,
                ),
              )),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (context, index) => FutureBuilder(
                future: pickPokemon(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      snapshot.connectionState == ConnectionState.none ||
                      snapshot.connectionState == ConnectionState.active) {
                    return EmptyPokedexScreen();
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return PokedexScreen(
                      rightPokemon: rightPokemon,
                      otherPokemon1: otherPokemon1,
                      otherPokemon2: otherPokemon2,
                    );
                  } else {
                    return Center(
                      child: Text('ERRO'),
                    );
                  }
                },
              ),
            )),
          ],
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
