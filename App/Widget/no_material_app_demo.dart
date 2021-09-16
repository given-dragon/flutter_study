import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(NoMaterialApp());

class NoMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: const Text(
        'It is not material app',
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
