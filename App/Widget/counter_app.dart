import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyPage(),
    );
  }

  Widget MyPage() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pushed the button this many times:',
                style: TextStyle(color: Colors.grey[600], fontSize: 15.0)),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headline3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: increment,
                  child: Icon(Icons.add),
                ),
                SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  onPressed: decrement,
                  child: Icon(Icons.remove),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    setState(() {
      counter--;
    });
  }
}
