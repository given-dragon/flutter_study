import 'package:flutter/material.dart';

void main() => runApp(NavigatorRoutsDemo());

class NavigatorRoutsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/next': (context) => NextPage(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  _showNextPage(BuildContext context) => Navigator.pushNamed(context, '/next');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Navigator Routes Demo')),
      body: Center(
          child: ElevatedButton(
              onPressed: () => _showNextPage(context),
              child: Text('next page'))),
    );
  }
}

class NextPage extends StatelessWidget {
  _backToMainPage(BuildContext context) => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('next page')),
      body: Center(
        child: ElevatedButton(
            onPressed: () => _backToMainPage(context),
            child: Text('back to mainpage')),
      ),
    );
  }
}
