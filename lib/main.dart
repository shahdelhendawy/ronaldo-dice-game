
import 'dart:math';
import 'package:flutter/material.dart';
import 'dice.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ronaldo Dice Game",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
      ),
      home: playDice(),
    );
  }
}

class playDice extends StatefulWidget {
  @override
  State<playDice> createState() => playDiceState();
}

class playDiceState extends State<playDice> {
  int value_1 = 1;
  int value_2 = 1;
  int total = 2;

  String image = 'assets/images/ronaldo_anticipation.png';

  void reset() {
    setState(() {
      value_1 = 1;
      value_2 = 1;
      total = 2;
      image = 'assets/images/ronaldo_anticipation.png';
    });
  }

  void roll() {
    setState(() {
      value_1 = Random().nextInt(6) + 1;
      value_2 = Random().nextInt(6) + 1;
      total = value_1 + value_2;

      if (total >= 10) {
        image = 'assets/images/ronaldo_win.png';
      } else {
        image = 'assets/images/ronaldo_sad.png';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ronaldo Dice Game'),
        centerTitle: true,
        leading: Icon(Icons.casino),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Total: $total",
              style: TextStyle(fontSize: 28),
            ),
            SizedBox(height: 20),
            Image.asset(
              image,
              height: 180,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Dice(value: value_1),
                Dice(value: value_2),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: roll,
                    child: Text("Roll"),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: reset,
                    child: Text("Reset"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
