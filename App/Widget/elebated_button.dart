import 'package:flutter/material.dart';

void main() => runApp(ButtonDemo());

class ButtonDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ButtonDemoState();
}

class ButtonDemoState extends State<ButtonDemo> {
  String _title = 'Button widget demo';
  String _buttonState = 'OFF';

  void onClick() {
    print('onClick()');
    setState(() {
      if (_buttonState == 'OFF') {
        _buttonState = 'ON';
      } else {
        _buttonState = 'OFF';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text(_title)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: onClick, child: Text('사각버튼')),
            Text('$_buttonState'),
            ElevatedButton(
              onPressed: onClick,
              child: Text('둥근버튼'),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)))),
            )
          ],
        ),
      ),
    );
  }
}
