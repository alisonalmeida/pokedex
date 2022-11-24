// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.list,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Pokedex',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Gives background information on the habitat or activities of a Pokemon in the wild or other information on the Pokemons\'s history or anatomy',
                style: TextStyle(color: Colors.grey),
              ),
              Container(height: 10),
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.arrow_drop_down)),
              ),
              FutureBuilder(
                future: PokeAPI.getObjectList<Pokemon>(1, 5),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    List<Pokemon?>? listPokemons = snapshot.data;

                    if (listPokemons == null) {
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: listPokemons.length,
                          itemBuilder: (context, index) {
                            Pokemon? pokemon = listPokemons[index];
                            return Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Text(
                                  '# ${pokemon!.id.toString()}',
                                  style: TextStyle(
                                      fontSize: 80,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[300]),
                                ),
                                Row(
                                  children: [
                                    Image.network(
                                      pokemon.sprites!.frontDefault!,
                                      fit: BoxFit.fitWidth,
                                    ),
                                    Text(
                                      pokemon.name!.replaceFirst(
                                          pokemon.name![0],
                                          pokemon.name![0].toUpperCase()),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    }
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Column(
            children: [
              Container(
                color: Colors.black,
                height: 10,
              ),
              BottomAppBar(
                elevation: 0,
                child: Container(
                  color: Color.fromARGB(255, 248, 14, 10),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.catching_pokemon, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.list, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                color: Colors.transparent,
              )
            ],
          ),
        ));
  }
}
