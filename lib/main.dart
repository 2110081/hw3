import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'message.dart';
import 'message_value.dart';
import 'counter.dart';
import 'counter_value.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyDataProvider()),
      ],
      child: MaterialApp(
        title: 'Multiple Routes Example',
        theme: ThemeData(primarySwatch: Colors.blueGrey, fontFamily: "Roboto"),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/message': (context) => Message(),
          '/counter': (context) => Counter(),
          '/messagevalue': (context) => MessageValue(),
          '/countervalue': (context) => CounterValue(),
        },
      ),
    );
  }
}

class MyDataProvider with ChangeNotifier {
  int _counter = 0;
  String message = 'Go to Message Screen and type something...';

  int get counter => _counter;

  void updateMessage(String newMessage) {
    message = newMessage;
    notifyListeners();
  }

  void increment() {
    _counter++;
    notifyListeners();
  }

  void reset() {
    _counter = 0;
    notifyListeners();
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(148, 60))),
                onPressed: () {
                  Navigator.pushNamed(context, '/message');
                },
                child: const Text('Message', style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(
                width: 15,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(148, 60))),
                onPressed: () {
                  Navigator.pushNamed(context, '/counter');
                },
                child: const Text('Counter', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(148, 60))),
                onPressed: () {
                  Navigator.pushNamed(context, '/messagevalue');
                },
                child:
                    const Text('Message Value', style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(
                width: 15,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(148, 60))),
                onPressed: () {
                  Navigator.pushNamed(context, '/countervalue');
                },
                child:
                    const Text('Counter Value', style: TextStyle(fontSize: 20)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
