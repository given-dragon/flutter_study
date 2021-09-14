import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: 'Stateless Widget Demo',
    home: Scaffold(
      appBar: AppBar(title: const Text('Stateless widget demo')),
      body: _FirstStatelessWidget(),
    )
  )
);

class _FirstStatelessWidget extends StatelessWidget{  
  @override
  Widget build(BuildContext context) {
    return const Text('This is stateless widget');
  }
}