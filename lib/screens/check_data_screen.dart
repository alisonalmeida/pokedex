// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/screens/home_page.dart';
import 'package:pokedex/utils/colors.dart';
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
  CheckPokemonData checkPokemonData = CheckPokemonData();

  @override
  void initState() {
    isAppCompleted();
    super.initState();
  }

  isAppCompleted() async {
    if (await checkPokemonData.checkAppData()) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
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
        child: Center(
          child: continueDownload
              ? StreamBuilder(
                  stream: checkPokemonData.downloadPokemonData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        snapshot.connectionState == ConnectionState.none) {
                      return Text('Aguardando',
                          style: TextStyle(fontWeight: FontWeight.bold));
                    }
                    if (snapshot.connectionState == ConnectionState.active) {
                      double progress = snapshot.data!;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Opacity(
                            opacity: progress,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(width: 3)),
                              height: 100,
                              width: 100,
                              child: Lottie.asset(kpathPokeballLottie),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('${(progress * 100).roundToDouble()}%',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          LinearProgressIndicator(
                            minHeight: 10,
                            backgroundColor: Colors.red.shade200,
                            color: Colors.red,
                            value: snapshot.data,
                          )
                        ],
                      );
                    }
                    if (snapshot.hasError) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'))
                        ], content: Text(snapshot.error.toString())),
                      );
                      return Text(snapshot.error.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold));
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Download completo!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 50),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.red)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ));
                              },
                              child: Text('OK'))
                        ],
                      );
                    }
                    return Container();
                  },
                )
              : Column(),
        ),
      ),
    );
  }
}
