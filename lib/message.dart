import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  MessageScreenState createState() => MessageScreenState();
}

class MessageScreenState extends State<Message> {
  TextEditingController textEditingController = TextEditingController();
  String savedMessage = '';
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                hintText: 'Enter your message',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Provider.of<MyDataProvider>(context, listen: false)
                    .updateMessage(textEditingController.text);
                textEditingController.clear();
                setState(() {
                  savedMessage = 'Saved successfully!';
                });
              },
              child: const Text('Save', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 16),
            Text(
              savedMessage,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
