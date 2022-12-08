import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:meteor/resources/meteor_theme.dart';
import 'package:meteor/widgets/meteor_textfield.dart';

import 'widgets/meteor_switch.dart';

void main() {
  runApp(
    EasyDynamicThemeWidget(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, extensions: const [
        MeteorTheme.light,
      ]),
      darkTheme: ThemeData(useMaterial3: true, extensions: const [
        MeteorTheme.dark,
      ]),
      themeMode: EasyDynamicTheme.of(context).themeMode,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyHomePage(
        title: 'Meteor UI Demo',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _switchState = false;
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    final MeteorTheme theme = Theme.of(context).extension<MeteorTheme>()!;

    return Scaffold(
      backgroundColor: theme.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackground,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 16.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark mode",
                  style: theme.textStyle,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                MeteorSwitch(
                  value: _darkMode,
                  onChanged: (value) {
                    setState(() {
                      _darkMode = !_darkMode;
                      EasyDynamicTheme.of(context).changeTheme(dark: _darkMode);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
        title: Text(
          widget.title,
        ),
        titleTextStyle: theme.textStyle?.copyWith(fontSize: 24.0),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Text Field",
                style: theme.textStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              const MyCustomForm(),
              const SizedBox(
                height: 16.0,
              ),
              Divider(
                thickness: 4.0,
                indent: 16.0,
                endIndent: 16.0,
                color: theme.outline,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                "Switch",
                style: theme.textStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Switch is ${_switchState ? "on" : "off"}',
                    style: theme.textStyle,
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
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final MeteorTheme theme = Theme.of(context).extension<MeteorTheme>()!;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          MeteorTextField(
            hintText: "Enter some text here!",
            validator: (text) {
              if (text == null || text.isEmpty) {
                return "Please enter some text!";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 16.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.containerBackground,
              foregroundColor: theme.outline,
            ),
            onPressed: () {
              _formKey.currentState!.validate();
            },
            child: Text(
              "Submit",
              style: theme.textStyle,
            ),
          )
        ],
      ),
    );
  }
}
