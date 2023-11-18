import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Tap Challenge:',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Consumer<MyDataProvider>(
                builder: (context, counterProvider, child) {
                  return Text(
                    'Counter: ${counterProvider.counter}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<MyDataProvider>(context, listen: false).increment();
              },
              style: ButtonStyle(
                  minimumSize:
                      MaterialStateProperty.all<Size>(const Size(110, 60))),
              child: const Text('Tap', style: TextStyle(fontSize: 25)),
            ),
            const SizedBox(
              height: 110,
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<MyDataProvider>(context, listen: false).reset();
              },
              style: ButtonStyle(
                  minimumSize:
                      MaterialStateProperty.all<Size>(const Size(150, 60))),
              child: const Text('Reset', style: TextStyle(fontSize: 25)),
            ),
          ],
        ),
      ),
    );
  }
}
