import 'package:flutter/material.dart';

class CustomChoiceButton extends StatelessWidget {
  CustomChoiceButton({super.key, required this.name, required this.callback});
  String name;
  VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
          side: MaterialStatePropertyAll(
              BorderSide(width: 1, color: Colors.black)),
          padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
          backgroundColor: MaterialStatePropertyAll(Colors.yellow)),
      onPressed: callback,
      child: Text(
        name.toUpperCase(),
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
