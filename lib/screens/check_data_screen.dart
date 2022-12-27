// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/home_page.dart';
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
  double? value;

  @override
  void initState() {
    isAppCompleted();

    super.initState();
  }

  Future isAppCompleted() async {
    if (await checkAppData()) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
    } else {
      continueDownload = await showAlertDownloadMessage(context);
      if (continueDownload) {
        await downloadPokemonData();
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      } else {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Lottie.asset(kpathPokeballLottie),
            ),
            const SizedBox(height: 50),
            Text(
              message,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            LinearProgressIndicator(
              backgroundColor: Colors.red.shade200,
              color: redColor,
              minHeight: 10,
              value: value,
            ),
          ],
        ),
      ),
    );
  }
}
