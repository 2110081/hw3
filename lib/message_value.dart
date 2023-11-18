import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class MessageValue extends StatelessWidget {
  const MessageValue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Value')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<MyDataProvider>(
              builder: (context, messageProvider, child) {
                return Text(
                  messageProvider.message,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center
                );
              },
            ),
            const SizedBox(height: 50),
            const Padding(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                "Note: This is the saved message from the 'Message' screen fetched using 'provider.dart'.",
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
