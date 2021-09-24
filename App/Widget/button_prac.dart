import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'button prac',
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons'),
        centerTitle: true,
      ),
      body: MyButtons(),
    );
  }
}

class MyButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {},
            onLongPress: () {
              print('Text Button');
            },
            child: Text(
              'Text button',
              style: TextStyle(fontSize: 20.0),
            ),
            style: TextButton.styleFrom(
                primary: Colors.red, backgroundColor: Colors.grey),
          ),
          ElevatedButton(
            onPressed: () {
              print('Elevated button');
            },
            child: Text('Elevated Button'),
            style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 0.0),
          ),
          OutlinedButton(
            onPressed: () {
              print('Outlined Button');
            },
            child: Text('Outlined Button'),
            style: OutlinedButton.styleFrom(
                primary: Colors.green,
                side: BorderSide(color: Colors.black87, width: 2.0)),
          ),
          TextButton.icon(
            onPressed: () {
              print('Icon Button');
            },
            icon: Icon(
              Icons.home,
              size: 30.0,
              //color: Colors.black87, //아이콘의 색을 지정하지 않으면 style의 primary값으로 들어감
            ),
            label: Text('Go to home'),
            style: TextButton.styleFrom(
              primary: Colors.purple,
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              print('ElevatedButton Icon');
            },
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: Text('Go to home'),
            style: ElevatedButton.styleFrom(
                primary: Colors.black,
                minimumSize: Size(200, 50)), //버튼의 크기조정을 하고싶다면 minimumsize
          ),
          OutlinedButton.icon(
              onPressed: () {
                print('Outlined button icon');
              },
              icon: Icon(Icons.home, color: Colors.black),
              label: Text('Go to home'),
              style: OutlinedButton.styleFrom(primary: Colors.black)),
          ElevatedButton.icon(
            onPressed: null,
            icon: Icon(Icons.home),
            label: Text('Go to home'),
            style: ElevatedButton.styleFrom(
                primary: Colors.black, onSurface: Colors.pink //비활성화된 버튼의 색도 변경함
                ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            buttonPadding: EdgeInsets.all(20),
            children: [
              TextButton(onPressed: () {}, child: Text('TextButton')),
              ElevatedButton(onPressed: () {}, child: Text('ElebatedButton'))
            ],
          )
        ],
      ),
    );
  }
}
