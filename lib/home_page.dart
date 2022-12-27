// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/pokemon_model.dart';
import 'package:pokedex/screens/pokemon_detailed_screen.dart';
import 'package:pokedex/utils/colors.dart';
import 'package:pokedex/utils/consts.dart';
import 'package:pokedex/utils/core.dart';
import 'package:pokedex/utils/red_ball.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double pokemonWidth = 120;
  double pokemonHeight = 120;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: Container(),
              snap: false,
              pinned: false,
              floating: false,
              expandedHeight: 230,
              backgroundColor: Colors.grey.shade100,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: SizedBox(
                    height: 120,
                    child:
                        Image.asset(kpathPokemonLogo, fit: BoxFit.fitHeight)),
              ),
              elevation: 0,
              toolbarHeight: 120,
            ),
            SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                delegate: SliverChildBuilderDelegate(
                  childCount: 10,
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
                            margin: EdgeInsets.all(5),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    redBall,
                                    SizedBox(width: 20),
                                    redBall
                                  ],
                                ),
                                SizedBox(height: 10),
                                Expanded(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: pokemonHeight + 1000,
                                        width: pokemonWidth + 40,
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
                                        height: pokemonHeight + 20,
                                        width: pokemonWidth + 20,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                kpathPokeballBackground),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: pokemonHeight,
                                        width: pokemonWidth,
                                        child: SvgPicture.file(
                                          File(pokemon!.photoPath!),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    redBall,
                                    SizedBox(width: 70),
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
                                '  #${pokemon.id}  ',
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

        /**
         * ListView(
          children: [
            GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              padding: EdgeInsets.all(10),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                Pokemon? pokemon = objectbox.getPokemon(index + 1);

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade100,
                          border: Border.all(width: 2),
                          boxShadow: [
                            BoxShadow(offset: Offset(2, 3), color: Colors.black)
                          ]),
                    ),
                    Positioned(
                      top: 15,
                      left: 100,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: redColor,
                          border: Border.all(),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 15,
                      right: 100,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: redColor,
                          border: Border.all(),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      left: 40,
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: redColor,
                          border: Border.all(),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 10,
                        right: 50,
                        child: Icon(
                          Icons.menu,
                          size: 30,
                        )),
                    Positioned(
                        child: Container(
                      height: 160,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(offset: Offset(2, 2))],
                          color: blueColor,
                          border: Border.all()),
                    )),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(kpathPokeballBackground))),
                    ),
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: SvgPicture.file(
                        File(pokemon!.photoPath!),
                      ),
                    ),
                    //Pokemon Number
                    Positioned(
                      right: 20,
                      top: 0,
                      child: Container(
                        child: Text(
                          '  #${pokemon.id}  ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            border: Border.all(),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(2, 3), color: Colors.black)
                            ]),
                      ),
                    )
                  ],
                );
              },
            )
          ],
        ),
         */
      ),
      floatingActionButton: FloatingActionButton(
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
