import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'stateful widget lifr cycle',
      home: Scaffold(
        appBar: AppBar(title: const Text('checking lifecycle')),
        body: _MyStatefulWidget(),
      ),
    ));

class _MyStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<_MyStatefulWidget> {
  String _buttonState = '';

  @override
  void initState() {
    super.initState();
    print('initState(): 기본값을 설정합니다.');
    _buttonState = 'OFF';
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies() 호출됨');
  }

  @override
  Widget build(BuildContext context) {
    print('build() 호출됨');
    return Column(
      children: <Widget>[
        ElevatedButton(onPressed: _onClick, child: const Text('버튼을 누르세요')),
        Row(
          children: <Widget>[
            Text('버튼상태: '),
            Text(_buttonState),
          ],
        )
      ],
    );
  }

  dynamic _onClick() {
    print('_onClick() 호출됨');
    setState(() {
      print('setState() 호출됨');
      if (_buttonState == 'OFF') {
        _buttonState = 'ON';
      } else {
        _buttonState = 'OFF';
      }
    });
  }

  @override
  void didUpdateWidget(covariant _MyStatefulWidget oldWidget) {
    print('didUpdateWidget() 호출됨');
  }

  @override
  void deactivate() {
    print('deactive() 호출됨');
  }

  @override
  void dispose() {
    print('dispose() 호출됨');
  }
}
