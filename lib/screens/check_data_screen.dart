// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_literals_to_create_immutables

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/screens/home_page.dart';
import 'package:pokedex/utils/consts.dart';
import 'package:pokedex/utils/core.dart';

class CheckDataPage extends StatefulWidget {
  const CheckDataPage({super.key});

  @override
  State<CheckDataPage> createState() => _CheckDataPageState();
}

class _CheckDataPageState extends State<CheckDataPage> {
  String message = 'Checando os Dados ...';
  bool continueDownload = false;
  bool downloadCompleted = false;
  PokemonData pokemonData = PokemonData();
  NumberFormat formatter = NumberFormat('00.0');

  @override
  void initState() {
    isAppCompleted();
    super.initState();
  }

  isAppCompleted() async {
    if (await pokemonData.checkAppData(1, 10)) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  HomePage(),
          ));
    } else {
      continueDownload = await showAlertDownloadMessage(context);
      setState(() {});
      if (!continueDownload) {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(),
      ),
    );
  }
}
