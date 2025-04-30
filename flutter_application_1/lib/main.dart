import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: _isSwitched ? Colors.yellow : Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child:
                    _isSwitched
                        ? Icon(
                          Icons.lightbulb,
                          key: ValueKey(1),
                          size: 80,
                          color: Colors.orange,
                        )
                        : Icon(
                          Icons.lightbulb_outline,
                          key: ValueKey(2),
                          size: 80,
                          color: Colors.grey,
                        ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Switch is ${_isSwitched ? "ON" : "OFF"}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            Switch(
              value: _isSwitched,
              activeColor: Colors.green,
              inactiveThumbColor: Colors.red,
              inactiveTrackColor: Colors.red[200],
              onChanged: (value) {
                setState(() {
                  _isSwitched = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
