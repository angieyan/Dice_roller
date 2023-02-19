import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
  home: Scaffold(
  backgroundColor: Colors.green.shade300,
  appBar: AppBar(
  backgroundColor: Colors.green.shade300,
  title: const Text('Dice Roller'),
  ),
  body: DicePage(),
  ),
  ));
}
class DicePage extends StatefulWidget {

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice = 6;
  int rightDice = 5;

  void changeDice() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
    });
  }
  void playSound() {
    final player = AudioPlayer();
    player.play(AssetSource('roll_dice.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.0,
          ),
          ElevatedButton(onPressed:  () {
            playSound();
            changeDice();
          },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),

              child: Text('Roll',
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))),
          SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('images/dice$leftDice.png'),
                  ),
                ),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset('images/dice$rightDice.png'),
                    )
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}

