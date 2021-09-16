import 'package:flutter/material.dart';

void main() => runApp(MyMaterialAPP());

class MyMaterialAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Container(
        padding: EdgeInsets.all(20),
        child: Text('This is material app'),
      ),
    );
  }
}
