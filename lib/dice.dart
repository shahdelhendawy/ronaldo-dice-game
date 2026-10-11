
import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  final int value;

  const Dice({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.green,
          width: 3,
        ),
      ),
      child: Text(
        ['⚀', '⚁', '⚂', '⚃', '⚄', '⚅'][value - 1],
        style: const TextStyle(
          fontSize: 80,
          color: Colors.black,
        ),
      ),
    );
  }
}
