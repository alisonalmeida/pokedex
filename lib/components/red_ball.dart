import 'package:flutter/material.dart';
import 'package:pokedex/utils/colors.dart';

class RedBall extends StatelessWidget {
  RedBall({super.key, required this.height, required this.width});
  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.02,
      width: width * 0.02,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: redColor,
        border: Border.all(),
      ),
    );
  }
}
