// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

import 'package:pokedex/components/pokemon_square.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/utils/colors.dart';
import 'package:pokedex/utils/consts.dart';
import 'package:pokedex/utils/core.dart';
import 'package:pokedex/components/pokemon_grid_tile.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PokemonModel> _originalList = [];
  List<PokemonModel> _filteredList = [];

  TextEditingController? _searchController;
  @override
  void initState() {
    _originalList = objectbox.getAllPokemons();
    _filteredList = _originalList;
    super.initState();
  }

  @override
  void dispose() {
    _searchController!.dispose();
    super.dispose();
  }

  void _searchPokemon(String searchText) {
    setState(() {
      _filteredList = _originalList
          .where((pokemon) =>
              pokemon.name.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: Colors.grey[500],
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: _searchPokemon,
                    decoration: InputDecoration(
                      hintText: 'Search for Pokemon',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [Lottie.asset(kpathPokeballLottie)]),
      body: SafeArea(
          child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: _filteredList.length,
        itemBuilder: (context, index) {
          return PokemonTile(pokemon: _filteredList[index]);
        },
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset('lib/assets/img/pokebola.png'),
        ),
        onPressed: () {
          for (var element in objectbox.getAllPokemons()) {
            print(element.name);
          }

          objectbox.clear();
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
                      onPressed: () {},
                      child: Icon(Icons.arrow_back),
                    ),
                    ElevatedButton(
                      onPressed: () {},
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
