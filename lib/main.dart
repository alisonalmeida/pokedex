// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pokedex/objectbox_helper.dart';
import 'package:pokedex/screens/check_data_screen.dart';
import 'package:pokedex/utils/core.dart';

// BASE DESIGN: https://dribbble.com/shots/19287892-Pokemon-Neobrutalism

late Objectbox objectbox;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppConfigurations();
  objectbox = await Objectbox.init();
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
      home: CheckDataPage(),
    );
  }
}
