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
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool isSearching = false;
  List<PokemonModel> _originalList = [];
  List<PokemonModel> _filteredList = [];

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late final AnimationController _animationController;

  @override
  void initState() {
    _originalList = objectbox.getAllPokemons();
    _filteredList = _originalList;
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    _animationController.dispose();
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
        elevation: 0.0,
        title: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return isSearching
                ? Opacity(
                    opacity: _animationController.value,
                    child: TextField(
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.yellow,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _searchController,
                      onChanged: (value) => _searchPokemon(value),
                    ),
                  )
                : Opacity(
                    opacity: _animationController.value == 0
                        ? 1
                        : _animationController.value,
                    child: Text(
                      'Pokedex',
                      style: TextStyle(
                          fontFamily: 'PokemonSolid',
                          fontSize: 30.0,
                          color: Colors.white,
                          decorationColor: Colors.black),
                    ),
                  );
          },
        ),
        actions: [
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = !isSearching;
                    });
                    if (!isSearching) {
                      _animationController.reverse();
                      _searchPokemon('');
                      _searchController.clear();
                      _focusNode.unfocus();
                    } else {
                      _animationController.forward();
                      _focusNode.requestFocus();
                    }
                  },
                  icon: Opacity(
                      opacity: _animationController.value == 0
                          ? 1
                          : _animationController.value,
                      child: Icon(_animationController.value == 1
                          ? Icons.search
                          : Icons.close)));
            },
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SafeArea(child: LayoutBuilder(
        builder: (context, boxConstraints) {
          final int crossAxisCount;
          if (boxConstraints.maxWidth <= 360) {
            crossAxisCount = 2;
          } else if (boxConstraints.maxWidth > 360 &&
              boxConstraints.maxWidth <= 768) {
            crossAxisCount = 3;
          } else if (boxConstraints.maxWidth > 768 &&
              boxConstraints.maxWidth < 1280) {
            crossAxisCount = 4;
          } else {
            crossAxisCount = 7;
          }
          return GridView.builder(
            padding: EdgeInsets.only(top: 10, right: 5, left: 5),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount),
            itemCount: _filteredList.length,
            itemBuilder: (context, index) {
              return PokemonTile(pokemon: _filteredList[index]);
            },
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset('lib/assets/img/pokebola.png'),
        ),
        onPressed: () {
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
