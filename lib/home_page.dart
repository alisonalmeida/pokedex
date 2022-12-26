// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/pokemon_model.dart';
import 'package:pokedex/utils/colors.dart';
import 'package:pokedex/utils/consts.dart';
import 'package:pokedex/utils/initialization.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 120,
        title: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: SizedBox(
            height: 70,
            child: Image.asset(kPathpokemonLogo),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            /**
                 * ElevatedButton(
                  onPressed: () {
                    for (var element in objectbox.getAllPokemons()) {
                      print(element);
                    }
                  },
                  child: Text('Mosta todos'),
                ),
                ElevatedButton(
                  onPressed: () {
                    objectbox.clear();
                  },
                  child: Text('Limpar db'),
                ),
                 */

            ListView.builder(
              padding: EdgeInsets.all(10),
              shrinkWrap: true,
              itemCount: 10, //objectbox.getAllPokemons().length,
              itemBuilder: (context, index) {
                Pokemon? pokemon = objectbox.getPokemon(index + 1);
                String name = pokemon!.name.toUpperCase();
                String id = pokemon.id.toString();
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(),
                      boxShadow: [
                        BoxShadow(offset: Offset(2, 3), color: Colors.black)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      trailing: Text(
                        name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: SizedBox(
                        height: 50,
                        width: 50,
                        child: SvgPicture.file(
                          File(pokemon.photoPath!),
                        ),
                      ),
                      leading: Text('# $id'),
                    ),
                  ),
                );
              },
            )
          ],
        ),
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
