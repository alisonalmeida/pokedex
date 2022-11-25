// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';

import 'package:pokeapi/pokeapi.dart';
import 'package:pokedex/home_page.dart';

late Pokemon? pokemon;
late List<Types>? types;
List<String>? typeNames = [];

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  pokemon = await PokeAPI.getObject(1);
  types = pokemon!.types;
  for (var type in types!) {
    typeNames!.add(type.type!.name!);
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
