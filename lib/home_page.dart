// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
            Expanded(
                child: FutureBuilder(
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
                    return ListView.builder(
                      itemCount: listPokemons.length,
                      itemBuilder: (context, index) {
                        Pokemon? pokemon = listPokemons[index];
                        return Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Text(
                              '# ${pokemon!.id.toString()}',
                              style: TextStyle(
                                  fontSize: 100,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[200]),
                            ),
                            Row(
                              children: [
                                Image.network(
                                  pokemon.sprites!.frontDefault!,
                                  width: 200,
                                ),
                                Text(pokemon.name!.replaceFirst(
                                    pokemon.name![0],
                                    pokemon.name![0].toUpperCase()))
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  }
                }
                return Container();
              },
            ))
          ],
        ),
      ),
    );
  }
}
