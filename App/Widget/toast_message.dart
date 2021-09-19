import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'toast message',
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toast Message'),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            flutterToast();
          },
          child: Text('Toast'),
          style: TextButton.styleFrom(
              primary: Colors.black, backgroundColor: Colors.blue),
        ),
      ),
    );
  }
}

void flutterToast() {
  //색상이 안바뀜,,,
  Fluttertoast.showToast(
      msg: 'TOAST!!',
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.redAccent,
      fontSize: 20,
      textColor: Colors.green,
      toastLength: Toast.LENGTH_SHORT);
}
