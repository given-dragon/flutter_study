import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'column row widget',
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            //mainAxisSize: MainAxisSize.min, 해당 컨테이너가 //children에 맞게 사이즈 설정
            //verticalDirection: VerticalDirection.up, //화면 아래에서부터 쌓임
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly, //동일한 간격으로 정렬됨
            //mainAxisAlignment: MainAxisAlignment.spaceBetween, //스크린의 상,하에 맞게 동일한 간격으로 정렬됨
            //crossAxisAlignment: CrossAxisAlignment.end, //컨테이너의 오른쪽 끝에 정렬
            //crossAxisAlignment: CrossAxisAlignment.stretch, //자식들의 너비를 화면에 꽉 채움
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                color: Colors.white,
                child: Text('Container 1'),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Text('Container 2'),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: Text('Container 3'),
              ),
            ],
          ),
        ));
  }
}
