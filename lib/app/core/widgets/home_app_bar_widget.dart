import 'package:flutter/material.dart';

import 'custom_drawer_widget.dart';

class MyHomePageWidget extends StatefulWidget {
  const MyHomePageWidget({super.key, required this.title});

  final String title;

  @override
  State<MyHomePageWidget> createState() => _MyHomePageStateWidget();
}

class _MyHomePageStateWidget extends State<MyHomePageWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
