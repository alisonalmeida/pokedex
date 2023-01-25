// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:pokedex/components/pokemon_square.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/screens/check_data_screen.dart';
import 'package:pokedex/screens/pokemon_detailed_screen.dart';
import 'package:pokedex/utils/colors.dart';
import 'package:pokedex/utils/consts.dart';
import 'package:pokedex/utils/core.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int minRange = 1;
  int maxRange = 10;
  PokemonData pokemonData = PokemonData();
  Future<bool> checkData() async {
    return pokemonData.checkAppData(minRange, maxRange);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    double numberPokemonInScreen = 1;
    if (width > 1000) {
      numberPokemonInScreen = 5;
    } else if (width <= 1000 && width > 600) {
      numberPokemonInScreen = 2;
    } else {
      numberPokemonInScreen = 1;
    }
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
        future: checkData(),
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.hasData) {
            snapshot.data!
                ? StreamBuilder(
                    stream: pokemonData.downloadPokemonData(),
                    builder: (context, snapshot) {
                      return CustomScrollView(
                        slivers: [
                          SliverAppBar(
                            leading: Container(),
                            snap: false,
                            pinned: false,
                            floating: false,
                            expandedHeight: height / 6,
                            toolbarHeight: height / 5,
                            backgroundColor: Colors.grey.shade100,
                            flexibleSpace: FlexibleSpaceBar(
                              centerTitle: true,
                              title: Image.asset(kpathPokemonLogo,
                                  fit: BoxFit.scaleDown),
                            ),
                          ),
                          SliverGrid(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: numberPokemonInScreen.toInt(),
                            ),
                            delegate: SliverChildBuilderDelegate(
                              childCount: objectbox.getAllPokemons().length,
                              (context, index) {
                                PokemonModel? pokemon =
                                    objectbox.getPokemon(index + 1);
                                return GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailedPokemonPage(
                                                pokemon: pokemon),
                                      )),
                                  child: PokemonSquare(
                                    pokemon: pokemon!,
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      );
                    })
                : Container();
          }
          return Container();
        },
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset('lib/assets/img/pokebola.png'),
        ),
        onPressed: () {
          //objectbox.clear();
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        minRange -= 10;
                        maxRange -= 10;
                        setState(() {});
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                    Text(
                      '$minRange/$maxRange',
                      style: TextStyle(color: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        minRange += 10;
                        maxRange += 10;
                        setState(() {});
                      },
                      child: Icon(Icons.arrow_forward),
                    )
                  ],
                ),
                color: redColor,
                height: 50,
              ),
              color: Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
