import 'package:flutter/material.dart';

void main() => runApp(TextDemo());

class TextDemo extends StatelessWidget {
  String _title = 'Text widget demo';
  String _name = 'tony stark';
  String _longText = '''
  안녕하셍요.앙ㄴ녕렁ㄴ가나다라마바사아자차카타파하아야어여오요우유으이한글날삼일절대한독립만세
  ''';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: Text(_title)),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('simple text'),
              Text(
                'Styled Text with $_name',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    background: Paint()
                      ..color = Color(0xFFDCEDC8)
                      ..style = PaintingStyle.fill,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                _longText,
                overflow: TextOverflow.ellipsis,
              )
            ]),
      ),
    );
  }
}
