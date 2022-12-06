import 'package:flutter/material.dart';
import 'package:meteor/resources/meteor_theme.dart';
import 'package:meteor/widgets/meteor_textfield.dart';

import 'widgets/meteor_switch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MeteorTheme(
      key: key,
      isDarkTheme: false,
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: const MyHomePage(title: 'Meteor UI Demo'),
      ),
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
      backgroundColor: MeteorTheme.of(context)!.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: MeteorTheme.of(context)!.scaffoldBackground,
        title: Text(
          widget.title,
        ),
        titleTextStyle:
            MeteorTheme.of(context)!.textStyle.copyWith(fontSize: 32.0),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Text Field",
              style: MeteorTheme.of(context)!.textStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            const MeteorTextField(hintText: "This is a hint"),
            const SizedBox(
              height: 100,
            ),
            Text(
              "Switch",
              style: MeteorTheme.of(context)!.textStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Switch is ${_switchState ? "on" : "off"}',
                  style: MeteorTheme.of(context)!.textStyle,
                ),
                const SizedBox(
                  height: 100,
                ),
                MeteorSwitch(
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
