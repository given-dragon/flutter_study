import 'package:flutter/material.dart';

void main() => runApp(SimpleThemeApp());

class SimpleThemeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SimpleThemeApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          brightness: Brightness.light,
          primary: Colors.purple,
          secondary: Colors.cyan[600],
        ),
        fontFamily: 'Raleway',
      ),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Simple Theme App'),
        ),
        body: const Center(
          child: Text(
            'This is my custom fonts',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
