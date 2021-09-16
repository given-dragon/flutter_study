import 'package:flutter/material.dart';

void main() => runApp(ScaffoldApp());

class ScaffoldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'material app',
        home: Scaffold(
          appBar: AppBar(title: const Text('real material app')),
          body: const Text('This is real material app'),
        ));
  }
}
