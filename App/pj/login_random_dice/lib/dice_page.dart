import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class Dice extends StatefulWidget {
  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int Ldice = 1;
  int Rdice = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dice Game'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: DicePage(),
        backgroundColor: Colors.red[300]);
  }

  Widget DicePage() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Row(
            children: <Widget>[
              Expanded(child: Image.asset('image/dice$Ldice.png')),
              SizedBox(width: 20),
              Expanded(child: Image.asset('image/dice$Rdice.png'))
            ],
          ),
        ),
        SizedBox(
          height: 50.0,
        ),
        ElevatedButton(
          onPressed: RollDice,
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 35.0,
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.orangeAccent, minimumSize: Size(100.0, 50.0)),
        )
      ],
    ));
  }

  void RollDice() {
    setState(() {
      Ldice = Random().nextInt(6) + 1;
      Rdice = Random().nextInt(6) + 1;
    });
    showToast('Left dice: ($Ldice), Right dice: ($Rdice)');
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM);
}
