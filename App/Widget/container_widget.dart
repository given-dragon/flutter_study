import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'container_widget',
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Container(
            child: Text('Container widget'),
            color: Colors.orange,
            width: 100,
            height: 100,
            //margin: EdgeInsets.all(num) 전 방향으로 margin남김
            margin: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
            padding: EdgeInsets.all(15)),
      ),
    );
  }
}
