import 'package:flutter/material.dart';
import 'widgets/customswitch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF505050)),
        // primarySwatch: Colors.red,
        useMaterial3: true,
      ),
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Simplex UI Demo'),
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
  bool _switchState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Switch"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Switch is ${_switchState ? "on" : "off"}'),
                CustomSwitch(
                  value: _switchState,
                  onChanged: (value) {
                    setState(() {
                      _switchState = !_switchState;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
