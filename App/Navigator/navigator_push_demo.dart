import 'package:flutter/material.dart';

void main() => runApp(NavigatorPushDemo());

class NavigatorPushDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  _showNextPage(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => NextPage()));

  _showSecondPage(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => SecondPage()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Navigator Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => _showNextPage(context),
                child: const Text('next page')),
            ElevatedButton(
                onPressed: () => _showSecondPage(context),
                child: const Text('second page'))
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  static _backToMainPage(BuildContext context) => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('next page'),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () => _backToMainPage(context),
        child: const Text('back'),
      )),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second page'),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () => NextPage._backToMainPage(context),
        child: const Text('back'),
      )),
    );
  }
}
