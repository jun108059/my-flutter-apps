import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('YoungJun Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}


class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 5; // 매번 새로 생성할 필요 없기 때문에 한번만 초기화
  int rightDiceNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() { // HotReload 없이 Image 바뀜 - Trigger
                  leftDiceNumber = Random().nextInt(6) + 1; // Random Number
                  rightDiceNumber = Random().nextInt(6) + 1;
                });
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),

          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() { // HotReload 없이 Image 바뀜 - Trigger
                  leftDiceNumber = Random().nextInt(6) + 1; // Random Number
                  rightDiceNumber = Random().nextInt(6) + 1; // Random Number
                });
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
