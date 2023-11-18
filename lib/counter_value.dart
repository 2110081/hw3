import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class CounterValue extends StatelessWidget {
  const CounterValue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Value')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<MyDataProvider>(
              builder: (context, counterProvider, child) {
                return Text(
                  "${counterProvider.counter}",
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            const Text(
              "This is the Counter value from the 'Counter' screen due to 'provider.dart'.",
              style: TextStyle(
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
