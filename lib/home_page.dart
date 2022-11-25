// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int maxPokemonNumber = 151;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              centerTitle: true,
              title: Text(
                'Pokemon',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.grey[100],
              elevation: 0,
            ),
          ],
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
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
                              fontSize: 20, fontWeight: FontWeight.w700),
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
                        child: Image.network(pokemon!.sprites!.frontDefault!,
                            fit: BoxFit.fill),
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
                        '  #${pokemon!.id} - ${typeNames!}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      decoration: screenDecoration,
                    ))
                  ],
                )
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
            Random random = Random();

            pokemon =
                await PokeAPI.getObject(random.nextInt(maxPokemonNumber + 1));

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
