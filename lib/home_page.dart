// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/pokemon_model.dart';
import 'package:pokedex/screens/pokemon_detailed_screen.dart';
import 'package:pokedex/utils/colors.dart';
import 'package:pokedex/utils/consts.dart';
import 'package:pokedex/utils/red_ball.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    double numberPokemonInScreen = 1;
    if (width > 1000) {
      numberPokemonInScreen = 5;
    } else if (width <= 1000 && width > 600) {
      numberPokemonInScreen = 3;
    } else {
      numberPokemonInScreen = 2;
    }
    NumberFormat formatter = NumberFormat('000');
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
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
                title: Image.asset(kpathPokemonLogo, fit: BoxFit.scaleDown),
              ),
              elevation: 0,
            ),
            SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: numberPokemonInScreen.toInt()),
                delegate: SliverChildBuilderDelegate(
                  childCount: objectbox.getAllPokemons().length,
                  (context, index) {
                    Pokemon? pokemon = objectbox.getPokemon(index + 1);
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailedPokemonPage(pokemon: pokemon),
                          )),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: height,
                            width: width,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade100,
                                border: Border.all(width: 2),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(2, 3),
                                      color: Colors.blue.shade700)
                                ]),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [redBall, redBall],
                                ),
                                SizedBox(height: 10),
                                Expanded(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: height - 50,
                                        width: width - 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(offset: Offset(2, 2))
                                            ],
                                            color: blueColor,
                                            border: Border.all()),
                                      ),
                                      Container(
                                        height: height - 80,
                                        width: width - 80,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                kpathPokeballBackground),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height - 100,
                                        width: width - 100,
                                        child: Hero(
                                          tag: pokemon!.photoPath!,
                                          child: SvgPicture.file(
                                            File(pokemon.photoPath!),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    redBall,
                                    Icon(
                                      Icons.menu,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          //Pokemon Number
                          Positioned(
                            right: 20,
                            top: 0,
                            child: Container(
                              child: Text(
                                '  #${formatter.format(pokemon.id)}  ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  border: Border.all(),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(2, 3),
                                        color: Colors.black)
                                  ]),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
      /**
       * floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset('lib/assets/img/pokebola.png'),
        ),
        onPressed: () async {
          downloadPokemonData();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       */
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
      ),
    );
  }
}
