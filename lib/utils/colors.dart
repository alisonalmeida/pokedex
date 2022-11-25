import 'package:flutter/material.dart';

const redColor = Color.fromARGB(255, 248, 14, 10);

Decoration screenDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    gradient: LinearGradient(
        begin: AlignmentDirectional.topCenter,
        end: AlignmentDirectional.bottomCenter,
        colors: [
          Color.fromARGB(255, 184, 222, 255),
          Color.fromARGB(255, 218, 238, 255)
        ]),
    border: Border.all());
