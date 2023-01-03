// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  CheckPokemonData checkPokemonData = CheckPokemonData();

  @override
  void initState() {
    isAppCompleted();
    super.initState();
  }

  showDownloadProgress(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
              content: Center(
            child: Opacity(
                opacity: 1, child: SvgPicture.asset(kpathPokeballLottie)),
          )),
        );
      },
    );
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
      if (continueDownload) {
        await checkPokemonData.downloadPokemonData();
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
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, border: Border.all(width: 3)),
                height: 100,
                width: 100,
                child: Lottie.asset(kpathPokeballLottie),
              ),
              Text(message, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
