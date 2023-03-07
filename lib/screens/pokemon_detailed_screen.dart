// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pokedex/components/pokemon_type.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/utils/colors.dart';
import 'package:pokedex/utils/consts.dart';

class DetailedPokemonPage extends StatelessWidget {
  PokemonModel pokemon;

  DetailedPokemonPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          pokemon.name.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.catching_pokemon_sharp),
          )
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  height: height * 0.9,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [BoxShadow(offset: Offset(5, 5))],
                      color: blueColor,
                      border: Border.all()),
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(kpathPokeballBackground),
                      ),
                    ),
                    child: Hero(
                      tag: 'pokemon.photoPath!',
                      child: FractionallySizedBox(
                        heightFactor: 0.8,
                        widthFactor: 0.8,
                        child: Image.file(
                          File('pokemon.photoPath!'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Wrap(
                spacing: 10,
                children: pokemon.types
                    .map((element) => PokemonTypeSvg(pokemonType: element))
                    .toList(),
              ),
              SizedBox(height: 10),
              DefaultTabController(
                length: 4,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TabBar(
                        labelPadding: EdgeInsets.symmetric(horizontal: 15),
                        indicatorWeight: 0,
                        indicator: BoxDecoration(
                          color: Colors.limeAccent,
                          border: Border.all(),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        labelColor: Colors.black,
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        unselectedLabelStyle:
                            TextStyle(fontWeight: FontWeight.normal),
                        tabs: [
                          Tab(text: 'About'),
                          Tab(text: 'Stats'),
                          Tab(text: 'Moves'),
                          Tab(text: 'Evolutions'),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(offset: Offset(3, 5)),
                          ],
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                          ),
                          border: Border.all(),
                        ),
                        height: height / 3,
                        child: TabBarView(children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text(
                                 ' pokemon.informations',
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.work),
                                        Text(
                                          'Weigth',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.height),
                                        Text(
                                          'Height',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          color: Colors.lightGreen.shade400,
                                          boxShadow: [
                                            BoxShadow(offset: Offset(1, 2))
                                          ],
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        '{pokemon.weight} Libs',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          color: Colors.lightGreen.shade400,
                                          boxShadow: [
                                            BoxShadow(offset: Offset(1, 2))
                                          ],
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        '{pokemon.height} In',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(),
                          Container(),
                          Container(),
                        ]),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
