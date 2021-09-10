import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: 'Stateful Widget demo',
    home: Scaffold(
      appBar: AppBar(title: const Text('Stateless -> Stateful widget demo')),
      body: _FirstStatefulWidget(),
    ),
  )
);

class _FirstStatefulWidget extends StatefulWidget{
  @override
  State createState() => _FirstStatefulWidgetState();
}

class _FirstStatefulWidgetState extends State<_FirstStatefulWidget>{
  @override
  Widget build(BuildContext context) {
    return const Text("This is Stateful Widget");
  }
  
}
